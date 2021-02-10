//
//  StepViewModel.swift
//  Amble Cat
//
//  Created by Kate Duncan-Welke on 2/5/21.
//  Copyright © 2021 Kate Duncan-Welke. All rights reserved.
//

import Foundation
import CoreMotion

public class StepViewModel {
    
    func checkAvailable() {
        print(CMPedometer.isStepCountingAvailable())
        // show warning if step data cannot be counted
    }
    
    func getStepData() {
        let calendar = Calendar.current
        let now = Date()
        
        var day = now
        
        for i in 1...6 {
            var nextDay = calendar.date(byAdding: .day, value: -1, to: day) ?? Date()
            
            Pedometer.stepCounter.queryPedometerData(from: day, to: nextDay) { (data, error) in
                print("steps")
                print(data?.numberOfSteps)
                print(data?.endDate)
                
                if let steps = data {
                    Pedometer.stepData.append(steps)
                }
            }
            
            day = calendar.date(byAdding: .day, value: -i, to: now) ?? Date()
        }
    }
    
    func updateSteps() -> Int {
        // award coins with steps, not on app launch as before
        var newSteps = 0
        
        Pedometer.stepCounter.startUpdates(from: Date()) { (data, error) in
            newSteps = Int(data?.numberOfSteps ?? 0)
        }
        
        // update and save coins if awarded
        
        return newSteps
    }
    
    func stopUpdating() {
        // stop when app is in background/terminated
        Pedometer.stepCounter.stopUpdates()
    }
    
    func stepsToday() -> Int  {
        return Int(Pedometer.stepData.first?.numberOfSteps ?? 0)
    }
    
    func metersToday() -> Int  {
        return Int(Pedometer.stepData.first?.distance ?? 0)
    }
}
