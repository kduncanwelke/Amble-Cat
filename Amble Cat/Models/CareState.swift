//
//  CareStatus.swift
//  Amble Cat
//
//  Created by Kate Duncan-Welke on 11/16/19.
//  Copyright © 2019 Kate Duncan-Welke. All rights reserved.
//

import Foundation

struct CareState {
    
    static var care: CareStatus?
    static var hasBeenFed = false
    static var hasBeenWatered = false
    static var daysCaredFor: Int64 = 0

}


enum CareCompleted {
    case food
    case water
}
