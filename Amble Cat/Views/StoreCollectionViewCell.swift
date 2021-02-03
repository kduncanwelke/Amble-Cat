//
//  StoreCollectionViewCell.swift
//  Amble Cat
//
//  Created by Kate Duncan-Welke on 10/19/19.
//  Copyright © 2019 Kate Duncan-Welke. All rights reserved.
//

import UIKit

class StoreCollectionViewCell: UICollectionViewCell {
    
	// MARK: IBOutlets
	
	@IBOutlet weak var cellName: UILabel!
	@IBOutlet weak var currencyImage: UIImageView!
	@IBOutlet weak var cellPrice: UILabel!
	@IBOutlet weak var cellImage: UIImageView!
	@IBOutlet weak var purchasedLabel: UILabel!
    
    private let storeViewModel = StoreViewModel()
    
    func configure(index: IndexPath, segment: Int) {
        cellImage.image = storeViewModel.getImage(index: index)
        cellName.text = storeViewModel.getName(index: index)
        
        if storeViewModel.getPurchaseState(index: index) {
            purchasedLabel.isHidden = false
            cellPrice.isHidden = true
            currencyImage.isHidden = true
        } else {
            purchasedLabel.isHidden = false
            cellPrice.isHidden = false
            currencyImage.isHidden = false
            purchasedLabel.isHidden = true
            cellPrice.text = storeViewModel.getPriceText(index: index)
        }
        
        if storeViewModel.checkIfEquipped(index: index) {
            backgroundColor = UIColor(red:0.40, green:0.90, blue:1.00, alpha:1.0)
        } else {
            backgroundColor = UIColor(red:0.98, green:1.00, blue:0.88, alpha:1.0)
        }
    }
	
}

