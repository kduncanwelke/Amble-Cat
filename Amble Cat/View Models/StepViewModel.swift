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
        var day = Date()
        var nextDay = Date()
        
        for i in 1...7 {
            Pedometer.stepCounter.queryPedometerData(from: calendar.startOfDay(for: nextDay), to: day) { (data, error) in
                print("steps")
                print(data?.numberOfSteps)
                print(data?.endDate)
                
                if let steps = data {
                    Pedometer.stepData.append(steps)
                }
            }
            
            day = calendar.date(byAdding: .day, value: -i, to: day) ?? Date()
            nextDay = calendar.date(byAdding: .day, value: -i, to: day) ?? Date()
        }
    }
    
    func updateSteps() -> Int {
        // award coins with steps, not on app launch as before
        var totalSteps = 0
    
        print("updating steps")
        
        var now = Date()
        
        Pedometer.stepCounter.startUpdates(from: now) { (data, error) in
            print(data)
            totalSteps = Int(data?.numberOfSteps ?? 0)
        }
    
        // update and save coins if awarded
        if totalSteps >= 20 {
            var coins = totalSteps / 20
            Currency.toAdd = coins
            viewModel.addCurrency()
        }
        
        return totalSteps + Int(Pedometer.stepData.first?.numberOfSteps ?? 0)
    }
    
    func stopUpdating() {
        // stop when app is in background/terminated
        Pedometer.stepCounter.stopUpdates()
    }
    
    func stepsToday() -> Int  {
        return Int(Pedometer.stepData.first?.numberOfSteps ?? 0)
    }
    
    func distanceToday() -> Int {
        if Measures.preferred == .miles {
            var meters = Double(Pedometer.stepData.first?.distance ?? 0)
            return Int(meters * 0.000621371)
        } else {
            return Int(Pedometer.stepData.first?.distance ?? 0)
        }
    }
    
    func distanceMeasure() -> String {
        if Measures.preferred == .miles {
            return "Miles"
        } else {
            return "Meters"
        }
    }
    
    func getDay(index: Int) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, MMM d"
        var dayOfWeek = dateFormatter.string(from: Pedometer.stepData[index].endDate)
        
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
