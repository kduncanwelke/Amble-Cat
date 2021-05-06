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
    weak var stepTotalDelegate: StepTotalDelegate?
    let userDefaultDate = "userDefaultDate"
    private var moving = false
   
    func checkAvailable() {
        print(CMPedometer.isStepCountingAvailable())
        // show warning if device cannot count step data
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
    
    func getStepsToday() {
        let calendar = Calendar.current
        var steps = 0
        
        Pedometer.stepCounter.queryPedometerData(from: calendar.startOfDay(for: Date()), to: Date()) { (data, error) in
            print("steps today")
            print(data?.numberOfSteps)
           
            steps = Int(data?.numberOfSteps ?? 0)
            print("stupid \(steps)")
            Pedometer.today = steps
            
            DispatchQueue.main.async {
                self.stepTotalDelegate?.updateSteps(stepTotal: steps)
            }
        }
    }
    
    func addCoinsForMissedSteps() {
        let userDefaultDate = UserDefaults.standard.object(forKey: "userDefaultDate") as? Date ?? Date()
        
        Pedometer.stepCounter.queryPedometerData(from: userDefaultDate, to: Date()) { (data, error) in
            print("steps")
            print(data?.numberOfSteps)
            var stepsMissed = Int(data?.numberOfSteps ?? 0)
           
            print("steps missed \(stepsMissed)")
            
            if stepsMissed >= 20 {
                var coins = stepsMissed / 20
                print("coins added for missed \(coins)")
                Currency.toAdd = coins
                self.viewModel.addCurrency()
            }
        }
    }
    
    func updateSteps() {
        // award coins with steps, not on app launch as before
        var addedSteps = 0
        
        var newSteps: Int = 0 {
            willSet(newTotal) {
                print("About to set totalSteps to \(newTotal)")
            }
            didSet {
                if newSteps > oldValue  {
                    print("Added \(newSteps - oldValue) steps")
                    addedSteps += (newSteps - oldValue)
                }
            }
        }
        
        print("updating steps")
    
        Pedometer.stepCounter.startUpdates(from: Date()) { (data, error) in
            print(data?.numberOfSteps)
            newSteps = Int(data?.numberOfSteps ?? 0)
            
            var stepTotal = Int(Pedometer.stepData.first?.numberOfSteps ?? 0) + newSteps

            DispatchQueue.main.async {
                self.stepTotalDelegate?.updateSteps(stepTotal: stepTotal)
                
                // update and save coins if awarded
                if addedSteps >= 20 {
                    var coins = addedSteps / 20
                    print("coins \(coins)")
                    Currency.toAdd = coins
                    self.viewModel.addCurrency()
                    
                    var newValue = addedSteps % 20
                    addedSteps = newValue
                    print(newValue)
                }
            }
        }
    }
    
    func trackMovementType() {
        Pedometer.motionManager.startActivityUpdates(to: OperationQueue.main) { (activity: CMMotionActivity?) in
            guard let currentActivity = activity else { return }
           
            DispatchQueue.main.async {
                if currentActivity.automotive == true || currentActivity.stationary == true || currentActivity.unknown == true {
                    self.moving = false
                } else if currentActivity.walking == true || currentActivity.running == true || currentActivity.cycling == true {
                    self.moving = true
                } else {
                    self.moving = false
                }
            }
        }
    }
    
    func stopUpdating() {
        // stop when app is in background/terminated
        print("stop updating")
        Pedometer.stepCounter.stopUpdates()
        Pedometer.motionManager.stopActivityUpdates()
        
        // set userdefaults date, used to track last time steps were added
        let now = Date()
        UserDefaults.standard.set(now, forKey: self.userDefaultDate)
    }
    
    func startMotionUpdates() {
        Pedometer.motion.startDeviceMotionUpdates()
    }
    
    func isMoving() -> Bool {
        return moving
    }
    
    func stepsToday() -> Int {
        print("steps today")
        return Pedometer.today
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
        
        if !Pedometer.stepData.isEmpty {
            var dayOfWeek = dateFormatter.string(from: Pedometer.stepData[index].endDate)
            return dayOfWeek
        } else {
            var day = Calendar.current.date(byAdding: .day, value: -index, to: Date()) ?? Date()
            var dayOfWeek = dateFormatter.string(from: day)
            return dayOfWeek
        }
    }
    
    func getSteps(index: Int) -> Int {
        if Pedometer.stepData.isEmpty {
            print("data empty")
            return 0
        }
        
        var steps = Int(Pedometer.stepData[index].numberOfSteps)
        
        return steps
    }
}
