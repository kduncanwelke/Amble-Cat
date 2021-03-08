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
    
    func isAppAlreadyLaunchedOnce() -> Bool {
        let defaults = UserDefaults.standard
        
        if let isAppAlreadyLaunchedOnce = defaults.string(forKey: "isAppAlreadyLaunchedOnce") {
            print("App already launched : \(isAppAlreadyLaunchedOnce)")
            return true
        } else {
            defaults.set(true, forKey: "isAppAlreadyLaunchedOnce")
            print("App launched first time")
            return false
        }
    }
    
    func isSameDay() -> Bool {
        let date = Date()
        let calendar = Calendar.current
        let dateToCompare = calendar.component(.day , from: date)
        
        let userDefaultDate = UserDefaults.standard.integer(forKey: "userDefaultDate")
        
        if userDefaultDate != dateToCompare {
            UserDefaults.standard.set(dateToCompare, forKey: self.userDefaultDate)
            return false
        } else {
            return true
        }
    }
    
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
    
    func monitorNetwork() {
        NetworkMonitor.monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                print("connection successful")
                NetworkMonitor.connection = true
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "networkRestored"), object: nil)
            } else {
                print("no connection")
                NetworkMonitor.connection = false
            }
        }
        
        let queue = DispatchQueue(label: "Monitor")
        NetworkMonitor.monitor.start(queue: queue)
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
        return "\(Currency.userTotal) Paw Points"
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
