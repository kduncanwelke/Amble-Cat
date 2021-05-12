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
    static let bowl = StoreItem(id: 0, name: "Pink Bowl", price: 0, shopImage: #imageLiteral(resourceName: "shopbowl"), image: #imageLiteral(resourceName: "bowlpink.png"), description: "Pink Food Bowl", type: .bowl)
    
    static let blueBowl = StoreItem(id: 14, name: "Blue Bowl", price: 300, shopImage: #imageLiteral(resourceName: "shopbowlblue"), image: #imageLiteral(resourceName: "bowlblue.png"), description: "Blue Food Bowl", type: .bowl)
    
    static let greenBowl = StoreItem(id: 15, name: "Green Bowl", price: 300, shopImage: #imageLiteral(resourceName: "shopbowlgreen"), image: #imageLiteral(resourceName: "bowlgreen.png"), description: "Green Food Bowl", type: .bowl)
    
    static let yellowBowl = StoreItem(id: 16, name: "Yellow Bowl", price: 300, shopImage: #imageLiteral(resourceName: "shopbowlyellow"), image: #imageLiteral(resourceName: "bowlyellow.png"), description: "Yellow Food Bowl", type: .bowl)
    
    static let whiteBowl = StoreItem(id: 17, name: "White Bowl", price: 500, shopImage: #imageLiteral(resourceName: "shopbowlwhite"), image: #imageLiteral(resourceName: "bowlwhite.png"), description: "White Food Bowl", type: .bowl)
    
    static let blackBowl = StoreItem(id: 37, name: "Black Bowl", price: 500, shopImage: #imageLiteral(resourceName: "shopbowlblack.png"), image: #imageLiteral(resourceName: "bowlblack.png"), description: "Black Food Bowl", type: .bowl)
    
    
    // Water Bowls
    static let blueWaterBowl = StoreItem(id: 51, name: "Blue Fountain", price: 250, shopImage: #imageLiteral(resourceName: "shopbluewaterbowl.png"), image: #imageLiteral(resourceName: "nowaterblue.png"), description: "Blue Water Bowl", type: .waterbowl)
    
    static let greenWaterBowl = StoreItem(id: 52, name: "Green Fountain", price: 250, shopImage: #imageLiteral(resourceName: "shopgreenwaterbowl.png"), image: #imageLiteral(resourceName: "nowatergreen.png"), description: "Green Water Bowl", type: .waterbowl)
    
    static let yellowWaterBowl = StoreItem(id: 53, name: "Yellow Fountain", price: 250, shopImage: #imageLiteral(resourceName: "shopyellowwaterbowl.png"), image: #imageLiteral(resourceName: "nowateryellow.png"), description: "Yellow Water Bowl", type: .waterbowl)
    
    static let whiteWaterBowl = StoreItem(id: 54, name: "White Fountain", price: 450, shopImage: #imageLiteral(resourceName: "shopwhitewaterbowl.png"), image: #imageLiteral(resourceName: "nowaterwhite.png"), description: "White Water Bowl", type: .waterbowl)
    
    static let blackWaterBowl = StoreItem(id: 55, name: "Black Fountain", price: 450, shopImage: #imageLiteral(resourceName: "shopblackwaterbowl.png"), image: #imageLiteral(resourceName: "nowaterblack.png"), description: "Black Water Bowl", type: .waterbowl)
    
    
    // Toys
    static let mouse = StoreItem(id: 1, name: "Mouse", price: 0, shopImage: #imageLiteral(resourceName: "shopmouse"), image: #imageLiteral(resourceName: "mouse.png"), description: "Mouse Toy", type: .toy)
    
    static let ball = StoreItem(id: 23, name: "Ball", price: 300, shopImage: #imageLiteral(resourceName: "shopball.png"), image: #imageLiteral(resourceName: "ball.png"), description: "Ball Toy", type: .toy)
    
    static let cupcake = StoreItem(id: 24, name: "Plush Cupcake", price: 450, shopImage: #imageLiteral(resourceName: "shopcupcake.png"), image: #imageLiteral(resourceName: "cupcake.png"), description: "Cupcake Toy", type: .toy)
    
    static let doughnut = StoreItem(id: 25, name: "Plush Doughnut", price: 600, shopImage: #imageLiteral(resourceName: "shopdoughnut.png"), image: #imageLiteral(resourceName: "doughnut.png"), description: "Doughnut Toy", type: .toy)
    
    static let fish = StoreItem(id: 26, name: "Fishie", price: 600, shopImage: #imageLiteral(resourceName: "shopfish.png"), image: #imageLiteral(resourceName: "fish.png"), description: "Fish Toy", type: .toy)
    
    static let candycane = StoreItem(id: 40, name: "Candycane", price: 300, shopImage: #imageLiteral(resourceName: "shopcandycane.png"), image: #imageLiteral(resourceName: "peppermint.png"), description: "Candycane Toy", type: .toy)
    

    // Pictures
    static let picture = StoreItem(id: 3, name: "Ocean Picture", price: 0, shopImage: #imageLiteral(resourceName: "shoppicture"), image: #imageLiteral(resourceName: "picture.png"), description: "Default Painting", type: .picture)
    
    static let forest = StoreItem(id: 32, name: "Forest Picture", price: 1800, shopImage: #imageLiteral(resourceName: "shopforest.png"), image: #imageLiteral(resourceName: "forest.png"), description: "Forest Painting", type: .picture)
    
    static let sunset = StoreItem(id: 33, name: "Sunset Picture", price: 1200, shopImage: #imageLiteral(resourceName: "shopsunset.png"), image: #imageLiteral(resourceName: "sunset.png"), description: "Sunset Painting", type: .picture)
    
    static let abstract = StoreItem(id: 34, name: "Abstract Picture", price: 1800, shopImage: #imageLiteral(resourceName: "shopabstract.png"), image: #imageLiteral(resourceName: "abstract.png"), description: "Abstract Painting", type: .picture)
    
    static let cat = StoreItem(id: 35, name: "Cat Picture", price: 1200, shopImage: #imageLiteral(resourceName: "shopcat.png"), image: #imageLiteral(resourceName: "cat.png"), description: "Cat Painting", type: .picture)
    
    
    // Floors
    static let floor = StoreItem(id: 4, name: "Basic Floor", price: 0, shopImage: #imageLiteral(resourceName: "shopfloor"), image: #imageLiteral(resourceName: "floorbrown.png"), description: "Starter Wood Floor", type: .floor)
    
    static let darkFloor = StoreItem(id: 7, name: "Walnut Floor", price: 1200, shopImage: #imageLiteral(resourceName: "shopfloordark"), image: #imageLiteral(resourceName: "floordark.png"), description: "Dark Wood Floor", type: .floor)
    
    static let whiteFloor = StoreItem(id: 8, name: "White Floor", price: 1200, shopImage: #imageLiteral(resourceName: "shopfloorwhite"), image: #imageLiteral(resourceName: "floorwhite.png"), description: "White Wood Floor", type: .floor)
    
    static let blondFloor = StoreItem(id: 9, name: "Poplar Floor", price: 1800, shopImage: #imageLiteral(resourceName: "shopfloorblond"), image: #imageLiteral(resourceName: "floorblonde.png"), description: "Light Wood Floor", type: .floor)
    
    static let blackFloor = StoreItem(id: 10, name: "Black Floor", price: 1800, shopImage: #imageLiteral(resourceName: "shopfloorblack"), image: #imageLiteral(resourceName: "floorblack.png"), description: "Black Wood Floor", type: .floor)
    
    static let redFloor = StoreItem(id: 22, name: "Cedar Floor", price: 1800, shopImage: #imageLiteral(resourceName: "shopfloorred.png"), image: #imageLiteral(resourceName: "floorred.png"), description: "Cedar Wood Floor", type: .floor)
    
    
    // Walls
    static let wall = StoreItem(id: 5, name: "Blue Wall", price: 0, shopImage: #imageLiteral(resourceName: "shopwall"), image: #imageLiteral(resourceName: "bluewall.png"), description: "Blue Painted Wall", type: .wall)
    
    static let yellowWall = StoreItem(id: 18, name: "Yellow Wall", price: 600, shopImage: #imageLiteral(resourceName: "shopwallyellow.png"), image: #imageLiteral(resourceName: "yellowwall.png"), description: "Yellow Painted Wall", type: .wall)
    
    static let mintWall = StoreItem(id: 41, name: "Mint Wall", price: 600, shopImage: #imageLiteral(resourceName: "shopwallmint.png"), image: #imageLiteral(resourceName: "mintwall.png"), description: "Mint Painted Wall", type: .wall)
    
    static let greyWall = StoreItem(id: 19, name: "Grey Wall", price: 600, shopImage: #imageLiteral(resourceName: "shopwallgrey.png"), image: #imageLiteral(resourceName: "greywall.png"), description: "Grey Painted Wall", type: .wall)
    
    static let redWall = StoreItem(id: 20, name: "Red Wall", price: 600, shopImage: #imageLiteral(resourceName: "shopwallred.png"), image: #imageLiteral(resourceName: "redwall.png"), description: "Red Painted Wall", type: .wall)
    
    static let pawprintWall = StoreItem(id: 21, name: "Pawprint Wall", price: 1800, shopImage: #imageLiteral(resourceName: "shopwallpawprint.png"), image: #imageLiteral(resourceName: "pawprintwall.png"), description: "Pawprint Wallpaper", type: .wall)
    
    static let stripedWall = StoreItem(id: 39, name: "Striped Wall", price: 1200, shopImage: #imageLiteral(resourceName: "shopwallstriped.png"), image: #imageLiteral(resourceName: "stripedwall.png"), description: "Striped Wallpaper", type: .wall)
	
    
    // Beds
    static let bed = StoreItem(id: 2, name: "Blue Bed", price: 0, shopImage: #imageLiteral(resourceName: "shopbed"), image: #imageLiteral(resourceName: "bedblue.png"), description: "Blue Cozy Bed", type: .bed)
    
    static let yellowBed = StoreItem(id: 6, name: "Yellow Bed", price: 300, shopImage: #imageLiteral(resourceName: "shopbedyellow"), image: #imageLiteral(resourceName: "bedyellow.png"), description: "Yellow Cozy Bed", type: .bed)
    
    static let greenBed = StoreItem(id: 11, name: "Green Bed", price: 300, shopImage: #imageLiteral(resourceName: "shopbedgreen"), image: #imageLiteral(resourceName: "bedgreen"), description: "Green Cozy Bed", type: .bed)
    
    static let pinkBed = StoreItem(id: 12, name: "Pink Bed", price: 300, shopImage: #imageLiteral(resourceName: "shopbedpink"), image: #imageLiteral(resourceName: "bedpink"), description: "Pink Cozy Bed", type: .bed)
    
    static let whiteBed = StoreItem(id: 13, name: "White Bed", price: 500, shopImage: #imageLiteral(resourceName: "shopbedwhite"), image: #imageLiteral(resourceName: "bedwhite"), description: "White Cozy Bed", type: .bed)
    
    static let blackBed = StoreItem(id: 38, name: "Black Bed", price: 500, shopImage: #imageLiteral(resourceName: "shopbedblack.png"), image: #imageLiteral(resourceName: "bedblack.png"), description: "Black Cozy Bed", type: .bed)
    
    
    // Windows
    static let basicView = StoreItem(id: 27, name: "Blue Sky", price: 0, shopImage: #imageLiteral(resourceName: "shopwindow.png"), image: #imageLiteral(resourceName: "window.png"), description: "Clear Sky View", type: .window)
    
    static let mountainView = StoreItem(id: 28, name: "Mountain Scene", price: 1500, shopImage: #imageLiteral(resourceName: "shopmountain.png"), image: #imageLiteral(resourceName: "mountain.png"), description: "Mountainous View", type: .window)
    
    static let winterView = StoreItem(id: 29, name: "Winter Scene", price: 1500, shopImage: #imageLiteral(resourceName: "shopwinter.png"), image: #imageLiteral(resourceName: "frost.png"), description: "Wintery View", type: .window)
    
    static let farmView = StoreItem(id: 30, name: "Farm Scene", price: 1500, shopImage: #imageLiteral(resourceName: "shopfarm.png"), image: #imageLiteral(resourceName: "farm.png"), description: "Country View", type: .window)
    
    static let oceanView = StoreItem(id: 31, name: "Ocean Scene", price: 1500, shopImage: #imageLiteral(resourceName: "shopocean.png"), image: #imageLiteral(resourceName: "ocean.png"), description: "Seaside View", type: .window)
    
    static let nightView = StoreItem(id: 36, name: "Night Scene", price: 1800, shopImage: #imageLiteral(resourceName: "shopnight.png"), image: #imageLiteral(resourceName: "night.png"), description: "Nighttime View", type: .window)
    
    static let frostView = StoreItem(id: 48, name: "Frosty Scene", price: 1500, shopImage: #imageLiteral(resourceName: "shopfrost.png"), image: #imageLiteral(resourceName: "frost.png"), description: "Frosty Window View", type: .window)
    
    
    // Rugs
    static let noRug = StoreItem(id: 42, name: "No Rug", price: 0, shopImage: #imageLiteral(resourceName: "shopnorug.png"), image: #imageLiteral(resourceName: "none.png"), description: "No Rug", type: .rug)
    
    static let redRug = StoreItem(id: 43, name: "Red Rug", price: 500, shopImage: #imageLiteral(resourceName: "shopredrug.png"), image: #imageLiteral(resourceName: "redrug.png"), description: "Red Round Rug", type: .rug)
	
    static let tanRug = StoreItem(id: 44, name: "Tan Rug", price: 500, shopImage: #imageLiteral(resourceName: "shoptanrug.png"), image: #imageLiteral(resourceName: "tanrug.png"), description: "Tan Round Rug", type: .rug)
    
    static let ecruRug = StoreItem(id: 45, name: "Ecru Rug", price: 500, shopImage: #imageLiteral(resourceName: "shopecrurug.png"), image: #imageLiteral(resourceName: "ecrurug.png"), description: "Ecru Round Rug", type: .rug)
    
    static let christmasRug = StoreItem(id: 46, name: "Red and Green Rug", price: 800, shopImage: #imageLiteral(resourceName: "redandgreenrugshop.png"), image: #imageLiteral(resourceName: "christmasrug.png"), description: "Red/Green Round Rug", type: .rug)
    
    static let blueRug = StoreItem(id: 47, name: "Blue Rug", price: 500, shopImage: #imageLiteral(resourceName: "shoprugblue.png"), image: #imageLiteral(resourceName: "bluerug.png"), description: "Blue Round Rug", type: .rug)
    
    // Couches
    
    static let greenCouch = StoreItem(id: 56, name: "Green Couch", price: 1000, shopImage: #imageLiteral(resourceName: "shopcouchgreen.png"), image: #imageLiteral(resourceName: "couchgreen.png"), description: "Green Cozy Couch", type: .couch)
    
    static let yellowCouch = StoreItem(id: 57, name: "Yellow Couch", price: 1000, shopImage: #imageLiteral(resourceName: "shopcouchyellow.png"), image: #imageLiteral(resourceName: "couchyellow.png"), description: "Yellow Cozy Couch", type: .couch)
    
    static let blueCouch = StoreItem(id: 58, name: "Blue Couch", price: 1000, shopImage: #imageLiteral(resourceName: "shopcouchgreen.png"), image: #imageLiteral(resourceName: "couchgreen.png"), description: "Blue Cozy Couch", type: .couch)
    
    static let pinkCouch = StoreItem(id: 59, name: "Pink Couch", price: 1000, shopImage: #imageLiteral(resourceName: "shopcouchpink.png"), image: #imageLiteral(resourceName: "couchpink.png"), description: "Pink Cozy Couch", type: .couch)
    
    static let whiteCouch = StoreItem(id: 60, name: "White Couch", price: 1200, shopImage: #imageLiteral(resourceName: "shopcouchwhite.png"), image: #imageLiteral(resourceName: "couchwhite.png"), description: "White Cozy Couch", type: .couch)
    
    static let blackCouch = StoreItem(id: 61, name: "Black Couch", price: 1200, shopImage: #imageLiteral(resourceName: "shopcouchblack.png"), image: #imageLiteral(resourceName: "couchblack.png"), description: "Black Cozy Couch", type: .couch)
    
    // Decor
    static let holly = StoreItem(id: 49, name: "Holly Hanging", price: 800, shopImage: #imageLiteral(resourceName: "shopholly.png"), image: #imageLiteral(resourceName: "holly.png"), description: "Holly Window Hanging", type: .decor)
    
    static let noDecor = StoreItem(id: 50, name: "No Decor", price: 0, shopImage: #imageLiteral(resourceName: "shopnorug.png"), image: #imageLiteral(resourceName: "none.png"), description: "No Decor", type: .decor)
    
	static var inventory = [bowl, blueBowl, greenBowl, yellowBowl, whiteBowl, blackBowl, blueWaterBowl, greenWaterBowl, yellowWaterBowl, whiteWaterBowl, blackWaterBowl, bed, yellowBed, greenBed, pinkBed, whiteBed, blackBed, mouse, ball, candycane, cupcake, doughnut, fish, picture, sunset, cat, forest, abstract, greenCouch, yellowCouch, blueCouch, pinkCouch, whiteCouch, blackCouch, noDecor, holly, wall, yellowWall, mintWall, greyWall, redWall, stripedWall, pawprintWall, basicView, mountainView, winterView, farmView, oceanView, frostView, nightView, noRug, redRug, tanRug, blueRug, ecruRug, christmasRug, floor, darkFloor, whiteFloor, blondFloor, redFloor, blackFloor]
    
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
        31: oceanView,
        32: forest,
        33: sunset,
        34: abstract,
        35: cat,
        36: nightView,
        37: blackBowl,
        38: blackBed,
        39: stripedWall,
        40: candycane,
        41: mintWall,
        42: noRug,
        43: redRug,
        44: tanRug,
        45: ecruRug,
        46: christmasRug,
        47: blueRug,
        48: frostView,
        49: holly,
        50: noDecor,
        51: blueWaterBowl,
        52: greenWaterBowl,
        53: yellowWaterBowl,
        54: whiteWaterBowl,
        55: blackWaterBowl,
        56: greenCouch,
        57: yellowCouch,
        58: blueCouch,
        59: pinkCouch,
        60: whiteCouch,
        61: blackCouch
    ]
    
    static var purchased: [StoreItem] = []
    static var unpurchased: [StoreItem] = []
}
