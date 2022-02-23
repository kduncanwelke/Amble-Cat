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
        case couch
        case decor
        case toy
        case picture
        case floor
        case rug
        case wall
        case waterbowl
        case window
        
        case bathtoy
        case towel
        case cabinet
        case bath
        case bathmat
        case tilewall
        case tilefloor
        case bathwall

        case backsplash
        case counter
        case fridge
        case kitchenFloor
        case kitchenMat
        case kitchenWall
        case lowerCabinet
        case stove
        case upperCabinet
    }
    
}
