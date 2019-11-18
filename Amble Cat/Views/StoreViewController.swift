//
//  StoreViewController.swift
//  Amble Cat
//
//  Created by Kate Duncan-Welke on 10/19/19.
//  Copyright © 2019 Kate Duncan-Welke. All rights reserved.
//

import UIKit
import CoreData

class StoreViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
	
	// MARK: IBOutlets
	
    @IBOutlet weak var pawPoints: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet var insufficientFundsView: UIView!
    @IBOutlet weak var confirmPurchaseView: UIView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var dimView: UIView!
    @IBOutlet weak var areYouSureLabel: UILabel!
    
    
    // MARK: Variables
    
    var selection: StoreItem?
    var index: IndexPath?
    
    var isDoneAnimating = false {
        didSet {
            if isDoneAnimating {
                print("set")
                collectionView.reloadData()
                isDoneAnimating = false
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        confirmPurchaseView.layer.cornerRadius = 20
        insufficientFundsView.layer.cornerRadius = 20
        
        dimView.isHidden = true
		collectionView.dataSource = self
		collectionView.delegate = self
        pawPoints.text = "\(Currency.userTotal)"
        
        loadPurchaseState()
    }
    

    // MARK: Custom functions
    
    func subtractCurrency(with amount: Int) {
        var managedContext = CoreDataManager.shared.managedObjectContext
        
        // rewrite data
        if let currentCurrency = Currency.loaded {
            let newTotal = Currency.userTotal - amount
            Currency.userTotal = newTotal
            currentCurrency.total = Int64(newTotal)
            
            do {
                try managedContext.save()
                print("resave successful")
            } catch {
                // this should never be displayed but is here to cover the possibility
                showAlert(title: "Save failed", message: "Notice: Data has not successfully been saved.")
            }
        } else {
            print("currency loaded is nil")
        }
    }
    
    func loadPurchaseState() {
        // load purchase status
        var managedContext = CoreDataManager.shared.managedObjectContext
        var fetchRequest = NSFetchRequest<PurchaseState>(entityName: "PurchaseState")
        
        do {
            var purchases = try managedContext.fetch(fetchRequest)
            print("purchases loaded")
            
            for purchase in purchases {
                Purchases.purchaseStatus[purchase.id] = purchase.isPurchased
            }
        } catch let error as NSError {
            showAlert(title: "Could not retrieve data", message: "\(error.userInfo)")
        }
        
        StoreInventory.unpurchased.removeAll()
        StoreInventory.purchased.removeAll()
        
        for item in StoreInventory.inventory {
            if Purchases.purchaseStatus[item.id] == nil {
                StoreInventory.unpurchased.append(item)
            } else {
                StoreInventory.purchased.append(item)
            }
        }
    }
    
    func savePurchaseState() {
        var managedContext = CoreDataManager.shared.managedObjectContext
        
        // save purchase status in core data
        guard let item = selection else { return }
        let purchase = PurchaseState(context: managedContext)
        
        purchase.id = item.id
        purchase.isPurchased = true
        
        Purchases.purchaseStatus[purchase.id] = purchase.isPurchased
        
        do {
            try managedContext.save()
            print("saved")
        } catch {
            // this should never be displayed but is here to cover the possibility
            showAlert(title: "Save failed", message: "Notice: Data has not successfully been saved.")
        }
        
        StoreInventory.unpurchased.removeAll()
        StoreInventory.purchased.removeAll()
        
        for item in StoreInventory.inventory {
            if Purchases.purchaseStatus[item.id] == nil {
                StoreInventory.unpurchased.append(item)
            } else {
                StoreInventory.purchased.append(item)
            }
        }
    }
    
    func saveEquipment() {
        var managedContext = CoreDataManager.shared.managedObjectContext
        
        guard let previousSave = DecorManager.equipped else {
            // no save was loaded so this is a new save
            
            let equipment = Equipped(context: managedContext)
            
            equipment.bed = DecorManager.bedID
            equipment.bowl = DecorManager.bowlID
            equipment.decor = DecorManager.decorID
            equipment.floor = DecorManager.floorID
            equipment.picture = DecorManager.pictureID
            equipment.rug = DecorManager.rugID
            equipment.toy = DecorManager.toyID
            equipment.wall = DecorManager.wallID
            equipment.waterbowl = DecorManager.waterID
            equipment.window = DecorManager.windowID
            
            do {
                try managedContext.save()
                print("decor saved")
            } catch {
                // show alert
            }
            
            return
        }
        
        // previous save exists, simply overwrite
        previousSave.bed = DecorManager.bedID
        previousSave.bowl = DecorManager.bowlID
        previousSave.decor = DecorManager.decorID
        previousSave.floor = DecorManager.floorID
        previousSave.picture = DecorManager.pictureID
        previousSave.rug = DecorManager.rugID
        previousSave.toy = DecorManager.toyID
        previousSave.wall = DecorManager.wallID
        previousSave.waterbowl = DecorManager.waterID
        previousSave.window = DecorManager.windowID
        
        do {
            try managedContext.save()
            print("decor resaved")
        } catch {
            // show alert
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
	
	// MARK: IBOutlets
    
    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        collectionView.reloadData()
    }
    
	
	@IBAction func dismissPressed(_ sender: UIButton) {
		self.dismiss(animated: true, completion: nil)
        saveEquipment()
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "refreshView"), object: nil)
	}
    
    @IBAction func okPressed(_ sender: UIButton) {
        self.view.sendSubviewToBack(insufficientFundsView)
        dimView.isHidden = true
    }
    
    @IBAction func purchase(_ sender: UIButton) {
        dimView.isHidden = true
        self.view.sendSubviewToBack(confirmPurchaseView)
        
        guard let item = selection else { return }
        
        subtractCurrency(with: item.price)
        pawPoints.text = "\(Currency.userTotal)"
        
        // make sure point total in main view reflects purchase
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "refreshPoints"), object: nil)
        
        savePurchaseState()
        collectionView.reloadData()
    }
    
    @IBAction func cancelPurchase(_ sender: UIButton) {
        self.view.sendSubviewToBack(confirmPurchaseView)
        dimView.isHidden = true
    }
}

extension StoreViewController: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if segmentedControl.selectedSegmentIndex == 0 {
            return StoreInventory.inventory.count
        } else if segmentedControl.selectedSegmentIndex == 1 {
            return StoreInventory.purchased.count
        } else {
            return StoreInventory.unpurchased.count
        }
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "storeCell", for: indexPath) as! StoreCollectionViewCell
		
		var item: StoreItem
        
        if segmentedControl.selectedSegmentIndex == 0 {
            item = StoreInventory.inventory[indexPath.row]
        } else if segmentedControl.selectedSegmentIndex == 1 {
            item = StoreInventory.purchased[indexPath.row]
        } else {
            item = StoreInventory.unpurchased[indexPath.row]
        }
		
		cell.cellImage.image = item.shopImage
		cell.cellName.text = item.name
		
        if let purchaseState = Purchases.purchaseStatus[item.id] {
            if purchaseState {
                cell.purchasedLabel.isHidden = false
                cell.cellPrice.isHidden = true
                cell.currencyImage.isHidden = true
            }
        } else {
            cell.purchasedLabel.isHidden = false
            cell.cellPrice.isHidden = false
            cell.currencyImage.isHidden = false
            cell.purchasedLabel.isHidden = true
            cell.cellPrice.text = "\(item.price)"
        }
        
        if item.id == DecorManager.bedID || item.id == DecorManager.bowlID || item.id == DecorManager.decorID || item.id == DecorManager.floorID || item.id == DecorManager.pictureID || item.id == DecorManager.rugID || item.id == DecorManager.toyID || item.id == DecorManager.wallID || item.id == DecorManager.waterID || item.id == DecorManager.windowID {
            cell.backgroundColor = UIColor(red:0.40, green:0.90, blue:1.00, alpha:1.0)
        } else {
            cell.backgroundColor = UIColor(red:0.98, green:1.00, blue:0.88, alpha:1.0)
        }
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		let cellWidth : CGFloat = 145.0
		
		let numberOfCells = floor(self.view.frame.size.width / cellWidth)
		let edgeInsets = (self.view.frame.size.width - (numberOfCells * cellWidth)) / (numberOfCells * 2)
		return UIEdgeInsets(top: 0, left: edgeInsets, bottom: 20, right: edgeInsets)
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? StoreCollectionViewCell {
                        
            cell.animatePress(completion: { 
                self.isDoneAnimating = true
            })
        
            if segmentedControl.selectedSegmentIndex == 0 {
                selection = StoreInventory.inventory[indexPath.row]
            } else if segmentedControl.selectedSegmentIndex == 1 {
                selection = StoreInventory.purchased[indexPath.row]
            } else {
                selection = StoreInventory.unpurchased[indexPath.row]
            }
            
            index = indexPath
            
            guard let item = selection else { return }
            
            if let purchaseState = Purchases.purchaseStatus[item.id] {
                if purchaseState {
                    print("purchased")
                    
                    switch item.type {
                    case .bed:
                        DecorManager.bedID = item.id
                    case .bowl:
                        DecorManager.bowlID = item.id
                    case .decor:
                        DecorManager.decorID = item.id
                    case .floor:
                        DecorManager.floorID = item.id
                    case .picture:
                        DecorManager.pictureID = item.id
                    case .rug:
                        DecorManager.rugID = item.id
                    case .toy:
                        DecorManager.toyID = item.id
                    case .wall:
                        DecorManager.wallID = item.id
                    case .waterbowl:
                        DecorManager.waterID = item.id
                    case .window:
                        DecorManager.windowID = item.id
                    }
                    
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "decorChanged"), object: nil)
                       
                    return
                    
                }
            } else {
                dimView.isHidden = false
                
                if Currency.userTotal < item.price {
                    // show alert for insufficient funds
                    self.view.bringSubviewToFront(insufficientFundsView)
                } else {
                    // confirm purchase
                    areYouSureLabel.text = "Are you sure you want to buy the \(item.name)?"
                    self.view.bringSubviewToFront(confirmPurchaseView)
                }
            }
        }
		
	}
}
