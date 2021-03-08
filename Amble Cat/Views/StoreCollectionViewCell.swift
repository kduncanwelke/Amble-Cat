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
        storeViewModel.setSource(segment: segment)
        
        cellImage.image = storeViewModel.getImage(index: index)
        cellName.text = storeViewModel.getName(index: index)
        
        if storeViewModel.getPurchaseState(index: index) {
            purchasedLabel.isHidden = false
            purchasedLabel.text = "Purchased"
            cellPrice.isHidden = true
            currencyImage.isHidden = true
            
            if storeViewModel.checkIfEquipped(index: index) {
                backgroundColor = Colors.blue
                purchasedLabel.text = "Equipped"
            } else {
                backgroundColor = UIColor.white
            }
        } else {
            // not purchase
            purchasedLabel.isHidden = false
            cellPrice.isHidden = false
            currencyImage.isHidden = false
            purchasedLabel.isHidden = true
            cellPrice.text = storeViewModel.getPriceText(index: index)
            backgroundColor = Colors.pink
        }
    }
	
}

