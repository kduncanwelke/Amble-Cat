//
//  PhoneDataModel.swift
//  MicroKittyWatch Watch App
//
//  Created by Katherine Duncan-Welke on 9/26/24.
//  Copyright © 2024 Kate Duncan-Welke. All rights reserved.
//

import Foundation
import WatchConnectivity
import SwiftUICore

class PhoneDataModel: NSObject, ObservableObject {
   
    static let shared = PhoneDataModel()
    let session = WCSession.default
    @Published var phoneCount: Int = 0
}
