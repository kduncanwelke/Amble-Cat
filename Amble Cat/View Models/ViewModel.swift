//
//  ViewModel.swift
//  Amble Cat
//
//  Created by Kate Duncan-Welke on 2/2/21.
//  Copyright © 2021 Kate Duncan-Welke. All rights reserved.
//

import Foundation
import UIKit

public class ViewModel {
    
    let userDefaultDate = "userDefaultDate"
    
    func checkCareProgress() -> Bool {
        print("care progress")
        
        if CareState.hasBeenFed && CareState.hasBeenWatered {
            CareState.daysCaredFor += 1
            saveCare()
            
            return false
        } else if CareState.daysCaredFor == 7 {
            Currency.toAdd = 50
            saveCare()
            
            return true
        } else {
            return false
        }
    }

    func getLabelName(tag: Int) -> String {
        return ButtonsManager.buttonNames[tag] ?? ""
    }
    
    func getDaysCaredFor() -> Int {
        return Int(CareState.daysCaredFor)
    }
    
    func feedCat() {
        CareState.hasBeenFed = true
    }
    
    func waterCat() {
        CareState.hasBeenWatered = true
    }
    
    func hasEquipped() -> Bool {
        if DecorManager.equipped != nil {
            return false
        } else {
            return true
        }
    }
    
    func hasBeenFed() -> Bool {
        return CareState.hasBeenFed
    }
    
    func hasBeenWatered() -> Bool {
        return CareState.hasBeenWatered
    }
    
    func getBedImage() -> UIImage? {
        return StoreInventory.inventoryDictionary[DecorManager.bedID]?.image
    }
    
    func getDecorImage() -> UIImage? {
        return StoreInventory.inventoryDictionary[DecorManager.decorID]?.image
    }
    
    func getFloorImage() -> UIImage? {
        return StoreInventory.inventoryDictionary[DecorManager.floorID]?.image
    }
    
    func getPictureImage() -> UIImage? {
        return StoreInventory.inventoryDictionary[DecorManager.pictureID]?.image
    }
    
    func getRugImage() -> UIImage? {
        return StoreInventory.inventoryDictionary[DecorManager.rugID]?.image
    }
    
    func getToyImage() -> UIImage? {
        return StoreInventory.inventoryDictionary[DecorManager.toyID]?.image
    }
    
    func getWallImage() -> UIImage? {
        return StoreInventory.inventoryDictionary[DecorManager.wallID]?.image
    }
    
    func getWindowImage() -> UIImage? {
        return StoreInventory.inventoryDictionary[DecorManager.windowID]?.image
    }
    
    func setPointsLabel() -> String {
        return "\(Currency.userTotal)"
    }
    
    func showFood() -> UIImage {
        if CareState.hasBeenFed {
            return Bowls.fullBowls[DecorManager.bowlID] ?? #imageLiteral(resourceName: "foodbowlpink.png")
        } else {
            return StoreInventory.inventoryDictionary[DecorManager.bowlID]?.image ?? #imageLiteral(resourceName: "foodbowlpink.png")
        }
    }
    
    func showWater() -> UIImage? {
        if CareState.hasBeenWatered {
            return nil
        } else {
            return StoreInventory.inventoryDictionary[DecorManager.waterID]?.image ?? #imageLiteral(resourceName: "nowaterblue.png")
        }
    }
}
