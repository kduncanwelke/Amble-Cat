//
//  WatchDataModel.swift
//  MicroKittyWatch Watch App
//
//  Created by Katherine Duncan-Welke on 9/26/24.
//  Copyright © 2024 Kate Duncan-Welke. All rights reserved.
//

import Foundation
import WatchKit
import WatchConnectivity

class WatchDataModel: NSObject, WCSessionDelegate, ObservableObject {
    
    static let shared = WatchDataModel()
    let session = WCSession.default
    @Published var stepCount: Int = 0
    @Published var distance: Int = 0
    @Published var points: Int = 0
    
    override init() {
        super.init()
        if WCSession.isSupported() {
            session.delegate = self
            session.activate()
        } else {
            print("Watch connectivity not supported")
        }
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: (any Error)?) {
        if let error {
             print("session activation failed with error: \(error.localizedDescription)")
        } else {
            print("watch activated session")
        }
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        print(message)
        guard let newCount = message["steps"] as? Int, let newDistance = message["distance"] as? Int, let newPoints = message["points"] as? Int else {
            print("unknown data received")
            return
        }
        
        DispatchQueue.main.async {
            self.stepCount = newCount
            self.distance = newDistance
            self.points = newPoints
        }
    }
}
