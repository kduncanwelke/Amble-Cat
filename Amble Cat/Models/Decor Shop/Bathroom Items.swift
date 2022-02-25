//
//  Bathroom Items.swift
//  Micro Kitty
//
//  Created by Kate Duncan-Welke on 2/25/22.
//  Copyright © 2022 Kate Duncan-Welke. All rights reserved.
//

import Foundation

extension StoreInventory {

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
}
