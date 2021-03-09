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
    
    private let viewModel = ViewModel()
    
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
        var totalSteps = 0
        
        var now = Date()
        var startDate = Calendar.current.startOfDay(for: now)
        print("updating steps")
        
        Pedometer.stepCounter.startUpdates(from: startDate) { (data, error) in
            print(data)
            totalSteps = Int(data?.numberOfSteps ?? 0)
        }
    
        // update and save coins if awarded
        if totalSteps >= 20 {
            var coins = totalSteps / 20
            Currency.toAdd = coins
            viewModel.addCurrency()
        }
        
        return totalSteps
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
    
    func getDay(index: Int) -> String {
        var now = Date()
        
        var day = Calendar.current.date(byAdding: .day, value: -index, to: now) ?? Date()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        var dayOfWeek = dateFormatter.string(from: day)
        
        return dayOfWeek
    }
    
    func getSteps(index: Int) -> Int {
        if Pedometer.stepData.isEmpty {
            return 0
        }
        
        var steps = Int(Pedometer.stepData[index].numberOfSteps)
        
        return steps
    }
}
