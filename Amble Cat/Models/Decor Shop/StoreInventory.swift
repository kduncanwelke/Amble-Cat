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

    static let bowl = StoreItem(id: 0, name: "Pink Bowl", price: 0, shopImage: #imageLiteral(resourceName: "shopbowl" ), image: #imageLiteral(resourceName: "bowlpink.png" ), description: "Pink Food Bowl", type: .bowl)
    
    static let blueBowl = StoreItem(id: 14, name: "Blue Bowl", price: 300, shopImage: #imageLiteral(resourceName: "shopbowlblue" ), image: #imageLiteral(resourceName: "bowlblue.png" ), description: "Blue Food Bowl", type: .bowl)
    
    static let greenBowl = StoreItem(id: 15, name: "Green Bowl", price: 300, shopImage: #imageLiteral(resourceName: "shopbowlgreen" ), image: #imageLiteral(resourceName: "bowlgreen.png" ), description: "Green Food Bowl", type: .bowl)
    
    static let yellowBowl = StoreItem(id: 16, name: "Yellow Bowl", price: 300, shopImage: #imageLiteral(resourceName: "shopbowlyellow" ), image: #imageLiteral(resourceName: "bowlyellow.png" ), description: "Yellow Food Bowl", type: .bowl)
    
    static let whiteBowl = StoreItem(id: 17, name: "White Bowl", price: 500, shopImage: #imageLiteral(resourceName: "shopbowlwhite" ), image: #imageLiteral(resourceName: "bowlwhite.png" ), description: "White Food Bowl", type: .bowl)
    
    static let blackBowl = StoreItem(id: 37, name: "Black Bowl", price: 500, shopImage: #imageLiteral(resourceName: "shopbowlblack.png" ), image: #imageLiteral(resourceName: "bowlblack.png" ), description: "Black Food Bowl", type: .bowl)

    // Water Bowls

    static let blueWaterBowl = StoreItem(id: 51, name: "Blue Fountain", price: 250, shopImage: #imageLiteral(resourceName: "shopbluewaterbowl.png" ), image: #imageLiteral(resourceName: "nowaterblue.png" ), description: "Blue Water Bowl", type: .waterbowl)
    
    static let greenWaterBowl = StoreItem(id: 52, name: "Green Fountain", price: 250, shopImage: #imageLiteral(resourceName: "shopgreenwaterbowl.png" ), image: #imageLiteral(resourceName: "nowatergreen.png" ), description: "Green Water Bowl", type: .waterbowl)
    
    static let yellowWaterBowl = StoreItem(id: 53, name: "Yellow Fountain", price: 250, shopImage: #imageLiteral(resourceName: "shopyellowwaterbowl.png" ), image: #imageLiteral(resourceName: "nowateryellow.png" ), description: "Yellow Water Bowl", type: .waterbowl)
    
    static let whiteWaterBowl = StoreItem(id: 54, name: "White Fountain", price: 450, shopImage: #imageLiteral(resourceName: "shopwhitewaterbowl.png" ), image: #imageLiteral(resourceName: "nowaterwhite.png" ), description: "White Water Bowl", type: .waterbowl)
    
    static let blackWaterBowl = StoreItem(id: 55, name: "Black Fountain", price: 450, shopImage: #imageLiteral(resourceName: "shopblackwaterbowl.png" ), image: #imageLiteral(resourceName: "nowaterblack.png" ), description: "Black Water Bowl", type: .waterbowl)

    // Toys

    static let mouse = StoreItem(id: 1, name: "Mouse", price: 0, shopImage: #imageLiteral(resourceName: "shopmouse" ), image: #imageLiteral(resourceName: "mouse.png" ), description: "Mouse Toy", type: .toy)
    
    static let ball = StoreItem(id: 23, name: "Ball", price: 300, shopImage: #imageLiteral(resourceName: "shopball.png" ), image: #imageLiteral(resourceName: "ball.png" ), description: "Ball Toy", type: .toy)
    
    static let cupcake = StoreItem(id: 24, name: "Plush Cupcake", price: 450, shopImage: #imageLiteral(resourceName: "shopcupcake.png" ), image: #imageLiteral(resourceName: "cupcake.png" ), description: "Cupcake Toy", type: .toy)
    
    static let doughnut = StoreItem(id: 25, name: "Plush Doughnut", price: 600, shopImage: #imageLiteral(resourceName: "shopdoughnut.png" ), image: #imageLiteral(resourceName: "doughnut.png" ), description: "Doughnut Toy", type: .toy)
    
    static let fish = StoreItem(id: 26, name: "Fishie", price: 600, shopImage: #imageLiteral(resourceName: "shopfish.png" ), image: #imageLiteral(resourceName: "fish.png" ), description: "Fish Toy", type: .toy)
    
    static let candycane = StoreItem(id: 40, name: "Candycane", price: 300, shopImage: #imageLiteral(resourceName: "shopcandycane.png" ), image: #imageLiteral(resourceName: "peppermint.png" ), description: "Candycane Toy", type: .toy)

    // Pictures

    static let picture = StoreItem(id: 3, name: "Ocean Picture", price: 0, shopImage: #imageLiteral(resourceName: "shoppicture" ), image: #imageLiteral(resourceName: "picture.png" ), description: "Default Painting", type: .picture)
    
    static let forest = StoreItem(id: 32, name: "Forest Picture", price: 1800, shopImage: #imageLiteral(resourceName: "shopforest.png" ), image: #imageLiteral(resourceName: "forest.png" ), description: "Forest Painting", type: .picture)
    
    static let sunset = StoreItem(id: 33, name: "Sunset Picture", price: 1200, shopImage: #imageLiteral(resourceName: "shopsunset.png" ), image: #imageLiteral(resourceName: "sunset.png" ), description: "Sunset Painting", type: .picture)
    
    static let abstract = StoreItem(id: 34, name: "Abstract Picture", price: 1800, shopImage: #imageLiteral(resourceName: "shopabstract.png" ), image: #imageLiteral(resourceName: "abstract.png" ), description: "Abstract Painting", type: .picture)
    
    static let cat = StoreItem(id: 35, name: "Cat Picture", price: 1200, shopImage: #imageLiteral(resourceName: "shopcat.png" ), image: #imageLiteral(resourceName: "cat.png" ), description: "Cat Painting", type: .picture)

    // Floors

    static let floor = StoreItem(id: 4, name: "Basic Floor", price: 0, shopImage: #imageLiteral(resourceName: "shopfloor" ), image: #imageLiteral(resourceName: "floorbrown.png" ), description: "Starter Wood Floor", type: .floor)
    
    static let darkFloor = StoreItem(id: 7, name: "Walnut Floor", price: 1200, shopImage: #imageLiteral(resourceName: "shopfloordark" ), image: #imageLiteral(resourceName: "floordark.png" ), description: "Dark Wood Floor", type: .floor)
    
    static let whiteFloor = StoreItem(id: 8, name: "White Floor", price: 1200, shopImage: #imageLiteral(resourceName: "shopfloorwhite" ), image: #imageLiteral(resourceName: "floorwhite.png" ), description: "White Wood Floor", type: .floor)
    
    static let blondFloor = StoreItem(id: 9, name: "Poplar Floor", price: 1800, shopImage: #imageLiteral(resourceName: "shopfloorblond" ), image: #imageLiteral(resourceName: "floorblonde.png" ), description: "Light Wood Floor", type: .floor)
    
    static let blackFloor = StoreItem(id: 10, name: "Black Floor", price: 1800, shopImage: #imageLiteral(resourceName: "shopfloorblack" ), image: #imageLiteral(resourceName: "floorblack.png" ), description: "Black Wood Floor", type: .floor)
    
    static let redFloor = StoreItem(id: 22, name: "Cedar Floor", price: 1800, shopImage: #imageLiteral(resourceName: "shopfloorred.png" ), image: #imageLiteral(resourceName: "floorred.png" ), description: "Cedar Wood Floor", type: .floor)

    // Walls

    static let wall = StoreItem(id: 5, name: "Blue Wall", price: 0, shopImage: #imageLiteral(resourceName: "shopwall" ), image: #imageLiteral(resourceName: "bluewall.png" ), description: "Blue Painted Wall", type: .wall)
    
    static let yellowWall = StoreItem(id: 18, name: "Yellow Wall", price: 600, shopImage: #imageLiteral(resourceName: "shopwallyellow.png" ), image: #imageLiteral(resourceName: "yellowwall.png" ), description: "Yellow Painted Wall", type: .wall)
    
    static let mintWall = StoreItem(id: 41, name: "Mint Wall", price: 600, shopImage: #imageLiteral(resourceName: "shopwallmint.png" ), image: #imageLiteral(resourceName: "mintwall.png" ), description: "Mint Painted Wall", type: .wall)
    
    static let greyWall = StoreItem(id: 19, name: "Grey Wall", price: 600, shopImage: #imageLiteral(resourceName: "shopwallgrey.png" ), image: #imageLiteral(resourceName: "greywall.png" ), description: "Grey Painted Wall", type: .wall)
    
    static let redWall = StoreItem(id: 20, name: "Red Wall", price: 600, shopImage: #imageLiteral(resourceName: "shopwallred.png" ), image: #imageLiteral(resourceName: "redwall.png" ), description: "Red Painted Wall", type: .wall)
    
    static let pawprintWall = StoreItem(id: 21, name: "Pawprint Wall", price: 1800, shopImage: #imageLiteral(resourceName: "shopwallpawprint.png" ), image: #imageLiteral(resourceName: "pawprintwall.png" ), description: "Pawprint Wallpaper", type: .wall)
    
    static let stripedWall = StoreItem(id: 39, name: "Striped Wall", price: 1200, shopImage: #imageLiteral(resourceName: "shopwallstriped.png" ), image: #imageLiteral(resourceName: "stripedwall.png" ), description: "Striped Wallpaper", type: .wall)

    // Beds

    static let bed = StoreItem(id: 2, name: "Blue Bed", price: 0, shopImage: #imageLiteral(resourceName: "shopbed" ), image: #imageLiteral(resourceName: "bedblue.png" ), description: "Blue Cozy Bed", type: .bed)
    
    static let yellowBed = StoreItem(id: 6, name: "Yellow Bed", price: 300, shopImage: #imageLiteral(resourceName: "shopbedyellow" ), image: #imageLiteral(resourceName: "bedyellow.png" ), description: "Yellow Cozy Bed", type: .bed )
    
    static let greenBed = StoreItem(id: 11, name: "Green Bed", price: 300, shopImage: #imageLiteral(resourceName: "shopbedgreen" ), image: #imageLiteral(resourceName: "bedgreen" ), description: "Green Cozy Bed", type: .bed)
    
    static let pinkBed = StoreItem(id: 12, name: "Pink Bed", price: 300, shopImage: #imageLiteral(resourceName: "shopbedpink" ), image: #imageLiteral(resourceName: "bedpink" ), description: "Pink Cozy Bed", type: .bed)
    
    static let whiteBed = StoreItem(id: 13, name: "White Bed", price: 500, shopImage: #imageLiteral(resourceName: "shopbedwhite" ), image: #imageLiteral(resourceName: "bedwhite" ), description: "White Cozy Bed", type: .bed)
    
    static let blackBed = StoreItem(id: 38, name: "Black Bed", price: 500, shopImage: #imageLiteral(resourceName: "shopbedblack.png" ), image: #imageLiteral(resourceName: "bedblack.png" ), description: "Black Cozy Bed", type: .bed)
    
    static let orangeBed = StoreItem(id: 111, name: "Orange Bed", price: 600, shopImage: #imageLiteral(resourceName: "shopbedorange.png" ), image: #imageLiteral(resourceName: "bedorange.png" ), description: "Orange Cozy Bed", type: .bed)
    
    static let mintBed = StoreItem(id: 112, name: "Mint Bed", price: 600, shopImage: #imageLiteral(resourceName: "shopbedmint.png" ), image: #imageLiteral(resourceName: "bedmint.png" ), description: "Mint Cozy Bed", type: .bed)
    
    // Windows

    static let basicView = StoreItem(id: 27, name: "Blue Sky", price: 0, shopImage: #imageLiteral(resourceName: "shopwindow.png" ), image: #imageLiteral(resourceName: "window.png" ), description: "Clear Sky View", type: .window)
    
    static let mountainView = StoreItem(id: 28, name: "Mountain Scene", price: 1500, shopImage: #imageLiteral(resourceName: "shopmountain.png" ), image: #imageLiteral(resourceName: "mountain.png" ), description: "Mountainous View", type: .window)
    
    static let winterView = StoreItem(id: 29, name: "Winter Scene", price: 1500, shopImage: #imageLiteral(resourceName: "shopwinter.png" ), image: #imageLiteral(resourceName: "frost.png" ), description: "Wintery View", type: .window)
    
    static let farmView = StoreItem(id: 30, name: "Farm Scene", price: 1500, shopImage: #imageLiteral(resourceName: "shopfarm.png" ), image: #imageLiteral(resourceName: "farm.png" ), description: "Country View", type: .window)
    
    static let oceanView = StoreItem(id: 31, name: "Ocean Scene", price: 1500, shopImage: #imageLiteral(resourceName: "shopocean.png" ), image: #imageLiteral(resourceName: "ocean.png" ), description: "Seaside View", type: .window)
    
    static let nightView = StoreItem(id: 36, name: "Night Scene", price: 1800, shopImage: #imageLiteral(resourceName: "shopnight.png" ), image: #imageLiteral(resourceName: "night.png" ), description: "Nighttime View", type: .window)
    
    static let frostView = StoreItem(id: 48, name: "Frosty Scene", price: 1500, shopImage: #imageLiteral(resourceName: "shopfrost.png" ), image: #imageLiteral(resourceName: "frost.png" ), description: "Frosty Window View", type: .window)

    // Rugs

    static let noRug = StoreItem(id: 42, name: "No Rug", price: 0, shopImage: #imageLiteral(resourceName: "shopnorug.png" ), image: #imageLiteral(resourceName: "none.png" ), description: "No Rug", type: .rug)
    
    static let redRug = StoreItem(id: 43, name: "Red Rug", price: 500, shopImage: #imageLiteral(resourceName: "shopredrug.png" ), image: #imageLiteral(resourceName: "redrug.png" ), description: "Red Round Rug", type: .rug)
	
    static let tanRug = StoreItem(id: 44, name: "Tan Rug", price: 500, shopImage: #imageLiteral(resourceName: "shoptanrug.png" ), image: #imageLiteral(resourceName: "tanrug.png" ), description: "Tan Round Rug", type: .rug)
    
    static let ecruRug = StoreItem(id: 45, name: "Ecru Rug", price: 500, shopImage: #imageLiteral(resourceName: "shopecrurug.png" ), image: #imageLiteral(resourceName: "ecrurug.png" ), description: "Ecru Round Rug", type: .rug)
    
    static let christmasRug = StoreItem(id: 46, name: "Red and Green Rug", price: 800, shopImage: #imageLiteral(resourceName: "redandgreenrugshop.png" ), image: #imageLiteral(resourceName: "christmasrug.png" ), description: "Red/Green Round Rug", type: .rug)
    
    static let blueRug = StoreItem(id: 47, name: "Blue Rug", price: 500, shopImage: #imageLiteral(resourceName: "shoprugblue.png" ), image: #imageLiteral(resourceName: "bluerug.png" ), description: "Blue Round Rug", type: .rug)
    
    static let orangeRug = StoreItem(id: 109, name: "Orange Rug", price: 700, shopImage: #imageLiteral(resourceName: "shoporangerug.png" ), image: #imageLiteral(resourceName: "orangerug.png" ), description: "Orange Round Rug", type: .rug)
    
    static let mintRug = StoreItem(id: 110, name: "Mint Rug", price: 700, shopImage: #imageLiteral(resourceName: "shopmintrug.png" ), image: #imageLiteral(resourceName: "mintrug.png" ), description: "Mint Round Rug", type: .rug)

    static let whiteRug = StoreItem(id: 118, name: "White Rug", price: 700, shopImage: #imageLiteral(resourceName: "shopwhiterug" ), image: #imageLiteral(resourceName: "whiterug" ), description: "White Round Rug", type: .rug)
    
    // Couches
    
    static let greenCouch = StoreItem(id: 56, name: "Green Couch", price: 1000, shopImage: #imageLiteral(resourceName: "shopcouchgreen.png" ), image: #imageLiteral(resourceName: "couchgreen.png" ), description: "Green Cozy Couch", type: .couch)
    
    static let yellowCouch = StoreItem(id: 57, name: "Yellow Couch", price: 1000, shopImage: #imageLiteral(resourceName: "shopcouchyellow.png" ), image: #imageLiteral(resourceName: "couchyellow.png" ), description: "Yellow Cozy Couch", type: .couch)
    
    static let blueCouch = StoreItem(id: 58, name: "Blue Couch", price: 1000, shopImage: #imageLiteral(resourceName: "shopcouchblue.png" ), image: #imageLiteral(resourceName: "couchblue.png" ), description: "Blue Cozy Couch", type: .couch)
    
    static let pinkCouch = StoreItem(id: 59, name: "Pink Couch", price: 1000, shopImage: #imageLiteral(resourceName: "shopcouchpink.png" ), image: #imageLiteral(resourceName: "couchpink.png" ), description: "Pink Cozy Couch", type: .couch)
    
    static let whiteCouch = StoreItem(id: 60, name: "White Couch", price: 1200, shopImage: #imageLiteral(resourceName: "shopcouchwhite.png" ), image: #imageLiteral(resourceName: "couchwhite.png" ), description: "White Cozy Couch", type: .couch)
    
    static let blackCouch = StoreItem(id: 61, name: "Black Couch", price: 1200, shopImage: #imageLiteral(resourceName: "shopcouchblack.png" ), image: #imageLiteral(resourceName: "couchblack.png" ), description: "Black Cozy Couch", type: .couch)
    
    static let orangeCouch = StoreItem(id: 113, name: "Orange Couch", price: 1200, shopImage: #imageLiteral(resourceName: "shopcouchorange.png" ), image: #imageLiteral(resourceName: "couchorange.png" ), description: "Orange Cozy Couch", type: .couch)
    
    static let mintCouch = StoreItem(id: 114, name: "Mint Couch", price: 1200, shopImage: #imageLiteral(resourceName: "shopcouchmint.png" ), image: #imageLiteral(resourceName: "couchmint.png" ), description: "Mint Cozy Couch", type: .couch)
    
    // Decor

    static let holly = StoreItem(id: 49, name: "Holly Hanging", price: 800, shopImage: #imageLiteral(resourceName: "shopholly.png" ), image: #imageLiteral(resourceName: "holly.png" ), description: "Holly Window Hanging", type: .decor)
    
    static let rainbow = StoreItem(id: 115, name: "Rainbow Hanging", price: 800, shopImage: #imageLiteral(resourceName: "shoprainbowhanging.png" ), image: #imageLiteral(resourceName: "rainbowhanging.png" ), description: "Rainbow Window Hanging", type: .decor)
    
    static let funfetti = StoreItem(id: 116, name: "Funfetti Hanging", price: 800, shopImage: #imageLiteral(resourceName: "shopfunfettihanging.png" ), image: #imageLiteral(resourceName: "funfettihanging.png" ), description: "Funfetti Window Hanging", type: .decor)
    
    static let sun = StoreItem(id: 117, name: "Sun Hanging", price: 800, shopImage: #imageLiteral(resourceName: "shopsunhanging.png" ), image: #imageLiteral(resourceName: "sunhanging.png" ), description: "Sun Window Hanging", type: .decor)
    
    static let noDecor = StoreItem(id: 50, name: "No Decor", price: 0, shopImage: #imageLiteral(resourceName: "shopnorug.png" ), image: #imageLiteral(resourceName: "none.png" ), description: "No Decor", type: .decor)

    // Cushion

    static let cushionStarYellow = StoreItem(id: 185, name: "Yellow Star Cushion", price: 0, shopImage: #imageLiteral(resourceName: "shopcushionstaryellow.png"), image: #imageLiteral(resourceName: "cushionstaryellow.png"), description: "Yellow Star Floor Cushion", type: .cushion)

    static let cushionStarBlack = StoreItem(id: 186, name: "Black Star Cushion", price: 200, shopImage: #imageLiteral(resourceName: "shopcushionstarblack.png"), image: #imageLiteral(resourceName: "cushionstarblack.png"), description: "Black Star Floor Cushion", type: .cushion)

    static let cushionStarBlue = StoreItem(id: 187, name: "Blue Star Cushion", price: 200, shopImage: #imageLiteral(resourceName: "shopcushionstarblue.png"), image: #imageLiteral(resourceName: "cushionstarblue.png"), description: "Blue Star Floor Cushion", type: .cushion)

    static let cushionStarGreen = StoreItem(id: 188, name: "Green Star Cushion", price: 200, shopImage: #imageLiteral(resourceName: "shopcushionstargreen.png"), image: #imageLiteral(resourceName: "cushionstargreen.png"), description: "Green Star Floor Cushion", type: .cushion)

    static let cushionStarLilac = StoreItem(id: 189, name: "Lilac Star Cushion", price: 300, shopImage: #imageLiteral(resourceName: "shopcushionstarlilac.png"), image: #imageLiteral(resourceName: "cushionstarlilac.png"), description: "Lilac Star Floor Cushion", type: .cushion)

    static let cushionStarMint = StoreItem(id: 190, name: "Mint Star Cushion", price: 300, shopImage: #imageLiteral(resourceName: "shopcushionstarmint.png"), image: #imageLiteral(resourceName: "cushionstarmint.png"), description: "Mint Star Floor Cushion", type: .cushion)

    static let cushionStarOrange = StoreItem(id: 191, name: "Orange Star Cushion", price: 300, shopImage: #imageLiteral(resourceName: "shopcushionstarorange.png"), image: #imageLiteral(resourceName: "cushionstarorange.png"), description: "Orange Star Floor Cushion", type: .cushion)

    static let cushionStarPink = StoreItem(id: 192, name: "Pink Star Cushion", price: 300, shopImage: #imageLiteral(resourceName: "shopcushionstarpink.png"), image: #imageLiteral(resourceName: "cushionstarpink.png"), description: "Pink Star Floor Cushion", type: .cushion)

    static let cushionStarRed = StoreItem(id: 193, name: "Red Star Cushion", price: 200, shopImage: #imageLiteral(resourceName: "shopcushionstarred.png"), image: #imageLiteral(resourceName: "cushionstarred.png"), description: "Red Star Floor Cushion", type: .cushion)

    static let cushionStarWhite = StoreItem(id: 194, name: "White Star Cushion", price: 200, shopImage: #imageLiteral(resourceName: "shopcushionstarwhite.png"), image: #imageLiteral(resourceName: "cushionstarwhite.png"), description: "White Star Floor Cushion", type: .cushion)


    static let cushionHeartBlack = StoreItem(id: 195, name: "Black Heart Cushion", price: 300, shopImage: #imageLiteral(resourceName: "shopcushionheartblack.png"), image: #imageLiteral(resourceName: "cushionheartblack.png"), description: "Black Heart Floor Cushion", type: .cushion)

    static let cushionHeartBlue = StoreItem(id: 196, name: "Blue Heart Cushion", price: 300, shopImage: #imageLiteral(resourceName: "shopcushionheartblue.png"), image: #imageLiteral(resourceName: "cushionheartblue.png"), description: "Blue Heart Floor Cushion", type: .cushion)

    static let cushionHeartGreen = StoreItem(id: 197, name: "Green Heart Cushion", price: 200, shopImage: #imageLiteral(resourceName: "shopcushionheartgreen.png"), image: #imageLiteral(resourceName: "cushionheartgreen.png"), description: "Green Heart Floor Cushion", type: .cushion)

    static let cushionHeartLilac = StoreItem(id: 198, name: "Lilac Heart Cushion", price: 300, shopImage: #imageLiteral(resourceName: "shopcushionheartlilac.png"), image: #imageLiteral(resourceName: "cushionheartlilac.png"), description: "Lilac Heart Floor Cushion", type: .cushion)

    static let cushionHeartMint = StoreItem(id: 199, name: "Mint Heart Cushion", price: 300, shopImage: #imageLiteral(resourceName: "shopcushionheartmint.png"), image: #imageLiteral(resourceName: "cushionheartmint.png"), description: "Mint Heart Floor Cushion", type: .cushion)

    static let cushionHeartOrange = StoreItem(id: 200, name: "Orange Heart Cushion", price: 300, shopImage: #imageLiteral(resourceName: "shopcushionheartorange.png"), image: #imageLiteral(resourceName: "cushionheartorange.png"), description: "Orange Heart Floor Cushion", type: .cushion)

    static let cushionHeartPink = StoreItem(id: 201, name: "Pink Heart Cushion", price: 300, shopImage: #imageLiteral(resourceName: "shopcushionheartpink.png"), image: #imageLiteral(resourceName: "cushionheartpink.png"), description: "Pink Heart Floor Cushion", type: .cushion)

    static let cushionHeartRed = StoreItem(id: 202, name: "Red Heart Cushion", price: 300, shopImage: #imageLiteral(resourceName: "shopcushionheartred.png"), image: #imageLiteral(resourceName: "cushionheartred.png"), description: "Red Heart Floor Cushion", type: .cushion)

    static let cushionHeartWhite = StoreItem(id: 203, name: "White Heart Cushion", price: 200, shopImage: #imageLiteral(resourceName: "shopcushionheartwhite.png"), image: #imageLiteral(resourceName: "cushionheartwhite.png"), description: "White Heart Floor Cushion", type: .cushion)

    static let cushionHeartYellow = StoreItem(id: 204, name: "Yellow Heart Cushion", price: 200, shopImage: #imageLiteral(resourceName: "shopcushionheartyellow.png"), image: #imageLiteral(resourceName: "cushionheartyellow.png"), description: "Yellow Heart Floor Cushion", type: .cushion)


    static let cherryBlossomCushion = StoreItem(id: 205, name: "Cherry Blossom Cushion", price: 500, shopImage: #imageLiteral(resourceName: "shopcushioncherryblossom.png"), image: #imageLiteral(resourceName: "cushioncherryblossom.png"), description: "Cherry Blossom Floor Cushion", type: .cushion)

    static let whiteCherryBlossomCushion = StoreItem(id: 206, name: "White Cherry Blossom Cushion", price: 500, shopImage: #imageLiteral(resourceName: "shopcushioncherryblossomwhite.png"), image: #imageLiteral(resourceName: "cushionwhitecherryblossom.png"), description: "White Cherry Blossom Floor Cushion", type: .cushion)


	static var inventory = [
        bowl, blueBowl, greenBowl, yellowBowl, whiteBowl, blackBowl,
        blueWaterBowl, greenWaterBowl, yellowWaterBowl, whiteWaterBowl, blackWaterBowl,
        bed, yellowBed, greenBed, pinkBed, whiteBed, blackBed, orangeBed, mintBed,
        mouse, ball, candycane, cupcake, doughnut, fish,
        picture, sunset, cat, forest, abstract,
        greenCouch, yellowCouch, blueCouch, pinkCouch, whiteCouch, blackCouch, orangeCouch, mintCouch,
        cushionStarYellow, cushionStarBlue, cushionStarBlack, cushionStarWhite, cushionStarRed, cushionStarGreen, cushionStarPink, cushionStarMint, cushionStarOrange, cushionStarLilac,
        cushionHeartWhite, cushionHeartYellow, cushionHeartGreen, cushionHeartBlack, cushionHeartBlue, cushionHeartMint, cushionHeartLilac, cushionHeartRed, cushionHeartOrange, cushionHeartPink,
        cherryBlossomCushion, whiteCherryBlossomCushion,
        noDecor, sun, rainbow, funfetti, holly, wall,
        yellowWall, mintWall, greyWall, redWall, stripedWall, pawprintWall,
        basicView, mountainView, winterView, farmView, oceanView, frostView, nightView,
        noRug, redRug, tanRug, blueRug, ecruRug, orangeRug, mintRug, whiteRug, christmasRug,
        floor, darkFloor, whiteFloor, blondFloor, redFloor, blackFloor,

        soap, toothbrush, shark, starfish,
        blackTowels, yellowTowels, blueTowels, greenTowels, whiteTowels, pinkTowels,
        brownCabinet, redCabinet, whiteCabinet, blackCabinet, darkCabinet, blondCabinet,
        blueBath, roseBath, purpleBath, whiteBath, yellowBath, greenBath,
        yellowMat, blackMat, blueMat, greenMat, pinkMat, whiteMat,
        orangeTileWall, yellowTileWall, mintTileWall, blueTileWall, pinkTileWall, whiteTileWall,
        orangeTile, mintTile, yellowTile, blueTile, pinkTile, whiteTile,
        ecruBathroom, roseBathroom, seafoamBathroom, lemonBathroom, whiteBathroom, skyBathroom, lavenderBathroom,

        backsplashWhite, backsplashYellow, backsplashBlue, backsplashPink, backsplashMint, backsplashOrange,
        counterWhite, counterBlue, counterPink, counterMarble, counterBlackMarble, counterWhiteSparkle, counterBlackSparkle,
        fridgeWhite, fridgeBlack, fridgeGreen, fridgeYellow, fridgeOrange, fridgeBlue, fridgePink, fridgeMint,
        kitchenFloorBlack, kitchenFloorWhite, kitchenFloorRed, kitchenFloorYellow, kitchenFloorBlue, kitchenFloorMint, kitchenFloorOrange, kitchenFloorPink,
        kitchenMatGreen, kitchenMatPink, kitchenMatBlue, kitchenMatYellow, kitchenMatBlack, kitchenMatWhite,
        kitchenWallEcru, kitchenWallSky, kitchenWallSunshine, kitchenWallDenim, kitchenWallWhite, kitchenWallJade, kitchenWallPink,
        stoveBlue, stoveBlack, stoveWhite, stoveGreen, stoveYellow, stoveMint, stovePink, stoveOrange,
        lowerCabinetRed, lowerCabinetBlue, lowerCabinetGreen, lowerCabinetYellow, lowerCabinetBlack, lowerCabinetWhite, lowerCabinetBlonde, lowerCabinetDark,
        upperCabinetBlonde, upperCabinetBlue, upperCabinetGreen, upperCabinetYellow, upperCabinetBlack, upperCabinetWhite, upperCabinetDark, upperCabinetRed
      ]
    
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
        115: rainbow,
        116: funfetti,
        117: sun,
        118: whiteRug,
        119: backsplashBlue,
        120: backsplashMint,
        121: backsplashOrange,
        122: backsplashPink,
        123: backsplashWhite,
        124: backsplashYellow,
        125: counterMarble,
        126: counterBlackMarble,
        127: counterBlackSparkle,
        128: counterWhiteSparkle,
        129: counterBlue,
        130: counterPink,
        131: counterWhite,
        132: fridgeBlack,
        133: fridgeBlue,
        134: fridgeGreen,
        135: fridgeMint,
        136: fridgeOrange,
        137: fridgePink,
        138: fridgeWhite,
        139: fridgeYellow,
        140: kitchenFloorBlack,
        141: kitchenFloorBlue,
        142: kitchenFloorMint,
        143: kitchenFloorOrange,
        144: kitchenFloorPink,
        145: kitchenFloorRed,
        146: kitchenFloorWhite,
        147: kitchenFloorYellow,
        148: kitchenMatBlack,
        149: kitchenMatBlue,
        150: kitchenMatGreen,
        151: kitchenMatPink,
        152: kitchenMatWhite,
        153: kitchenMatYellow,
        154: kitchenWallDenim,
        155: kitchenWallEcru,
        156: kitchenWallJade,
        157: kitchenWallPink,
        158: kitchenWallSky,
        159: kitchenWallSunshine,
        160: kitchenWallWhite,
        161: lowerCabinetBlack,
        162: lowerCabinetBlonde,
        163: lowerCabinetBlue,
        164: lowerCabinetDark,
        165: lowerCabinetGreen,
        166: lowerCabinetRed,
        167: lowerCabinetWhite,
        168: lowerCabinetYellow,
        169: stoveBlack,
        170: stoveBlue,
        171: stoveGreen,
        172: stoveMint,
        173: stoveOrange,
        174: stovePink,
        175: stoveWhite,
        176: stoveYellow,
        177: upperCabinetBlack,
        178: upperCabinetBlonde,
        179: upperCabinetBlue,
        180: upperCabinetDark,
        181: upperCabinetGreen,
        182: upperCabinetRed,
        183: upperCabinetWhite,
        184: upperCabinetYellow,
        185: cushionStarYellow,
        186: cushionStarBlack,
        187: cushionStarBlue,
        188: cushionStarGreen,
        189: cushionStarLilac,
        190: cushionStarMint,
        191: cushionStarOrange,
        192: cushionStarPink,
        193: cushionStarRed,
        194: cushionStarWhite,
        195: cushionHeartBlack,
        196: cushionHeartBlue,
        197: cushionHeartGreen,
        198: cushionHeartLilac,
        199: cushionHeartMint,
        200: cushionHeartPink,
        201: cushionHeartOrange,
        202: cushionHeartRed,
        203: cushionHeartWhite,
        204: cushionHeartYellow,
        205: cherryBlossomCushion,
        206: whiteCherryBlossomCushion,
    ]
    
    static var purchased: [StoreItem] = []
    static var unpurchased: [StoreItem] = []
}
