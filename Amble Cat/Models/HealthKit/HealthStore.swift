//
//  HealthStore.swift
//  Amble Cat
//
//  Created by Kate Duncan-Welke on 10/15/19.
//  Copyright © 2019 Kate Duncan-Welke. All rights reserved.
//

import Foundation
import HealthKit

struct HealthStore {
    
    public static let store = HKHealthStore()
    
    static let healthKitTypes: Set = [ HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!, HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceWalkingRunning)! ]
    
}

