//
//  PawShopTableViewCell.swift
//  Amble Cat
//
//  Created by Kate Duncan-Welke on 11/19/19.
//  Copyright © 2019 Kate Duncan-Welke. All rights reserved.
//

import UIKit

class PawShopTableViewCell: UITableViewCell {

    // MARK: IBOutlets
    
    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var details: UILabel!
    @IBOutlet weak var price: UILabel!
    
    private let pawShopViewModel = PawShopViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(index: IndexPath) {
        title.text = pawShopViewModel.getTitle(index: index)
        price.text = pawShopViewModel.getPrice(index: index)
        details.text = pawShopViewModel.getDescrip(index: index)
        picture.image = pawShopViewModel.getImage(index: index)
    }
}
