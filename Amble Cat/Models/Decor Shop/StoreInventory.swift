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
    
    static let orangeBed = StoreItem(id: 111, name: "Orange Bed", price: 600, shopImage: #imageLiteral(resourceName: "shopbedorange.png"), image: #imageLiteral(resourceName: "bedorange.png"), description: "Orange Cozy Bed", type: .bed)
    
    static let mintBed = StoreItem(id: 112, name: "Mint Bed", price: 600, shopImage: #imageLiteral(resourceName: "shopbedmint.png"), image: #imageLiteral(resourceName: "bedmint.png"), description: "Mint Cozy Bed", type: .bed)
    
    
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
    
    static let orangeRug = StoreItem(id: 109, name: "Orange Rug", price: 700, shopImage: #imageLiteral(resourceName: "shoporangerug.png"), image: #imageLiteral(resourceName: "orangerug.png"), description: "Orange Round Rug", type: .rug)
    
    static let mintRug = StoreItem(id: 110, name: "Mint Rug", price: 700, shopImage: #imageLiteral(resourceName: "shopmintrug.png"), image: #imageLiteral(resourceName: "mintrug.png"), description: "Mint Round Rug", type: .rug)
    
    // Couches
    
    static let greenCouch = StoreItem(id: 56, name: "Green Couch", price: 1000, shopImage: #imageLiteral(resourceName: "shopcouchgreen.png"), image: #imageLiteral(resourceName: "couchgreen.png"), description: "Green Cozy Couch", type: .couch)
    
    static let yellowCouch = StoreItem(id: 57, name: "Yellow Couch", price: 1000, shopImage: #imageLiteral(resourceName: "shopcouchyellow.png"), image: #imageLiteral(resourceName: "couchyellow.png"), description: "Yellow Cozy Couch", type: .couch)
    
    static let blueCouch = StoreItem(id: 58, name: "Blue Couch", price: 1000, shopImage: #imageLiteral(resourceName: "shopcouchblue.png"), image: #imageLiteral(resourceName: "couchblue.png"), description: "Blue Cozy Couch", type: .couch)
    
    static let pinkCouch = StoreItem(id: 59, name: "Pink Couch", price: 1000, shopImage: #imageLiteral(resourceName: "shopcouchpink.png"), image: #imageLiteral(resourceName: "couchpink.png"), description: "Pink Cozy Couch", type: .couch)
    
    static let whiteCouch = StoreItem(id: 60, name: "White Couch", price: 1200, shopImage: #imageLiteral(resourceName: "shopcouchwhite.png"), image: #imageLiteral(resourceName: "couchwhite.png"), description: "White Cozy Couch", type: .couch)
    
    static let blackCouch = StoreItem(id: 61, name: "Black Couch", price: 1200, shopImage: #imageLiteral(resourceName: "shopcouchblack.png"), image: #imageLiteral(resourceName: "couchblack.png"), description: "Black Cozy Couch", type: .couch)
    
    static let orangeCouch = StoreItem(id: 113, name: "Orange Couch", price: 1200, shopImage: #imageLiteral(resourceName: "shopcouchorange.png"), image: #imageLiteral(resourceName: "couchorange.png"), description: "Orange Cozy Couch", type: .couch)
    
    static let mintCouch = StoreItem(id: 114, name: "Mint Couch", price: 1200, shopImage: #imageLiteral(resourceName: "shopcouchmint.png"), image: #imageLiteral(resourceName: "couchmint.png"), description: "Mint Cozy Couch", type: .couch)
    
    // Bath toys
    
    static let soap = StoreItem(id: 62, name: "Soap", price: 0, shopImage: #imageLiteral(resourceName: "shopsoap.png"), image: #imageLiteral(resourceName: "soap.png"), description: "Soap Bath Toy", type: .bathtoy)
    
    static let toothbrush = StoreItem(id: 63, name: "Toothbrush", price: 300, shopImage: #imageLiteral(resourceName: "shoptoothbrush.png"), image: #imageLiteral(resourceName: "toothbrush.png"), description: "Toothbrush Bath Toy", type: .bathtoy)
    
    static let shark = StoreItem(id: 64, name: "Shark", price: 450, shopImage: #imageLiteral(resourceName: "shopshark.png"), image: #imageLiteral(resourceName: "shark.png"), description: "Shark Bath Toy", type: .bathtoy)
    
    static let starfish = StoreItem(id: 65, name: "Starfish", price: 450, shopImage: #imageLiteral(resourceName: "shopstarfish.png"), image: #imageLiteral(resourceName: "starfish.png"), description: "Starfish Bath Toy", type: .bathtoy)
    
    // Towels
    
    static let blackTowels = StoreItem(id: 66, name: "Black Towels", price: 400, shopImage: #imageLiteral(resourceName: "shoptowelsblack.png"), image: #imageLiteral(resourceName: "towelsblack.png"), description: "Black Bath Towels", type: .towel)
    
    static let yellowTowels = StoreItem(id: 67, name: "Yellow Towels", price: 0, shopImage: #imageLiteral(resourceName: "shoptowelsyellow.png"), image: #imageLiteral(resourceName: "towelsyellow.png"), description: "Yellow Bath Towels", type: .towel)
    
    static let blueTowels = StoreItem(id: 68, name: "Blue Towels", price: 300, shopImage: #imageLiteral(resourceName: "shoptowelsblue.png"), image: #imageLiteral(resourceName: "towelsblue.png"), description: "Blue Bath Towels", type: .towel)
    
    static let greenTowels = StoreItem(id: 69, name: "Green Towels", price: 300, shopImage: #imageLiteral(resourceName: "shoptowelsgreen.png"), image: #imageLiteral(resourceName: "towelsgreen.png"), description: "Green Bath Towels", type: .towel)
    
    static let whiteTowels = StoreItem(id: 70, name: "White Towels", price: 400, shopImage: #imageLiteral(resourceName: "shoptowelswhite.png"), image: #imageLiteral(resourceName: "towelswhite.png"), description: "White Bath Towels", type: .towel)
    
    static let pinkTowels = StoreItem(id: 71, name: "Pink Towels", price: 400, shopImage: #imageLiteral(resourceName: "shoptowelspink.png"), image: #imageLiteral(resourceName: "towelspink.png"), description: "Pink Bath Towels", type: .towel)
    
    // Cabinets
    
    static let brownCabinet = StoreItem(id: 72, name: "Brown Cabinet", price: 900, shopImage: #imageLiteral(resourceName: "shopcabinetbrown.png"), image: #imageLiteral(resourceName: "cabinetbrown.png"), description: "Brown Bathroom Cabinet", type: .cabinet)
    
    static let redCabinet = StoreItem(id: 73, name: "Cedar Cabinet", price: 1000, shopImage: #imageLiteral(resourceName: "shopcabinetred.png"), image: #imageLiteral(resourceName: "cabinetred.png"), description: "Cabinet Bathroom Cabinet", type: .cabinet)
    
    static let whiteCabinet = StoreItem(id: 74, name: "White Cabinet", price: 1200, shopImage: #imageLiteral(resourceName: "shopcabinetwhite.png"), image: #imageLiteral(resourceName: "cabinetwhite.png"), description: "White Bathroom Cabinet", type: .cabinet)
    
    static let blackCabinet = StoreItem(id: 75, name: "Black Cabinet", price: 1200, shopImage: #imageLiteral(resourceName: "shopcabinetblack.png"), image: #imageLiteral(resourceName: "cabinetblack.png"), description: "Black Bathroom Cabinet", type: .cabinet)
    
    static let darkCabinet = StoreItem(id: 76, name: "Walnut Cabinet", price: 900, shopImage: #imageLiteral(resourceName: "shopcabinetdark.png"), image: #imageLiteral(resourceName: "cabinetdark.png"), description: "Walnut Bathroom Cabinet", type: .cabinet)
    
    static let blondCabinet = StoreItem(id: 77, name: "Poplar Cabinet", price: 0, shopImage: #imageLiteral(resourceName: "shopcabinetblonde.png"), image: #imageLiteral(resourceName: "cabinetblonde.png"), description: "Poplar Bathroom Cabinet", type: .cabinet)
    
    // Baths
    
    static let blueBath = StoreItem(id: 78, name: "Blue Bath", price: 0, shopImage: #imageLiteral(resourceName: "shopbathblue.png"), image: #imageLiteral(resourceName: "bathblue.png"), description: "Blue Bathtub", type: .bath)
    
    static let roseBath = StoreItem(id: 79, name: "Rose Bath", price: 1800, shopImage: #imageLiteral(resourceName: "shopbathrose.png"), image: #imageLiteral(resourceName: "bathrose.png"), description: "Rose Bathtub", type: .bath)
    
    static let purpleBath = StoreItem(id: 80, name: "Purple Bath", price: 1500, shopImage: #imageLiteral(resourceName: "shopbathpurple.png"), image: #imageLiteral(resourceName: "bathpurple.png"), description: "Purple Bathtub", type: .bath)
    
    static let whiteBath = StoreItem(id: 81, name: "White Bath", price: 1800, shopImage: #imageLiteral(resourceName: "shopbathwhite.png"), image: #imageLiteral(resourceName: "bathwhite.png"), description: "White Bathtub", type: .bath)
    
    static let yellowBath = StoreItem(id: 82, name: "Yellow Bath", price: 1500, shopImage: #imageLiteral(resourceName: "shopbathyellow.png"), image: #imageLiteral(resourceName: "bathyellow.png"), description: "Yellow Bathtub", type: .bath)
    
    static let greenBath = StoreItem(id: 83, name: "Green Bath", price: 1500, shopImage: #imageLiteral(resourceName: "shopbathgreen.png"), image: #imageLiteral(resourceName: "bathgreen.png"), description: "Green Bathtub", type: .bath)
    
    // Bath mats
    
    static let yellowMat = StoreItem(id: 84, name: "Yellow Mat", price: 250, shopImage: #imageLiteral(resourceName: "shopbathmatyellow.png"), image: #imageLiteral(resourceName: "bathmatyellow.png"), description: "Yellow Bath Mat", type: .bathmat)
    
    static let blackMat = StoreItem(id: 85, name: "Black Mat", price: 300, shopImage: #imageLiteral(resourceName: "shopbathmatblack.png"), image: #imageLiteral(resourceName: "bathmatblack.png"), description: "Black Bath Mat", type: .bathmat)
    
    static let blueMat = StoreItem(id: 86, name: "Blue Mat", price: 250, shopImage: #imageLiteral(resourceName: "shopbathmatblue.png"), image: #imageLiteral(resourceName: "bathmatblue.png"), description: "Blue Bath Mat", type: .bathmat)
    
    static let greenMat = StoreItem(id: 87, name: "Green Mat", price: 250, shopImage: #imageLiteral(resourceName: "shopbathmatgreen.png"), image: #imageLiteral(resourceName: "bathmatgreen.png"), description: "Green Bath Mat", type: .bathmat)
    
    static let pinkMat = StoreItem(id: 88, name: "Pink Mat", price: 250, shopImage: #imageLiteral(resourceName: "shopbathmatpink.png"), image: #imageLiteral(resourceName: "bathmatpink.png"), description: "Pink Bath Mat", type: .bathmat)
    
    static let whiteMat = StoreItem(id: 89, name: "White Mat", price: 0, shopImage: #imageLiteral(resourceName: "shopbathmatwhite.png"), image: #imageLiteral(resourceName: "bathmatwhite.png"), description: "White Bath Mat", type: .bathmat)
    
    // Tile walls
    
    static let orangeTileWall = StoreItem(id: 90, name: "Orange Tile", price: 800, shopImage: #imageLiteral(resourceName: "shoptilewallorange.png"), image: #imageLiteral(resourceName: "tilewallorange.png"), description: "Orange Wall Tile", type: .tilewall)
    
    static let yellowTileWall = StoreItem(id: 91, name: "Yellow Tile", price: 600, shopImage: #imageLiteral(resourceName: "shoptilewallyellow.png"), image: #imageLiteral(resourceName: "tilewallyellow.png"), description: "Yellow Wall Tile", type: .tilewall)
    
    static let mintTileWall = StoreItem(id: 92, name: "Mint Tile", price: 800, shopImage: #imageLiteral(resourceName: "shoptilewallmint.png"), image: #imageLiteral(resourceName: "tilewallmint.png"), description: "Mint Wall Tile", type: .tilewall)
    
    static let blueTileWall = StoreItem(id: 93, name: "Blue Tile", price: 600, shopImage: #imageLiteral(resourceName: "shoptilewallblue.png"), image: #imageLiteral(resourceName: "tilewallblue.png"), description: "Blue Wall Tile", type: .tilewall)
    
    static let pinkTileWall = StoreItem(id: 94, name: "Pink Tile", price: 0, shopImage: #imageLiteral(resourceName: "shoptilewallpink.png"), image: #imageLiteral(resourceName: "tilewallpink.png"), description: "Pink Wall Tile", type: .tilewall)
    
    static let whiteTileWall = StoreItem(id: 95, name: "White Tile", price: 600, shopImage: #imageLiteral(resourceName: "shoptilewallwhite.png"), image: #imageLiteral(resourceName: "tilewallwhite.png"), description: "White Wall Tile", type: .tilewall)
    
    // Tile floors
    
    static let orangeTile = StoreItem(id: 96, name: "Orange Tile", price: 1800, shopImage: #imageLiteral(resourceName: "shoptileorange.png"), image: #imageLiteral(resourceName: "tileorange.png"), description: "Orange Tile Floor", type: .tilefloor)
    
    static let mintTile = StoreItem(id: 97, name: "Mint Tile", price: 1800, shopImage: #imageLiteral(resourceName: "shoptilemint.png"), image: #imageLiteral(resourceName: "tilemint.png"), description: "Mint Tile Floor", type: .tilefloor)
    
    static let yellowTile = StoreItem(id: 98, name: "Yellow Tile", price: 1500, shopImage: #imageLiteral(resourceName: "shoptileyellow.png"), image: #imageLiteral(resourceName: "tileyellow.png"), description: "Yellow Tile Floor", type: .tilefloor)
    
    static let blueTile = StoreItem(id: 99, name: "Blue Tile", price: 1500, shopImage: #imageLiteral(resourceName: "shoptileblue.png"), image: #imageLiteral(resourceName: "tileblue.png"), description: "Blue Tile Floor", type: .tilefloor)
    
    static let pinkTile = StoreItem(id: 100, name: "Pink Tile", price: 1500, shopImage: #imageLiteral(resourceName: "shoptilepink.png"), image: #imageLiteral(resourceName: "tilepink.png"), description: "Pink Tile Floor", type: .tilefloor)
    
    static let whiteTile = StoreItem(id: 101, name: "White Tile", price: 0, shopImage: #imageLiteral(resourceName: "shoptilewhite.png"), image: #imageLiteral(resourceName: "tilewhite.png"), description: "White Tile Floor", type: .tilefloor)
    
    // Bathroom walls
    
    static let ecruBathroom = StoreItem(id: 102, name: "Ecru Wall", price: 0, shopImage: #imageLiteral(resourceName: "shopbathwallecru.png"), image: #imageLiteral(resourceName: "bathwallecru.png"), description: "Ecru Bathroom Wall", type: .bathwall)
    
    static let roseBathroom = StoreItem(id: 103, name: "Rose Wall", price: 1200, shopImage: #imageLiteral(resourceName: "shopbathwallrose.png"), image: #imageLiteral(resourceName: "bathwallrose.png"), description: "Rose Bathroom Wall", type: .bathwall)
    
    static let seafoamBathroom = StoreItem(id: 104, name: "Seafoam Wall", price: 1200, shopImage: #imageLiteral(resourceName: "shopbathwallseafoam.png"), image: #imageLiteral(resourceName: "bathwallseafoam.png"), description: "Seafoam Bathroom Wall", type: .bathwall)
    
    static let lemonBathroom = StoreItem(id: 105, name: "Lemon Wall", price: 600, shopImage: #imageLiteral(resourceName: "shopbathwalllemon.png"), image: #imageLiteral(resourceName: "bathwalllemon.png"), description: "Lemon Bathroom Wall", type: .bathwall)
    
    static let whiteBathroom = StoreItem(id: 106, name: "White Wall", price: 600, shopImage: #imageLiteral(resourceName: "shopbathwallwhite.png"), image: #imageLiteral(resourceName: "bathwallwhite.png"), description: "White Bathroom Wall", type: .bathwall)
    
    static let skyBathroom = StoreItem(id: 107, name: "Sky Wall", price: 600, shopImage: #imageLiteral(resourceName: "shopbathwallsky.png"), image: #imageLiteral(resourceName: "bathwallsky.png"), description: "Sky Bathroom Wall", type: .bathwall)
    
    static let lavenderBathroom = StoreItem(id: 108, name: "Lavender Wall", price: 1200, shopImage: #imageLiteral(resourceName: "shopbathwalllavender.png"), image: #imageLiteral(resourceName: "bathwalllavender.png"), description: "Lavender Bathroom Wall", type: .bathwall)
    
    // Decor
    static let holly = StoreItem(id: 49, name: "Holly Hanging", price: 800, shopImage: #imageLiteral(resourceName: "shopholly.png"), image: #imageLiteral(resourceName: "holly.png"), description: "Holly Window Hanging", type: .decor)
    
    static let noDecor = StoreItem(id: 50, name: "No Decor", price: 0, shopImage: #imageLiteral(resourceName: "shopnorug.png"), image: #imageLiteral(resourceName: "none.png"), description: "No Decor", type: .decor)
    
	static var inventory = [bowl, blueBowl, greenBowl, yellowBowl, whiteBowl, blackBowl, blueWaterBowl, greenWaterBowl, yellowWaterBowl, whiteWaterBowl, blackWaterBowl, bed, yellowBed, greenBed, pinkBed, whiteBed, blackBed, orangeBed, mintBed, mouse, ball, candycane, cupcake, doughnut, fish, picture, sunset, cat, forest, abstract, greenCouch, yellowCouch, blueCouch, pinkCouch, whiteCouch, blackCouch, orangeCouch, mintCouch, soap, toothbrush, shark, starfish, blackTowels, yellowTowels, blueTowels, greenTowels, whiteTowels, pinkTowels, brownCabinet, redCabinet, whiteCabinet, blackCabinet, darkCabinet, blondCabinet, blueBath, roseBath, purpleBath, whiteBath, yellowBath, greenBath, yellowMat, blackMat, blueMat, greenMat, pinkMat, whiteMat, orangeTileWall, yellowTileWall, mintTileWall, blueTileWall, pinkTileWall, whiteTileWall, orangeTile, mintTile, yellowTile, blueTile, pinkTile, whiteTile, ecruBathroom, roseBathroom, seafoamBathroom, lemonBathroom, whiteBathroom, skyBathroom, lavenderBathroom, noDecor, holly, wall, yellowWall, mintWall, greyWall, redWall, stripedWall, pawprintWall, basicView, mountainView, winterView, farmView, oceanView, frostView, nightView, noRug, redRug, tanRug, blueRug, ecruRug, orangeRug, mintRug, christmasRug, floor, darkFloor, whiteFloor, blondFloor, redFloor, blackFloor]
    
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
        61: blackCouch,
        62: soap,
        63: toothbrush,
        64: shark,
        65: starfish,
        66: blackTowels,
        67: yellowTowels,
        68: blueTowels,
        69: greenTowels,
        70: whiteTowels,
        71: pinkTowels,
        72: brownCabinet,
        73: redCabinet,
        74: whiteCabinet,
        75: blackCabinet,
        76: darkCabinet,
        77: blondCabinet,
        78: blueBath,
        79: roseBath,
        80: purpleBath,
        81: whiteBath,
        82: yellowBath,
        83: greenBath,
        84: yellowMat,
        85: blackMat,
        86: blueMat,
        87: greenMat,
        88: pinkMat,
        89: whiteMat,
        90: orangeTileWall,
        91: yellowTileWall,
        92: mintTileWall,
        93: blueTileWall,
        94: pinkTileWall,
        95: whiteTileWall,
        96: orangeTile,
        97: mintTile,
        98: yellowTile,
        99: blueTile,
        100: pinkTile,
        101: whiteTile,
        102: ecruBathroom,
        103: roseBathroom,
        104: seafoamBathroom,
        105: lemonBathroom,
        106: whiteBathroom,
        107: skyBathroom,
        108: lavenderBathroom,
        109: orangeRug,
        110: mintRug,
        111: orangeBed,
        112: mintBed,
        113: orangeCouch,
        114: mintCouch,
    ]
    
    static var purchased: [StoreItem] = []
    static var unpurchased: [StoreItem] = []
}
