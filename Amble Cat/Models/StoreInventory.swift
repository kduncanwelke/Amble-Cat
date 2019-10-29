//
//  StoreInventory.swift
//  Amble Cat
//
//  Created by Kate Duncan-Welke on 10/19/19.
//  Copyright © 2019 Kate Duncan-Welke. All rights reserved.
//

import Foundation
import UIKit

struct StoreInventory {
    
    static let bowl = StoreItem(id: 0, name: "Basic Bowl", price: 0, shopImage: #imageLiteral(resourceName: "shopbowl"), image: #imageLiteral(resourceName: "bowl"), description: "Basic Food Bowl", type: .bowl)
    
    static let mouse = StoreItem(id: 1, name: "Basic Mouse", price: 0, shopImage: #imageLiteral(resourceName: "shopmouse"), image: #imageLiteral(resourceName: "mouse"), description: "Basic Mouse", type: .toy)
    
    static let bed = StoreItem(id: 2, name: "Basic Bed", price: 0, shopImage: #imageLiteral(resourceName: "shopbed"), image: #imageLiteral(resourceName: "bed"), description: "Basic Bed", type: .bed)
    
    static let picture = StoreItem(id: 3, name: "Basic Picture", price: 0, shopImage: #imageLiteral(resourceName: "shoppicture"), image: #imageLiteral(resourceName: "picture"), description: "Default Picture", type: .picture)
    
    static let floor = StoreItem(id: 4, name: "Basic Floor", price: 0, shopImage: #imageLiteral(resourceName: "shopfloor"), image: #imageLiteral(resourceName: "floor"), description: "Basic Starter Floor", type: .floor)
    
    static let wall = StoreItem(id: 5, name: "Basic Wall", price: 0, shopImage: #imageLiteral(resourceName: "shopwall"), image: #imageLiteral(resourceName: "wall"), description: "Basic Starter Wall", type: .wall)
	
    static var yellowBed = StoreItem(id: 6, name: "Yellow Bed", price: 50, shopImage: #imageLiteral(resourceName: "shopbedyellow"), image: #imageLiteral(resourceName: "yellowbed"), description: "Basic Yellow Bed", type: .bed)
	
	static var inventory = [bowl, mouse, bed, picture, floor, wall, yellowBed]
    
    static let inventoryDictionary: [Int64: StoreItem] = [
        0: bowl,
        1: mouse,
        2: bed,
        3: picture,
        4: floor,
        5: wall,
        6: yellowBed
    ]
    
    static var purchased: [StoreItem] = []
    static var unpurchased: [StoreItem] = []
}
