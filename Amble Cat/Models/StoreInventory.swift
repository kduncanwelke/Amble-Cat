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
    
    static let ball = StoreItem(id: 23, name: "Ball", price: 50, shopImage: #imageLiteral(resourceName: "shopball.png"), image: #imageLiteral(resourceName: "ball.png"), description: "Ball Toy", type: .toy)
    
    static let cupcake = StoreItem(id: 24, name: "Plush Cupcake", price: 75, shopImage: #imageLiteral(resourceName: "shopcupcake.png"), image: #imageLiteral(resourceName: "cupcake.png"), description: "Cupcake Toy", type: .toy)
    
    static let doughnut = StoreItem(id: 25, name: "Plush Doughnut", price: 100, shopImage: #imageLiteral(resourceName: "shopdoughnut.png"), image: #imageLiteral(resourceName: "doughnut.png"), description: "Doughnut Toy", type: .toy)
    
    static let fish = StoreItem(id: 26, name: "Fishie", price: 100, shopImage: #imageLiteral(resourceName: "shopfish.png"), image: #imageLiteral(resourceName: "fish.png"), description: "Fish Toy", type: .toy)
    

    // Pictures
    static let picture = StoreItem(id: 3, name: "Ocean Picture", price: 0, shopImage: #imageLiteral(resourceName: "shoppicture"), image: #imageLiteral(resourceName: "picture"), description: "Default Picture", type: .picture)
    
    
    // Floors
    static let floor = StoreItem(id: 4, name: "Basic Floor", price: 0, shopImage: #imageLiteral(resourceName: "shopfloor"), image: #imageLiteral(resourceName: "floor"), description: "Basic Starter Floor", type: .floor)
    
    static let darkFloor = StoreItem(id: 7, name: "Walnut Floor", price: 200, shopImage: #imageLiteral(resourceName: "shopfloordark"), image: #imageLiteral(resourceName: "floordark"), description: "Dark Floor", type: .floor)
    
    static let whiteFloor = StoreItem(id: 8, name: "White Floor", price: 200, shopImage: #imageLiteral(resourceName: "shopfloorwhite"), image: #imageLiteral(resourceName: "floorwhite"), description: "White Floor", type: .floor)
    
    static let blondFloor = StoreItem(id: 9, name: "Poplar Floor", price: 200, shopImage: #imageLiteral(resourceName: "shopfloorblond"), image: #imageLiteral(resourceName: "floorblond"), description: "Light Floor", type: .floor)
    
    static let blackFloor = StoreItem(id: 10, name: "Black Floor", price: 200, shopImage: #imageLiteral(resourceName: "shopfloorblack"), image: #imageLiteral(resourceName: "floorblack"), description: "Black Floor", type: .floor)
    
    static let redFloor = StoreItem(id: 22, name: "Cedar Floor", price: 200, shopImage: #imageLiteral(resourceName: "shopfloorred.png"), image: #imageLiteral(resourceName: "floorred.png"), description: "Cedar Floor", type: .floor)
    
    
    // Walls
    static let wall = StoreItem(id: 5, name: "Basic Wall", price: 0, shopImage: #imageLiteral(resourceName: "shopwall"), image: #imageLiteral(resourceName: "wall"), description: "Basic Starter Wall", type: .wall)
    
    static let yellowWall = StoreItem(id: 18, name: "Yellow Wall", price: 100, shopImage: #imageLiteral(resourceName: "shopwallyellow.png"), image: #imageLiteral(resourceName: "yellowwall.png"), description: "Basic Yellow Wall", type: .wall)
    
    static let greyWall = StoreItem(id: 19, name: "Grey Wall", price: 100, shopImage: #imageLiteral(resourceName: "shopwallgrey.png"), image: #imageLiteral(resourceName: "greywall.png"), description: "Basic Grey Wall", type: .wall)
    
    static let redWall = StoreItem(id: 20, name: "Red Wall", price: 100, shopImage: #imageLiteral(resourceName: "shopwallred.png"), image: #imageLiteral(resourceName: "redwall.png"), description: "Basic Red Wall", type: .wall)
    
    static let pawprintWall = StoreItem(id: 21, name: "Pawprint Wall", price: 300, shopImage: #imageLiteral(resourceName: "shopwallpawprint.png"), image: #imageLiteral(resourceName: "pawprint.png"), description: "Pawprint Wallpaper", type: .wall)
	
    
    // Beds
    static let bed = StoreItem(id: 2, name: "Blue Bed", price: 0, shopImage: #imageLiteral(resourceName: "shopbed"), image: #imageLiteral(resourceName: "bed"), description: "Basic Bed", type: .bed)
    
    static let yellowBed = StoreItem(id: 6, name: "Yellow Bed", price: 50, shopImage: #imageLiteral(resourceName: "shopbedyellow"), image: #imageLiteral(resourceName: "yellowbed"), description: "Basic Yellow Bed", type: .bed)
    
    static let greenBed = StoreItem(id: 11, name: "Green Bed", price: 50, shopImage: #imageLiteral(resourceName: "shopbedgreen"), image: #imageLiteral(resourceName: "bedgreen"), description: "Basic Green Bed", type: .bed)
    
    static let pinkBed = StoreItem(id: 12, name: "Pink Bed", price: 50, shopImage: #imageLiteral(resourceName: "shopbedpink"), image: #imageLiteral(resourceName: "bedpink"), description: "Basic Pink Bed", type: .bed)
    
    static let whiteBed = StoreItem(id: 13, name: "White Bed", price: 50, shopImage: #imageLiteral(resourceName: "shopbedwhite"), image: #imageLiteral(resourceName: "bedwhite"), description: "Basic White Bed", type: .bed)
    
    // Windows
    static let basicView = StoreItem(id: 27, name: "Basic View", price: 0, shopImage: #imageLiteral(resourceName: "shopwindow.png"), image: #imageLiteral(resourceName: "basicwindow.png"), description: "Basic View", type: .window)
    
    static let mountainView = StoreItem(id: 28, name: "Mountain Scene", price: 250, shopImage: #imageLiteral(resourceName: "shopmountain.png"), image: #imageLiteral(resourceName: "mountain.png"), description: "Mountain View", type: .window)
    
    static let winterView = StoreItem(id: 29, name: "Winter Scene", price: 250, shopImage: #imageLiteral(resourceName: "shopwinter.png"), image: #imageLiteral(resourceName: "winter.png"), description: "Winter View", type: .window)
    
    static let farmView = StoreItem(id: 30, name: "Farm Scene", price: 250, shopImage: #imageLiteral(resourceName: "shopfarm.png"), image: #imageLiteral(resourceName: "farm.png"), description: "Farm View", type: .window)
    
     static let oceanView = StoreItem(id: 31, name: "Ocean Scene", price: 250, shopImage: #imageLiteral(resourceName: "shopocean.png"), image: #imageLiteral(resourceName: "ocean.png"), description: "Ocean View", type: .window)
	
    
	static var inventory = [bowl, blueBowl, greenBowl, yellowBowl, whiteBowl, mouse, ball, cupcake, doughnut, fish, picture, wall, yellowWall, greyWall, redWall, pawprintWall, bed, yellowBed, greenBed, pinkBed, whiteBed, basicView, mountainView, winterView, farmView, oceanView, floor, darkFloor, whiteFloor, blondFloor, redFloor, blackFloor]
    
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
        20: redWall,
        21: pawprintWall,
        22: redFloor,
        23: ball,
        24: cupcake,
        25: doughnut,
        26: fish,
        27: basicView,
        28: mountainView,
        29: winterView,
        30: farmView,
        31: oceanView
    ]
    
    static var purchased: [StoreItem] = []
    static var unpurchased: [StoreItem] = []
}
