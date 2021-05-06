//
//  Pedometer.swift
//  Amble Cat
//
//  Created by Kate Duncan-Welke on 2/5/21.
//  Copyright © 2021 Kate Duncan-Welke. All rights reserved.
//

import Foundation
import CoreMotion

struct Pedometer {
    
    static let stepCounter = CMPedometer()
    static var stepData: [CMPedometerData] = []
    static let motion = CMMotionManager()
    static let motionManager = CMMotionActivityManager()
    
    static var today = 0
}
