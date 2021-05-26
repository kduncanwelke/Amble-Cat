//
//  Random.swift
//  Amble Cat
//
//  Created by Kate Duncan-Welke on 5/21/21.
//  Copyright © 2021 Kate Duncan-Welke. All rights reserved.
//

import Foundation

struct Random {
    // random 15% chance generator
    static func randomChance() -> Bool {
        var randomInt = Int.random(in: 1...100)
        
        if randomInt < 16 {
            return true
        } else {
            return false
        }
    }
    
    static func randomWinning() -> Int {
        var randomAmount = Int.random(in: 1...2)
        return randomAmount
    }
}
