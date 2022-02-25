//
//  StoreViewModel.swift
//  Amble Cat
//
//  Created by Kate Duncan-Welke on 2/3/21.
//  Copyright © 2021 Kate Duncan-Welke. All rights reserved.
//

import Foundation
import UIKit
import CoreData

public class StoreViewModel {
    
    var currentSource: [StoreItem] = StoreInventory.inventory
    var selected: StoreItem?
    
    func setPointsLabel() -> String {
        return "\(Currency.userTotal)"
    }
    
    func setSource(segment: Int) {
        // reset selected item when retrieving counts aka reloading collectionview
        selected = nil
        
        if segment == 0 {
            currentSource = StoreInventory.inventory
        } else if segment == 1 {
            currentSource = StoreInventory.purchased
        } else {
            currentSource = StoreInventory.unpurchased
        }
    }
    
    func retrieveCounts(segment: Int) -> Int {
        if segment == 0 {
            return StoreInventory.inventory.count
        } else if segment == 1 {
            return StoreInventory.purchased.count
        } else {
            return StoreInventory.unpurchased.count
        }
    }
    
    func setSelected(segment: Int, index: IndexPath) {
        setSource(segment: segment)
        selected = currentSource[index.row]
    }
    
    func getImage(index: IndexPath) -> UIImage {
        return currentSource[index.row].shopImage
    }
    
    func getName(index: IndexPath) -> String {
        return currentSource[index.row].name
    }
    
    func getDescription(index: IndexPath) -> String {
        return currentSource[index.row].description
    }
    
    func getPurchaseState(index: IndexPath) -> Bool {
        if Purchases.purchaseStatus[currentSource[index.row].id] != nil {
            return true
        } else {
            return false
        }
    }

    func getRoomIcon(index: IndexPath) -> UIImage {
        switch currentSource[index.row].type {
        case .counter, .stove, .fridge, .backsplash, .upperCabinet, .lowerCabinet, .kitchenWall, .kitchenFloor, .kitchenMat, .bowl, .waterbowl:
            // kitchen
            return #imageLiteral(resourceName: "kitchenitem.png")
        case .couch, .bed, .decor, .picture, .floor, .rug, .toy, .wall, .window:
            // living
            return #imageLiteral(resourceName: "livingroomitem.png")
        case .bath, .bathmat, .bathtoy, .bathwall, .cabinet, .tilewall, .tilefloor, .towel:
            // bath
            return #imageLiteral(resourceName: "bathroomitem.png")
        }
    }
    
    func getPriceText(index: IndexPath) -> String {
        return "\(currentSource[index.row].price)"
    }
    
    func setEquipped(index: IndexPath) {
        guard let current = selected else { return }
        
        switch current.type {
        case .bed:
            DecorManager.bedID = current.id
        case .bowl:
            DecorManager.bowlID = current.id
        case .couch:
            DecorManager.couchID = current.id
        case .decor:
            DecorManager.decorID = current.id
        case .floor:
            DecorManager.floorID = current.id
        case .picture:
            DecorManager.pictureID = current.id
        case .rug:
            DecorManager.rugID = current.id
        case .toy:
            DecorManager.toyID = current.id
        case .wall:
            DecorManager.wallID = current.id
        case .waterbowl:
            DecorManager.waterID = current.id
        case .window:
            DecorManager.windowID = current.id
        case .bathtoy:
            DecorManager.bathtoyID = current.id
        case .towel:
            DecorManager.towelID = current.id
        case .cabinet:
            DecorManager.cabinetID = current.id
        case .bath:
            DecorManager.bathID = current.id
        case .bathmat:
            DecorManager.bathmatID = current.id
        case .tilewall:
            DecorManager.tilewallID = current.id
        case .tilefloor:
            DecorManager.tilewallID = current.id
        case .bathwall:
            DecorManager.bathwallID = current.id
        case .backsplash:
            DecorManager.backsplashID = current.id
        case .counter:
            DecorManager.counterID = current.id
        case .fridge:
            DecorManager.fridgeID = current.id
        case .kitchenFloor:
            DecorManager.kitchenFloorID = current.id
        case .kitchenMat:
            DecorManager.kitchenMatID = current.id
        case .kitchenWall:
            DecorManager.kitchenWallID = current.id
        case .lowerCabinet:
            DecorManager.lowerCabinetID = current.id
        case .stove:
            DecorManager.stoveID = current.id
        case .upperCabinet:
            DecorManager.upperCabinetID = current.id
        }
    }
    
    func buy() {
        guard let purchase = selected else { return }
        
        subtractCurrency(with: purchase.price)
    }
    
    func sufficientFunds() -> Bool {
        guard let current = selected else { return false }
        
        if Currency.userTotal < current.price {
            return false
        } else {
            return true
        }
    }
    
    func checkIfEquipped(index: IndexPath) -> Bool {
        let item = currentSource[index.row]
        
        if item.id == DecorManager.bedID || item.id == DecorManager.bowlID || item.id == DecorManager.couchID || item.id == DecorManager.decorID || item.id == DecorManager.floorID || item.id == DecorManager.pictureID || item.id == DecorManager.rugID || item.id == DecorManager.toyID || item.id == DecorManager.wallID || item.id == DecorManager.waterID || item.id == DecorManager.windowID || item.id == DecorManager.bathtoyID || item.id == DecorManager.towelID || item.id == DecorManager.cabinetID || item.id == DecorManager.bathID || item.id == DecorManager.bathmatID || item.id == DecorManager.tilewallID || item.id == DecorManager.tilefloorID || item.id == DecorManager.bathwallID || item.id == DecorManager.kitchenWallID || item.id == DecorManager.kitchenFloorID || item.id == DecorManager.backsplashID || item.id == DecorManager.lowerCabinetID || item.id == DecorManager.counterID || item.id == DecorManager.stoveID || item.id == DecorManager.fridgeID || item.id == DecorManager.upperCabinetID || item.id == DecorManager.kitchenMatID {
            return true
        } else {
            return false
        }
    }
    
    func loadPurchaseState() {
        // load purchase status
        var managedContext = CoreDataManager.shared.managedObjectContext
        var fetchRequest = NSFetchRequest<PurchaseState>(entityName: "PurchaseState")
        
        do {
            var purchases = try managedContext.fetch(fetchRequest)
            print("purchases loaded")
            
            for purchase in purchases {
                Purchases.purchaseStatus[purchase.id] = purchase.isPurchased
            }
        } catch let error as NSError {
            //showAlert(title: "Could not retrieve data", message: "\(error.userInfo)")
        }
        
        StoreInventory.unpurchased.removeAll()
        StoreInventory.purchased.removeAll()
        
        for item in StoreInventory.inventory {
            if Purchases.purchaseStatus[item.id] == nil {
                StoreInventory.unpurchased.append(item)
            } else {
                StoreInventory.purchased.append(item)
            }
        }
    }
    
    func savePurchaseState() {
        var managedContext = CoreDataManager.shared.managedObjectContext
        
        // save purchase status in core data
        guard let item = selected else { return }
        let purchase = PurchaseState(context: managedContext)
        
        purchase.id = item.id
        purchase.isPurchased = true
        
        Purchases.purchaseStatus[purchase.id] = purchase.isPurchased
        
        do {
            try managedContext.save()
            print("saved")
        } catch {
            // this should never be displayed but is here to cover the possibility
            //showAlert(title: "Save failed", message: "Notice: Data has not successfully been saved.")
        }
        
        StoreInventory.unpurchased.removeAll()
        StoreInventory.purchased.removeAll()
        
        for item in StoreInventory.inventory {
            if Purchases.purchaseStatus[item.id] == nil {
                StoreInventory.unpurchased.append(item)
            } else {
                StoreInventory.purchased.append(item)
            }
        }
    }
    
    func saveEquipment() {
        var managedContext = CoreDataManager.shared.managedObjectContext
        
        guard let previousSave = DecorManager.equipped else {
            // no save was loaded so this is a new save
            
            let equipment = Equipped(context: managedContext)
            
            equipment.bed = DecorManager.bedID
            equipment.bowl = DecorManager.bowlID
            equipment.couch = DecorManager.couchID
            equipment.decor = DecorManager.decorID
            equipment.floor = DecorManager.floorID
            equipment.picture = DecorManager.pictureID
            equipment.rug = DecorManager.rugID
            equipment.toy = DecorManager.toyID
            equipment.wall = DecorManager.wallID
            equipment.waterbowl = DecorManager.waterID
            equipment.window = DecorManager.windowID
            equipment.bathtoy = DecorManager.bathtoyID
            equipment.towel = DecorManager.towelID
            equipment.cabinet = DecorManager.cabinetID
            equipment.bath = DecorManager.bathID
            equipment.bathmat = DecorManager.bathmatID
            equipment.tilewall = DecorManager.tilewallID
            equipment.tilefloor = DecorManager.tilefloorID
            equipment.bathwall = DecorManager.bathwallID
            equipment.backsplash = DecorManager.backsplashID
            equipment.counter = DecorManager.counterID
            equipment.fridge = DecorManager.fridgeID
            equipment.kitchenfloor = DecorManager.kitchenFloorID
            equipment.kitchenmat = DecorManager.kitchenMatID
            equipment.kitchenwall = DecorManager.kitchenWallID
            equipment.lowercabinet = DecorManager.lowerCabinetID
            equipment.stove = DecorManager.stoveID
            equipment.uppercabinet = DecorManager.upperCabinetID
            
            do {
                try managedContext.save()
                print("decor saved")
            } catch {
                // show alert
            }
            
            return
        }
        
        // previous save exists, simply overwrite
        previousSave.bed = DecorManager.bedID
        previousSave.bowl = DecorManager.bowlID
        previousSave.couch = DecorManager.couchID
        previousSave.decor = DecorManager.decorID
        previousSave.floor = DecorManager.floorID
        previousSave.picture = DecorManager.pictureID
        previousSave.rug = DecorManager.rugID
        previousSave.toy = DecorManager.toyID
        previousSave.wall = DecorManager.wallID
        previousSave.waterbowl = DecorManager.waterID
        previousSave.window = DecorManager.windowID
        previousSave.bathtoy = DecorManager.bathtoyID
        previousSave.towel = DecorManager.towelID
        previousSave.cabinet = DecorManager.cabinetID
        previousSave.bath = DecorManager.bathID
        previousSave.bathmat = DecorManager.bathmatID
        previousSave.tilewall = DecorManager.tilewallID
        previousSave.tilefloor = DecorManager.tilefloorID
        previousSave.bathwall = DecorManager.bathwallID
        previousSave.backsplash = DecorManager.backsplashID
        previousSave.counter = DecorManager.counterID
        previousSave.fridge = DecorManager.fridgeID
        previousSave.kitchenfloor = DecorManager.kitchenFloorID
        previousSave.kitchenmat = DecorManager.kitchenMatID
        previousSave.kitchenwall = DecorManager.kitchenWallID
        previousSave.lowercabinet = DecorManager.lowerCabinetID
        previousSave.stove = DecorManager.stoveID
        previousSave.uppercabinet = DecorManager.upperCabinetID

        
        do {
            try managedContext.save()
            print("decor resaved")
        } catch {
            // show alert
        }
    }
    
    func subtractCurrency(with amount: Int) {
        var managedContext = CoreDataManager.shared.managedObjectContext
        
        // rewrite data
        if let currentCurrency = Currency.loaded {
            let newTotal = Currency.userTotal - amount
            Currency.userTotal = newTotal
            currentCurrency.total = Int64(newTotal)
            
            do {
                try managedContext.save()
                print("resave successful")
            } catch {
                // this should never be displayed but is here to cover the possibility
                //showAlert(title: "Save failed", message: "Notice: Data has not successfully been saved.")
            }
        } else {
            print("currency loaded is nil")
        }
    }
}
