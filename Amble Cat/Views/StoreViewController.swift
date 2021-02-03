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
    @IBOutlet weak var backButton: UIButton!
    
    
    // MARK: Variables
    
    private let storeViewModel = StoreViewModel()
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
        backButton.layer.cornerRadius = 10
        
        dimView.isHidden = true
		collectionView.dataSource = self
		collectionView.delegate = self
        pawPoints.text = "\(Currency.userTotal)"
        
        storeViewModel.loadPurchaseState()
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
        storeViewModel.saveEquipment()
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
        
        storeViewModel.subtractCurrency(with: item.price)
        
        pawPoints.text = storeViewModel.setPointsLabel()
        
        // make sure point total in main view reflects purchase
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "refreshPoints"), object: nil)
        
        storeViewModel.savePurchaseState()
        Sound.playSound(number: Sounds.tingSound.number)
        collectionView.reloadData()
        
    }
    
    @IBAction func cancelPurchase(_ sender: UIButton) {
        self.view.sendSubviewToBack(confirmPurchaseView)
        dimView.isHidden = true
    }
}

// MARK: Collection View

extension StoreViewController: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storeViewModel.retrieveCounts(segment: segmentedControl.selectedSegmentIndex)
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "storeCell", for: indexPath) as! StoreCollectionViewCell
        
        cell.configure(index: indexPath, segment: segmentedControl.selectedSegmentIndex)
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let cellWidth : CGFloat = min(200.0, ((self.view.frame.size.width - 10)/2))		
		let numberOfCells = floor(self.view.frame.size.width / cellWidth)
		let edgeInsets = (self.view.frame.size.width - (numberOfCells * cellWidth)) / (numberOfCells + 1)
      
		return UIEdgeInsets(top: 0, left: edgeInsets, bottom: 20, right: edgeInsets)
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? StoreCollectionViewCell {
                        
            Sound.playSound(number: Sounds.blopSound.number)
            
            cell.animatePress(completion: { [unowned self] in
                self.isDoneAnimating = true
            })
        
            storeViewModel.setSelected(index: indexPath)
            
            if storeViewModel.getPurchaseState(index: indexPath) {
                storeViewModel.setEquipped(index: indexPath)
                    
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "decorChanged"), object: nil)
                
                Sound.playSound(number: Sounds.tingSound.number)
                return
            } else {
                dimView.isHidden = false
                
                if storeViewModel.sufficientFunds() {
                    // confirm purchase
                    Sound.playSound(number: Sounds.chirpSound.number)
                    areYouSureLabel.text = "Are you sure you want to buy the \(storeViewModel.getName(index: indexPath))?"
                    self.view.bringSubviewToFront(confirmPurchaseView)
                } else {
                    // show alert for insufficient funds
                    self.view.bringSubviewToFront(insufficientFundsView)
                    Sound.playSound(number: Sounds.failSound.number)
                }
            }
        }
		
	}
}
