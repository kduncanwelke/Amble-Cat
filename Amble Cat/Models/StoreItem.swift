//
//  StoreItem.swift
//  Amble Cat
//
//  Created by Kate Duncan-Welke on 10/19/19.
//  Copyright © 2019 Kate Duncan-Welke. All rights reserved.
//

import Foundation
import UIKit

struct StoreItem {
    
    let id: Int64
    let name: String
    let price: Int
    let shopImage: UIImage
    let image: UIImage
    let description: String
    let type: ItemType
    
    enum ItemType {
        case bed
        case bowl
        case toy
        case picture
        case floor
        case wall
    }
    
}
