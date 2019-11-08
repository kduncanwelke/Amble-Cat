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
    
    // Bowls
    static let bowl = StoreItem(id: 0, name: "Pink Bowl", price: 0, shopImage: #imageLiteral(resourceName: "shopbowl"), image: #imageLiteral(resourceName: "bowl"), description: "Basic Food Bowl", type: .bowl)
    
    static let blueBowl = StoreItem(id: 14, name: "Blue Bowl", price: 50, shopImage: #imageLiteral(resourceName: "shopbowlblue"), image: #imageLiteral(resourceName: "bluebowl"), description: "Basic Blue Bowl", type: .bowl)
    
    static let greenBowl = StoreItem(id: 15, name: "Green Bowl", price: 50, shopImage: #imageLiteral(resourceName: "shopbowlgreen"), image: #imageLiteral(resourceName: "greenbowl"), description: "Basic Green Bowl", type: .bowl)
    
    static let yellowBowl = StoreItem(id: 16, name: "Yellow Bowl", price: 50, shopImage: #imageLiteral(resourceName: "shopbowlyellow"), image: #imageLiteral(resourceName: "yellowbowl"), description: "Basic Yellow Bowl", type: .bowl)
    
     static let whiteBowl = StoreItem(id: 17, name: "White Bowl", price: 50, shopImage: #imageLiteral(resourceName: "shopbowlwhite"), image: #imageLiteral(resourceName: "whitebowl"), description: "Basic White Bowl", type: .bowl)
    
    
    // Toys
    static let mouse = StoreItem(id: 1, name: "Mouse", price: 0, shopImage: #imageLiteral(resourceName: "shopmouse"), image: #imageLiteral(resourceName: "mouse"), description: "Basic Mouse", type: .toy)
    

    // Pictures
    static let picture = StoreItem(id: 3, name: "Ocean Picture", price: 0, shopImage: #imageLiteral(resourceName: "shoppicture"), image: #imageLiteral(resourceName: "picture"), description: "Default Picture", type: .picture)
    
    
    // Floors
    static let floor = StoreItem(id: 4, name: "Basic Floor", price: 0, shopImage: #imageLiteral(resourceName: "shopfloor"), image: #imageLiteral(resourceName: "floor"), description: "Basic Starter Floor", type: .floor)
    
    static let darkFloor = StoreItem(id: 7, name: "Dark Floor", price: 200, shopImage: #imageLiteral(resourceName: "shopfloordark"), image: #imageLiteral(resourceName: "floordark"), description: "Dark Floor", type: .floor)
    
    static let whiteFloor = StoreItem(id: 8, name: "White Floor", price: 200, shopImage: #imageLiteral(resourceName: "shopfloorwhite"), image: #imageLiteral(resourceName: "floorwhite"), description: "White Floor", type: .floor)
    
    static let blondFloor = StoreItem(id: 9, name: "Blond Floor", price: 200, shopImage: #imageLiteral(resourceName: "shopfloorblond"), image: #imageLiteral(resourceName: "floorblond"), description: "Light Floor", type: .floor)
    
    static let blackFloor = StoreItem(id: 10, name: "Black Floor", price: 200, shopImage: #imageLiteral(resourceName: "shopfloorblack"), image: #imageLiteral(resourceName: "floorblack"), description: "Black Floor", type: .floor)
    
    
    // Walls
    static let wall = StoreItem(id: 5, name: "Basic Wall", price: 0, shopImage: #imageLiteral(resourceName: "shopwall"), image: #imageLiteral(resourceName: "wall"), description: "Basic Starter Wall", type: .wall)
    
    static let yellowWall = StoreItem(id: 18, name: "Yellow Wall", price: 100, shopImage: #imageLiteral(resourceName: "shopwallyellow.png"), image: #imageLiteral(resourceName: "yellowwall.png"), description: "Basic Yellow Wall", type: .wall)
    
    static let greyWall = StoreItem(id: 19, name: "Grey Wall", price: 100, shopImage: #imageLiteral(resourceName: "shopwallgrey.png"), image: #imageLiteral(resourceName: "greywall.png"), description: "Basic Grey Wall", type: .wall)
    
    static let redWall = StoreItem(id: 20, name: "Red Wall", price: 100, shopImage: #imageLiteral(resourceName: "shopwallred.png"), image: #imageLiteral(resourceName: "redwall.png"), description: "Basic Red Wall", type: .wall)
	
    
    // Beds
    static let bed = StoreItem(id: 2, name: "Blue Bed", price: 0, shopImage: #imageLiteral(resourceName: "shopbed"), image: #imageLiteral(resourceName: "bed"), description: "Basic Bed", type: .bed)
    
    static let yellowBed = StoreItem(id: 6, name: "Yellow Bed", price: 50, shopImage: #imageLiteral(resourceName: "shopbedyellow"), image: #imageLiteral(resourceName: "yellowbed"), description: "Basic Yellow Bed", type: .bed)
    
    static let greenBed = StoreItem(id: 11, name: "Green Bed", price: 50, shopImage: #imageLiteral(resourceName: "shopbedgreen"), image: #imageLiteral(resourceName: "bedgreen"), description: "Basic Green Bed", type: .bed)
    
    static let pinkBed = StoreItem(id: 12, name: "Pink Bed", price: 50, shopImage: #imageLiteral(resourceName: "shopbedpink"), image: #imageLiteral(resourceName: "bedpink"), description: "Basic Pink Bed", type: .bed)
    
    static let whiteBed = StoreItem(id: 13, name: "White Bed", price: 50, shopImage: #imageLiteral(resourceName: "shopbedwhite"), image: #imageLiteral(resourceName: "bedwhite"), description: "Basic White Bed", type: .bed)
	
    
	static var inventory = [bowl, blueBowl, greenBowl, yellowBowl, whiteBowl, mouse, bed, picture, floor, wall, yellowWall, greyWall, redWall, yellowBed, greenBed, pinkBed, whiteBed, darkFloor, whiteFloor, blondFloor, blackFloor]
    
    static let inventoryDictionary: [Int64: StoreItem] = [
        0: bowl,
        1: mouse,
        2: bed,
        3: picture,
        4: floor,
        5: wall,
        6: yellowBed,
        7: darkFloor,
        8: whiteFloor,
        9: blondFloor,
        10: blackFloor,
        11: greenBed,
        12: pinkBed,
        13: whiteBed,
        14: blueBowl,
        15: greenBowl,
        16: yellowBowl,
        17: whiteBowl,
        18: yellowWall,
        19: greyWall,
        20: redWall
    ]
    
    static var purchased: [StoreItem] = []
    static var unpurchased: [StoreItem] = []
}
