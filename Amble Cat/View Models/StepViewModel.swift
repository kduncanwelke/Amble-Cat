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
    
    func getStepData() {
        let calendar = Calendar.current
        let now = Date()
        guard let week = calendar.date(byAdding: .day, value: -7, to: now) else { return }
        print(week)
        
        Pedometer.stepCounter.queryPedometerData(from: now, to: week) { (data, error) in
            print(data)
            Pedometer.stepData = data
        }
    }
    
}
