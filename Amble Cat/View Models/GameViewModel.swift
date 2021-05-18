//
//  GameViewModel.swift
//  Amble Cat
//
//  Created by Kate Duncan-Welke on 5/18/21.
//  Copyright © 2021 Kate Duncan-Welke. All rights reserved.
//

import Foundation

public class GameViewModel {
    
    func setPointsLabel() -> String {
        return "\(Currency.userTotal)"
    }
    
    func randomizePosition() {
        var pos = Int.random(in: 0...7)
        GameModel.currentPosition = pos
    }
    
    func setMouse() -> Int {
        return GameModel.currentPosition
    }
    
    func randomizeTime() {
        var time = Int.random(in: 1...3)
        GameModel.timeToHit = time
        
        GameTimer.beginTimer(repeatCount: GameModel.timeToHit)
    }
    
    func checkIfCorrect(image: Int) -> Bool {
        // check if timer is running aka tap occured within allotted time
        if GameTimer.timer?.isValid ?? false {
            if image == GameModel.currentPosition {
                return true
            } else {
                return false
            }
        } else {
            return false
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
    
    func addCurrency(with amount: Int) {
        Currency.toAdd = amount
        
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
