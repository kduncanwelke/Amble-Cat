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
        print("position \(pos)")
    }
    
    func setMouse() -> Int {
        return GameModel.currentPosition
    }
    
    func randomizeTime() {
        var time = Int.random(in: 2...3)
        GameModel.timeToHit = time
        
        GameTimer.beginTimer(repeatCount: GameModel.timeToHit)
    }
    
    func wait() {
        print("wait")
        var time = Int.random(in: 2...5)
        GameModel.waitTime = time
        GameTimer.waitTimer(repeatCount: time)
    }
    
    func newRound() {
        GameModel.rounds -= 1
        
        if GameModel.rounds <= 0 {
            gameOver()
        } else {
            randomizePosition()
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "showMouse"), object: nil)
            randomizeTime()
        }
        
        print("new round \(GameModel.rounds)")
    }
    
    func checkIfCorrect(image: Int) -> Bool {
        // check if timer is running aka tap occured within allotted time
        if GameTimer.timer?.isValid ?? false {
            if image == GameModel.currentPosition {
                GameTimer.cancelTimer()
                GameModel.baps += 1
                GameModel.winnings += 1
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
    
    func beginGame() {
        print("begin game")
       
        if GameModel.rounds <= 0 {
            gameOver()
        } else {
            wait()
            print(GameModel.rounds)
        }
    }
    
    func gameOver() {
        GameTimer.cancelTimer()
        GameTimer.cancelWaitTimer()
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "gameEnd"), object: nil)
    }
    
    func resetData() {
        GameModel.rounds = 6
        GameModel.winnings = 0
        GameModel.baps = 0
    }
    
    func winningsSummary() -> Int {
        return GameModel.winnings
    }
    
    func bapsSummary() -> Int {
        return GameModel.baps
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
