//
//  GameTimer.swift
//  Amble Cat
//
//  Created by Kate Duncan-Welke on 5/18/21.
//  Copyright © 2021 Kate Duncan-Welke. All rights reserved.
//

import Foundation

class GameTimer {
    
    static var seconds = 0
    static var timer: Timer?
    
    // timer for animations
    static func beginTimer(repeatCount: Int) {
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            seconds += 1
            
            if seconds == repeatCount {
                stopTimer()
            }
        }
        
        timer?.fire()
    }
    
    static func stopTimer() {
        timer?.invalidate()
        seconds = 0
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "hideMouse"), object: nil)
    }
}
