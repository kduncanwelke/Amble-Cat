//
//  ButtonCollectionViewCell.swift
//  Amble Cat
//
//  Created by Kate Duncan-Welke on 12/10/19.
//  Copyright © 2019 Kate Duncan-Welke. All rights reserved.
//

import UIKit

class ButtonCollectionViewCell: UICollectionViewCell {
  
    weak var buttonTapDelegate: ButtonTapDelegate?
    
    // MARK: IBOutlets
    
    @IBOutlet weak var cellButton: UIButton!
    @IBOutlet weak var cellText: UILabel!
    
    // MARK: IBActions
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        self.buttonTapDelegate?.didTap(sender: self)
    }
    
}
