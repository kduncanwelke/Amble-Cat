//
//  ViewModel+CoreData.swift
//  Amble Cat
//
//  Created by Kate Duncan-Welke on 2/2/21.
//  Copyright © 2021 Kate Duncan-Welke. All rights reserved.
//

import Foundation
import CoreData

extension ViewModel {
    // MARK: Core Data
    
    public func loadMeasure() {
        var managedContext = CoreDataManager.shared.managedObjectContext
        var fetchRequest = NSFetchRequest<Measurement>(entityName: "Measurement")
        
        do {
            var result = try managedContext.fetch(fetchRequest)
            if let result = result.first {
                Measures.loaded = result
                if result.selection == "Miles" {
                    Measures.preferred = Distance.miles
                } else if result.selection == "Meters" {
                    Measures.preferred = Distance.meters
                }
            }
            print("measures loaded")
            
        } catch let error as NSError {
            // showAlert(title: "Could not retrieve data", message: "\(error.userInfo)")
        }
    }
    
    func loadCurrency() {
        var managedContext = CoreDataManager.shared.managedObjectContext
        var fetchRequest = NSFetchRequest<Points>(entityName: "Points")
        
        do {
            var result = try managedContext.fetch(fetchRequest)
            if let total = result.first {
                print(total.total)
                Currency.loaded = total
                Currency.userTotal = Int(total.total)
            }
            print("total loaded")
            
        } catch let error as NSError {
            // showAlert(title: "Could not retrieve data", message: "\(error.userInfo)")
        }
    }
    
    func loadCareState() {
        var managedContext = CoreDataManager.shared.managedObjectContext
        var fetchRequest = NSFetchRequest<CareStatus>(entityName: "CareStatus")
        
        do {
            var resultArray = try managedContext.fetch(fetchRequest)
            if let result = resultArray.first {
                let calendar = Calendar.current
                
                // check if last care day was yesterday
                if let careDay = result.dateOfLastCare {
                    if calendar.isDateInYesterday(careDay) {
                        print("yesterday")
                        // if seven days of consistent care have passed, reset
                        if result.daysOfConsecutiveCare == 7 {
                            CareState.daysCaredFor = 0
                            CareState.care = result
                        } else {
                            // otherwise don't reset
                            CareState.daysCaredFor = result.daysOfConsecutiveCare
                            CareState.care = result
                        }
                    } else if calendar.isDateInToday(careDay) {
                        print("today")
                        CareState.daysCaredFor = result.daysOfConsecutiveCare
                        CareState.hasBeenFed = result.hasBeenFed
                        CareState.hasBeenWatered = result.hasBeenWatered
                        CareState.care = result
                    } else {
                        print("not yesterday")
                        // last care was not yesterday nor today
                        CareState.care = result
                        CareState.daysCaredFor = 0
                    }
                } else {
                    CareState.care = result
                    print("no date")
                }
            }
            
            print("care loaded")
            
        } catch let error as NSError {
            // showAlert(title: "Could not retrieve data", message: "\(error.userInfo)")
        }
    }
    
    func saveCare() {
        var managedContext = CoreDataManager.shared.managedObjectContext
        
        // save care anew if it doesn't exist (like on app initial launch)
        guard let currentCare = CareState.care else {
            let careSave = CareStatus(context: managedContext)
            
            careSave.hasBeenFed = CareState.hasBeenFed
            careSave.hasBeenWatered = CareState.hasBeenWatered
            careSave.daysOfConsecutiveCare = CareState.daysCaredFor
            
            CareState.care = careSave
            
            if CareState.hasBeenFed && CareState.hasBeenWatered {
                careSave.dateOfLastCare = Date()
                print("date save")
                print(careSave.dateOfLastCare)
            }
            
            do {
                try managedContext.save()
                print("saved")
            } catch {
                // this should never be displayed but is here to cover the possibility
                // showAlert(title: "Save failed", message: "Notice: Data has not successfully been saved.")
            }
            
            if CareState.hasBeenFed && CareState.hasBeenWatered {
                // FIXME: update hearts
                // updateHearts()
            }
            
            return
        }
        
        currentCare.hasBeenFed = CareState.hasBeenFed
        currentCare.hasBeenWatered = CareState.hasBeenWatered
        currentCare.daysOfConsecutiveCare = CareState.daysCaredFor
        
        CareState.care = currentCare
        
        if CareState.hasBeenFed && CareState.hasBeenWatered {
            currentCare.dateOfLastCare = Date()
        }
        
        do {
            try managedContext.save()
            print("resave successful")
        } catch {
            // this should never be displayed but is here to cover the possibility
            // showAlert(title: "Save failed", message: "Notice: Data has not successfully been saved.")
        }
        
        if CareState.hasBeenFed && CareState.hasBeenWatered {
            // FIXME: update hearts
            // updateHearts()
        }
    }
    
    func loadEquipment() {
        // load purchase status
        var managedContext = CoreDataManager.shared.managedObjectContext
        var fetchRequest = NSFetchRequest<Equipped>(entityName: "Equipped")
        
        do {
            var result = try managedContext.fetch(fetchRequest)
            if let loaded = result.first {
                DecorManager.equipped = loaded
                DecorManager.bedID = loaded.bed
                DecorManager.bowlID = loaded.bowl
                DecorManager.decorID = loaded.decor
                DecorManager.floorID = loaded.floor
                DecorManager.pictureID = loaded.picture
                DecorManager.rugID = loaded.rug
                DecorManager.toyID = loaded.toy
                DecorManager.wallID = loaded.wall
                DecorManager.waterID = loaded.waterbowl
                DecorManager.windowID = loaded.window
                
                print("equipment loaded")
            }
        } catch let error as NSError {
            //showAlert(title: "Could not retrieve data", message: "\(error.userInfo)")
        }
    }
    
    func addCurrency() {
        var managedContext = CoreDataManager.shared.managedObjectContext
        
        // save currency anew if it doesn't exist (like on app initial launch)
        guard let currentCurrency = Currency.loaded else {
            let pointSave = Points(context: managedContext)
            
            pointSave.total = Int64(Currency.toAdd)
            Currency.userTotal = Currency.toAdd
            
            do {
                try managedContext.save()
                print("saved")
            } catch {
                // this should never be displayed but is here to cover the possibility
                //showAlert(title: "Save failed", message: "Notice: Data has not successfully been saved.")
            }
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "refreshPoints"), object: nil)
            
            Currency.toAdd = 0
            return
        }
        
        // otherwise rewrite data
        let newTotal = Currency.userTotal + Currency.toAdd
        Currency.userTotal = newTotal
        currentCurrency.total = Int64(newTotal)
        Currency.toAdd = 0
        
        do {
            try managedContext.save()
            print("resave successful")
        } catch {
            // this should never be displayed but is here to cover the possibility
            //showAlert(title: "Save failed", message: "Notice: Data has not successfully been saved.")
        }
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "refreshPoints"), object: nil)
    }
}
