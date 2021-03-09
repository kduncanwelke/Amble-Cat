//
//  HealthDataManager.swift
//  Amble Cat
//
//  Created by Kate Duncan-Welke on 10/15/19.
//  Copyright © 2019 Kate Duncan-Welke. All rights reserved.
//

import Foundation

struct Measures {
    static var preferred: Distance = .miles
    static var loaded: Measurement?
}

enum Distance: String {
    case meters = "Meters"
    case miles = "Miles"
}
