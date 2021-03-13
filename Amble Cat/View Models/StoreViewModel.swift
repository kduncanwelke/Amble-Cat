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
            print("inventory")
        } else if segment == 1 {
            currentSource = StoreInventory.purchased
            print("purchased")
        } else {
            currentSource = StoreInventory.unpurchased
            print("unpurchased")
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
    
    func getPurchaseState(index: IndexPath) -> Bool {
        if Purchases.purchaseStatus[currentSource[index.row].id] != nil {
            return true
        } else {
            return false
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
        
        if item.id == DecorManager.bedID || item.id == DecorManager.bowlID || item.id == DecorManager.decorID || item.id == DecorManager.floorID || item.id == DecorManager.pictureID || item.id == DecorManager.rugID || item.id == DecorManager.toyID || item.id == DecorManager.wallID || item.id == DecorManager.waterID || item.id == DecorManager.windowID {
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
            equipment.decor = DecorManager.decorID
            equipment.floor = DecorManager.floorID
            equipment.picture = DecorManager.pictureID
            equipment.rug = DecorManager.rugID
            equipment.toy = DecorManager.toyID
            equipment.wall = DecorManager.wallID
            equipment.waterbowl = DecorManager.waterID
            equipment.window = DecorManager.windowID
            
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
        previousSave.decor = DecorManager.decorID
        previousSave.floor = DecorManager.floorID
        previousSave.picture = DecorManager.pictureID
        previousSave.rug = DecorManager.rugID
        previousSave.toy = DecorManager.toyID
        previousSave.wall = DecorManager.wallID
        previousSave.waterbowl = DecorManager.waterID
        previousSave.window = DecorManager.windowID
        
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
