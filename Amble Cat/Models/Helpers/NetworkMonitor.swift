//
//  NetworkMonitor.swift
//  Amble Cat
//
//  Created by Kate Duncan-Welke on 11/26/19.
//  Copyright © 2019 Kate Duncan-Welke. All rights reserved.
//

import Foundation
import Network

struct NetworkMonitor {
    
    static let monitor = NWPathMonitor()
    static var connection = true
}
