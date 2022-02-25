//
//  Kitchen Items.swift
//  Micro Kitty
//
//  Created by Kate Duncan-Welke on 2/23/22.
//  Copyright © 2022 Kate Duncan-Welke. All rights reserved.
//

import Foundation

extension StoreInventory {

    // Backsplash

    static let backsplashBlue = StoreItem(id: 119, name: "Blue Backsplash", price: 600, shopImage: #imageLiteral(resourceName: "shopbacksplashblue.png" ), image: #imageLiteral(resourceName: "backsplashblue.png" ), description: "Blue Tile Backsplash", type: .backsplash)

    static let backsplashMint = StoreItem(id: 120, name: "Mint Backsplash", price: 800, shopImage: #imageLiteral(resourceName: "shopbacksplashmint.png" ), image: #imageLiteral(resourceName: "backsplashmint.png" ), description: "Mint Tile Backsplash", type: .backsplash)

    static let backsplashOrange = StoreItem(id: 121, name: "Orange Backsplash", price: 800, shopImage: #imageLiteral(resourceName: "shopbacksplashorange.png" ), image: #imageLiteral(resourceName: "backsplashorange.png" ), description: "Orange Tile Backsplash", type: .backsplash)

    static let backsplashPink = StoreItem(id: 122, name: "Pink Backsplash", price: 600, shopImage: #imageLiteral(resourceName: "shopbacksplashpink.png" ), image: #imageLiteral(resourceName: "backsplashpink.png" ), description: "Pink Tile Backsplash", type: .backsplash)

    static let backsplashWhite = StoreItem(id: 123, name: "White Backsplash", price: 0, shopImage: #imageLiteral(resourceName: "shopbacksplashwhite.png" ), image: #imageLiteral(resourceName: "backsplashwhite.png" ), description: "White Tile Backsplash", type: .backsplash)

    static let backsplashYellow = StoreItem(id: 124, name: "Yellow Backsplash", price: 600, shopImage: #imageLiteral(resourceName: "shopbacksplashyellow.png" ), image: #imageLiteral(resourceName: "backsplashyellow.png" ), description: "Yellow Tile Backsplash", type: .backsplash)

    // Countertop

    static let counterMarble = StoreItem(id: 125, name: "Marble Countertop", price: 300, shopImage: #imageLiteral(resourceName: "shopcountertopmarble.png" ), image: #imageLiteral(resourceName: "countermarble.png" ), description: "Marble Kitchen Counter", type: .counter)

    static let counterBlackMarble = StoreItem(id: 126, name: "Black Marble Countertop", price: 300, shopImage: #imageLiteral(resourceName: "shopcountertopblackmarble.png" ), image: #imageLiteral(resourceName: "counterblackmarble.png" ), description: "Black Marble Kitchen Counter", type: .counter)

    static let counterBlackSparkle = StoreItem(id: 127, name: "Black Sparkle Countertop", price: 350, shopImage: #imageLiteral(resourceName: "shopcountertopblacksparkle.png" ), image: #imageLiteral(resourceName: "counterblacksparkle.png" ), description: "Black Sparkly Kitchen Counter", type: .counter)

    static let counterWhiteSparkle = StoreItem(id: 128, name: "White Sparkle Countertop", price: 350, shopImage: #imageLiteral(resourceName: "shopcountertopgoldsparkle.png" ), image: #imageLiteral(resourceName: "countergoldsparkle.png" ), description: "White Sparkly Kitchen Counter", type: .counter)

    static let counterBlue = StoreItem(id: 129, name: "Blue Countertop", price: 200, shopImage: #imageLiteral(resourceName: "shopcountertopblue.png" ), image: #imageLiteral(resourceName: "counterblue.png" ), description: "Blue Formica Kitchen Counter", type: .counter)

    static let counterPink = StoreItem(id: 130, name: "Pink Countertop", price: 200, shopImage: #imageLiteral(resourceName: "shopcountertoppink.png" ), image: #imageLiteral(resourceName: "counterpink.png" ), description: "Pink Formica Kitchen Counter", type: .counter)

    static let counterWhite = StoreItem(id: 131, name: "White Countertop", price: 0, shopImage: #imageLiteral(resourceName: "shopcountertopwhite.png" ), image: #imageLiteral(resourceName: "counterwhite.png" ), description: "White Formica Kitchen Counter", type: .counter)

    // Fridge

    static let fridgeBlack = StoreItem(id: 132, name: "Black Fridge", price: 500, shopImage: #imageLiteral(resourceName: "shopfridgeblack.png" ), image: #imageLiteral(resourceName: "fridgeblack.png" ), description: "Black Retro Fridge", type: .fridge)

    static let fridgeBlue = StoreItem(id: 133, name: "Blue Fridge", price: 700, shopImage: #imageLiteral(resourceName: "shopfridgeblue.png" ), image: #imageLiteral(resourceName: "fridgeblue.png" ), description: "Blue Retro Fridge", type: .fridge)

    static let fridgeGreen = StoreItem(id: 134, name: "Green Fridge", price: 500, shopImage: #imageLiteral(resourceName: "shopfridgegreen.png" ), image: #imageLiteral(resourceName: "fridgegreen.png" ), description: "Green Retro Fridge", type: .fridge)

    static let fridgeMint = StoreItem(id: 135, name: "Mint Fridge", price: 700, shopImage: #imageLiteral(resourceName: "shopfridgemint.png" ), image: #imageLiteral(resourceName: "fridgemint.png" ), description: "Mint Retro Fridge", type: .fridge)

    static let fridgeOrange = StoreItem(id: 136, name: "Orange Fridge", price: 500, shopImage: #imageLiteral(resourceName: "shopfridgeorange.png" ), image: #imageLiteral(resourceName: "fridgeorange.png" ), description: "Orange Retro Fridge", type: .fridge)

    static let fridgePink = StoreItem(id: 137, name: "Pink Fridge", price: 700, shopImage: #imageLiteral(resourceName: "shopfridgepink.png" ), image: #imageLiteral(resourceName: "fridgepink.png" ), description: "Pink Retro Fridge", type: .fridge)

    static let fridgeWhite = StoreItem(id: 138, name: "White Fridge", price: 0, shopImage: #imageLiteral(resourceName: "shopfridgewhite.png" ), image: #imageLiteral(resourceName: "fridgewhite.png" ), description: "White Retro Fridge", type: .fridge)

    static let fridgeYellow = StoreItem(id: 139, name: "Yellow Fridge", price: 500, shopImage: #imageLiteral(resourceName: "shopfridgeyellow.png" ), image: #imageLiteral(resourceName: "fridgeyellow.png" ), description: "Yellow Retro Fridge", type: .fridge)

    // Floors

    static let kitchenFloorBlack = StoreItem(id: 140, name: "Black Tile Floor", price: 0, shopImage: #imageLiteral(resourceName: "shopkitchenfloorblack.png" ), image: #imageLiteral(resourceName: "kitchenfloorblack.png" ), description: "Black Checked Floor", type: .kitchenFloor)

    static let kitchenFloorBlue = StoreItem(id: 141, name: "Blue Tile Floor", price: 1000, shopImage: #imageLiteral(resourceName: "shopkitchenfloorblue.png" ), image: #imageLiteral(resourceName: "kitchenfloorblue.png" ), description: "Blue Checked Floor", type: .kitchenFloor)

    static let kitchenFloorMint = StoreItem(id: 142, name: "Mint Tile Floor", price: 1500, shopImage: #imageLiteral(resourceName: "shopkitchenfloormint.png" ), image: #imageLiteral(resourceName: "kitchenfloormint.png" ), description: "Mint Checked Floor", type: .kitchenFloor)

    static let kitchenFloorOrange = StoreItem(id: 143, name: "Orange Tile Floor", price: 1500, shopImage: #imageLiteral(resourceName: "shopkitchenfloororange.png" ), image: #imageLiteral(resourceName: "kitchenfloororange.png" ), description: "Orange Checked Floor", type: .kitchenFloor)

    static let kitchenFloorPink = StoreItem(id: 144, name: "Pink Tile Floor", price: 1500, shopImage: #imageLiteral(resourceName: "shopkitchenfloorpink.png" ), image: #imageLiteral(resourceName: "kitchenfloorpink.png" ), description: "Pink Checked Floor", type: .kitchenFloor)

    static let kitchenFloorRed = StoreItem(id: 145, name: "Red Tile Floor", price: 1000, shopImage: #imageLiteral(resourceName: "shopkitchenfloorred.png" ), image: #imageLiteral(resourceName: "kitchenfloorred.png" ), description: "Red Checked Floor", type: .kitchenFloor)

    static let kitchenFloorWhite = StoreItem(id: 146, name: "White Tile Floor", price: 500, shopImage: #imageLiteral(resourceName: "shopkitchenfloorwhite.png" ), image: #imageLiteral(resourceName: "kitchenfloorwhite.png" ), description: "Plain White Floor", type: .kitchenFloor)

    static let kitchenFloorYellow = StoreItem(id: 147, name: "Yellow Tile Floor", price: 1000, shopImage: #imageLiteral(resourceName: "shopkitchenflooryellow.png" ), image: #imageLiteral(resourceName: "kitchenflooryellow.png" ), description: "Yellow Checked Floor", type: .kitchenFloor)

    // Mats

    static let kitchenMatBlack = StoreItem(id: 148, name: "Black Kitchen Mat", price: 300, shopImage: #imageLiteral(resourceName: "shopkitchenmatblack.png" ), image: #imageLiteral(resourceName: "kitchenmatblack.png" ), description: "Black Kitchen Work Mat", type: .kitchenMat)

    static let kitchenMatBlue = StoreItem(id: 149, name: "Blue Kitchen Mat", price: 250, shopImage: #imageLiteral(resourceName: "shopkitchenmatblue.png" ), image: #imageLiteral(resourceName: "kitchenmatblue.png" ), description: "Blue Kitchen Work Mat", type: .kitchenMat)

    static let kitchenMatGreen = StoreItem(id: 150, name: "Green Kitchen Mat", price: 0, shopImage: #imageLiteral(resourceName: "shopkitchenmatgreen.png" ), image: #imageLiteral(resourceName: "kitchenmatgreen.png" ), description: "Green Kitchen Work Mat", type: .kitchenMat)

    static let kitchenMatPink = StoreItem(id: 151, name: "Pink Kitchen Mat", price: 250, shopImage: #imageLiteral(resourceName: "shopkitchenmatpink.png" ), image: #imageLiteral(resourceName: "kitchenmatpink.png" ), description: "Pink Kitchen Work Mat", type: .kitchenMat)

    static let kitchenMatWhite = StoreItem(id: 152, name: "White Kitchen Mat", price: 300, shopImage: #imageLiteral(resourceName: "shopkitchenmatwhite.png" ), image: #imageLiteral(resourceName: "kitchenmatwhite.png" ), description: "White Kitchen Work Mat", type: .kitchenMat)

    static let kitchenMatYellow = StoreItem(id: 153, name: "Yellow Kitchen Mat", price: 250, shopImage: #imageLiteral(resourceName: "shopkitchenmatyellow.png" ), image: #imageLiteral(resourceName: "kitchenmatyellow.png" ), description: "Yellow Kitchen Work Mat", type: .kitchenMat)

    // Walls

    static let kitchenWallDenim = StoreItem(id: 154, name: "Denim Kitchen Wall", price: 600, shopImage: #imageLiteral(resourceName: "shopkitchenwalldenim.png" ), image: #imageLiteral(resourceName: "kitchenwalldenim.png" ), description: "Denim Kitchen Painted Wall", type: .kitchenWall)

    static let kitchenWallEcru = StoreItem(id: 155, name: "Ecru Kitchen Wall", price: 0, shopImage: #imageLiteral(resourceName: "shopkitchenwallecru.png" ), image: #imageLiteral(resourceName: "kitchenwallecru.png" ), description: "Ecru Kitchen Painted Wall", type: .kitchenWall)

    static let kitchenWallJade = StoreItem(id: 156, name: "Jade Kitchen Wall", price: 1200, shopImage: #imageLiteral(resourceName: "shopkitchenwalljade.png" ), image: #imageLiteral(resourceName: "kitchenwalljade.png" ), description: "Jade Kitchen Painted Wall", type: .kitchenWall)

    static let kitchenWallPink = StoreItem(id: 157, name: "Pink Kitchen Wall", price: 1200, shopImage: #imageLiteral(resourceName: "shopkitchenwallpink.png" ), image: #imageLiteral(resourceName: "kitchenwallpink.png" ), description: "Pink Kitchen Painted Wall", type: .kitchenWall)

    static let kitchenWallSky = StoreItem(id: 158, name: "Sky Kitchen Wall", price: 600, shopImage: #imageLiteral(resourceName: "shopkitchenwallsky.png" ), image: #imageLiteral(resourceName: "kitchenwallsky.png" ), description: "Sky Kitchen Painted Wall", type: .kitchenWall)

    static let kitchenWallSunshine = StoreItem(id: 159, name: "Sunshine Kitchen Wall", price: 600, shopImage: #imageLiteral(resourceName: "shopkitchenwallsunshine.png" ), image: #imageLiteral(resourceName: "kitchenwallsunshine.png" ), description: "Sunshine Kitchen Painted Wall", type: .kitchenWall)

    static let kitchenWallWhite = StoreItem(id: 160, name: "White Kitchen Wall", price: 600, shopImage: #imageLiteral(resourceName: "shopkitchenwallwhite.png" ), image: #imageLiteral(resourceName: "kitchenwallwhite.png" ), description: "White Kitchen Painted Wall", type: .kitchenWall)

    // Lower cabinet

    static let lowerCabinetBlack = StoreItem(id: 161, name: "Black Lower Cabinet", price: 400, shopImage: #imageLiteral(resourceName: "shoplowercabinetblack.png" ), image: #imageLiteral(resourceName: "lowercabinetblack.png" ), description: "Black Lower Kitchen Cabinet", type: .lowerCabinet)

    static let lowerCabinetBlonde = StoreItem(id: 162, name: "Poplar Lower Cabinet", price: 500, shopImage: #imageLiteral(resourceName: "shoplowercabinetblonde.png" ), image: #imageLiteral(resourceName: "lowercabinetblonde.png" ), description: "Poplar Lower Kitchen Cabinet", type: .lowerCabinet)

    static let lowerCabinetBlue = StoreItem(id: 163, name: "Blue Lower Cabinet", price: 400, shopImage: #imageLiteral(resourceName: "shoplowercabinetblue.png" ), image: #imageLiteral(resourceName: "lowercabinetblue.png" ), description: "Blue Lower Kitchen Cabinet", type: .lowerCabinet)

    static let lowerCabinetDark = StoreItem(id: 164, name: "Walnut Lower Cabinet", price: 500, shopImage: #imageLiteral(resourceName: "shoplowercabinetdark.png" ), image: #imageLiteral(resourceName: "lowercabinetdark.png" ), description: "Walnut Lower Kitchen Cabinet", type: .lowerCabinet)

    static let lowerCabinetGreen = StoreItem(id: 165, name: "Green Lower Cabinet", price: 400, shopImage: #imageLiteral(resourceName: "shoplowercabinetgreen.png" ), image: #imageLiteral(resourceName: "lowercabinetgreen.png" ), description: "Green Lower Kitchen Cabinet", type: .lowerCabinet)

    static let lowerCabinetRed = StoreItem(id: 166, name: "Cedar Lower Cabinet", price: 0, shopImage: #imageLiteral(resourceName: "shoplowercabinetred.png" ), image: #imageLiteral(resourceName: "lowercabinetred.png" ), description: "Cedar Lower Kitchen Cabinet", type: .lowerCabinet)

    static let lowerCabinetWhite = StoreItem(id: 167, name: "White Lower Cabinet", price: 500, shopImage: #imageLiteral(resourceName: "shoplowercabinetwhite.png" ), image: #imageLiteral(resourceName: "lowercabinetwhite.png" ), description: "White Lower Kitchen Cabinet", type: .lowerCabinet)

    static let lowerCabinetYellow = StoreItem(id: 168, name: "Yellow Lower Cabinet", price: 400, shopImage: #imageLiteral(resourceName: "shoplowercabinetyellow.png" ), image: #imageLiteral(resourceName: "lowercabinetyellow.png" ), description: "Yellow Lower Kitchen Cabinet", type: .lowerCabinet)

    // Stove

    static let stoveBlack = StoreItem(id: 169, name: "Black Stove", price: 500, shopImage: #imageLiteral(resourceName: "shopstoveblack.png" ), image: #imageLiteral(resourceName: "stoveblack.png" ), description: "Black Retro Stove", type: .stove)

    static let stoveBlue = StoreItem(id: 170, name: "Blue Stove", price: 0, shopImage: #imageLiteral(resourceName: "shopstoveblue.png" ), image: #imageLiteral(resourceName: "stoveblue.png" ), description: "Blue Retro Stove", type: .stove)

    static let stoveGreen = StoreItem(id: 171, name: "Green Stove", price: 500, shopImage: #imageLiteral(resourceName: "shopstovegreen.png" ), image: #imageLiteral(resourceName: "stovegreen.png" ), description: "Green Retro Stove", type: .stove)

    static let stoveMint = StoreItem(id: 172, name: "Mint Stove", price: 600, shopImage: #imageLiteral(resourceName: "shopstovemint.png" ), image: #imageLiteral(resourceName: "stovemint.png" ), description: "Mint Retro Stove", type: .stove)

    static let stoveOrange = StoreItem(id: 173, name: "Orange Stove", price: 600, shopImage: #imageLiteral(resourceName: "shopstoveorange.png" ), image: #imageLiteral(resourceName: "stoveorange.png" ), description: "Orange Retro Stove", type: .stove)

    static let stovePink = StoreItem(id: 174, name: "Pink Stove", price: 600, shopImage: #imageLiteral(resourceName: "shopstovepink.png" ), image: #imageLiteral(resourceName: "stovepink.png" ), description: "Pink Retro Stove", type: .stove)

    static let stoveWhite = StoreItem(id: 175, name: "White Stove", price: 500, shopImage: #imageLiteral(resourceName: "shopstovewhite.png" ), image: #imageLiteral(resourceName: "stovewhite.png" ), description: "White Retro Stove", type: .stove)

    static let stoveYellow = StoreItem(id: 176, name: "Yellow Stove", price: 500, shopImage: #imageLiteral(resourceName: "shopstoveyellow.png" ), image: #imageLiteral(resourceName: "stoveyellow.png" ), description: "Yellow Retro Stove", type: .stove)

    // Upper cabinet

    static let upperCabinetBlack = StoreItem(id: 177, name: "Black Upper Cabinet", price: 500, shopImage: #imageLiteral(resourceName: "shopuppercabinetblack.png" ), image: #imageLiteral(resourceName: "uppercabinetblack.png" ), description: "Black Upper Kitchen Cabinet", type: .upperCabinet )

    static let upperCabinetBlonde = StoreItem(id: 178, name: "Poplar Upper Cabinet", price: 0, shopImage: #imageLiteral(resourceName: "shopuppercabinetblonde.png" ), image: #imageLiteral(resourceName: "uppercabinetblonde.png" ), description: "Poplar Upper Kitchen Cabinet", type: .upperCabinet)

    static let upperCabinetBlue = StoreItem(id: 179, name: "Blue Upper Cabinet", price: 500, shopImage: #imageLiteral(resourceName: "shopuppercabinetblue.png" ), image: #imageLiteral(resourceName: "uppercabinetblue.png" ), description: "Blue Upper Kitchen Cabinet", type: .upperCabinet)

    static let upperCabinetDark = StoreItem(id: 180, name: "Walnut Upper Cabinet", price: 600, shopImage: #imageLiteral(resourceName: "shopuppercabinetdark.png" ), image: #imageLiteral(resourceName: "uppercabinetdark.png" ), description: "Walnut Upper Kitchen Cabinet", type: .upperCabinet)

    static let upperCabinetGreen = StoreItem(id: 181, name: "Green Upper Cabinet", price: 500, shopImage: #imageLiteral(resourceName: "shopuppercabinetgreen.png" ), image: #imageLiteral(resourceName: "uppercabinetgreen.png" ), description: "Green Upper Kitchen Cabinet", type: .upperCabinet)

    static let upperCabinetRed = StoreItem(id: 182, name: "Cedar Upper Cabinet", price: 600, shopImage: #imageLiteral(resourceName: "shopuppercabinetred.png" ), image: #imageLiteral(resourceName: "uppercabinetred.png" ), description: "Cedar Upper Kitchen Cabinet", type: .upperCabinet)

    static let upperCabinetWhite = StoreItem(id: 183, name: "White Upper Cabinet", price: 600, shopImage: #imageLiteral(resourceName: "shopuppercabinetwhite.png" ), image: #imageLiteral(resourceName: "uppercabinetwhite.png" ), description: "White Upper Kitchen Cabinet", type: .upperCabinet)

    static let upperCabinetYellow = StoreItem(id: 184, name: "Yellow Upper Cabinet", price: 500, shopImage: #imageLiteral(resourceName: "shopuppercabinetyellow.png" ), image: #imageLiteral(resourceName: "uppercabinetyellow.png" ), description: "Yellow Upper Kitchen Cabinet", type: .upperCabinet)
}
