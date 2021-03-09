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
    @IBOutlet weak var areYouSureLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    
    // MARK: Variables
    
    private let storeViewModel = StoreViewModel()
    private let viewModel = ViewModel()
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
        backButton.layer.cornerRadius = 10
		collectionView.dataSource = self
		collectionView.delegate = self
        pawPoints.text = "\(viewModel.setPointsLabel())"
        
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
    }
    
    @IBAction func purchase(_ sender: UIButton) {
        self.view.sendSubviewToBack(confirmPurchaseView)
        
        storeViewModel.buy()
        storeViewModel.savePurchaseState()
        pawPoints.text = storeViewModel.setPointsLabel()
        
        // make sure point total in main view reflects purchase
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "refreshPoints"), object: nil)
        
        Sound.playSound(number: Sounds.tingSound.number)
        collectionView.reloadData()
    }
    
    @IBAction func cancelPurchase(_ sender: UIButton) {
        self.view.sendSubviewToBack(confirmPurchaseView)
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
        
		return UIEdgeInsets(top: 0, left: 5, bottom: 20, right: 5)
	}
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let availableWidth = collectionView.frame.width
        var maxNumColumns = 3
        
        if (availableWidth / 3) < 160.0 {
            maxNumColumns = 2
        }
        
        let cellWidth = ((availableWidth-20) / CGFloat(maxNumColumns)).rounded(.down)
        print(cellWidth)
        
        return CGSize(width: cellWidth, height: 200.00)
    }
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? StoreCollectionViewCell {
                        
            cell.animatePress(completion: { [unowned self] in
                self.isDoneAnimating = true
            })
        
            storeViewModel.setSelected(segment: segmentedControl.selectedSegmentIndex, index: indexPath)
            
            if storeViewModel.getPurchaseState(index: indexPath) {
                storeViewModel.setEquipped(index: indexPath)
                    
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "decorChanged"), object: nil)
                
                Sound.playSound(number: Sounds.blopSound.number)
                return
            } else {
                if segmentedControl.selectedSegmentIndex == 1 {
                    // don't attempt purchase in purchased view
                    return
                }
                
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
