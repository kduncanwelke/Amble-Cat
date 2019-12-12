//
//  HealthDataManager.swift
//  Amble Cat
//
//  Created by Kate Duncan-Welke on 10/15/19.
//  Copyright © 2019 Kate Duncan-Welke. All rights reserved.
//

import Foundation

struct HealthDataManager {
    
    static var stepHistory: [Double] = []
    static var dates: [Date] = []
    static var distances: [Double] = []
    
    static var startDate = -1
    static var endDate = -6
}


struct GraphManager {
    
    static var startIndex = 0
    static var endIndex = 6
}

struct Measures {
    static var preferred: Distance = .miles
    static var loaded: Measurement?
}

enum Distance: String {
    case meters = "Meters"
    case miles = "Miles"
}
