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
    
    static let bowl = StoreItem(id: 0, name: "Basic Bowl", price: 0, image: #imageLiteral(resourceName: "shopbowl"), description: "Basic Food Bowl")
    
	static let mouse = StoreItem(id: 1, name: "Basic Mouse", price: 0, image: #imageLiteral(resourceName: "shopmouse"), description: "Basic Mouse")
    
	static let bed = StoreItem(id: 2, name: "Basic Bed", price: 0, image: #imageLiteral(resourceName: "shopbed"), description: "Basic Bed")
    
    static let picture = StoreItem(id: 3, name: "Basic Picture", price: 0, image: #imageLiteral(resourceName: "shoppicture"), description: "Default Picture")
    
	static let floor = StoreItem(id: 4, name: "Basic Floor", price: 0, image: #imageLiteral(resourceName: "shopfloor"), description: "Basic Starter Floor")
    
	static let wall = StoreItem(id: 5, name: "Basic Wall", price: 0, image: #imageLiteral(resourceName: "shopwall"), description: "Basic Starter Wall")
	
	static var yellowBed = StoreItem(id: 6, name: "Yellow Bed", price: 50, image: #imageLiteral(resourceName: "shopbedyellow"), description: "Basic Yellow Bed")
	
	static var inventory = [bowl, mouse, bed, picture, floor, wall, yellowBed]
    
    static var purchased: [StoreItem] = []
    static var unpurchased: [StoreItem] = []
}
