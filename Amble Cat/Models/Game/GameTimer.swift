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
    
    static var waitTimer: Timer?
    static var waiting = 0
    
    // timer for animations
    static func beginTimer(repeatCount: Int) {
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            seconds += 1
            
            print("timer seconds \(seconds)")
            if seconds >= repeatCount {
                stopTimer()
            }
        }
        
        timer?.fire()
    }
    
    static func stopTimer() {
        timer?.invalidate()
        seconds = 0
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "start"), object: nil)
    }
    
    static func cancelTimer() {
        timer?.invalidate()
        seconds = 0
    }
    
    // timer for pauses in between mice
    static func waitTimer(repeatCount: Int) {
        
        waitTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            waiting += 1
            
            print("wait \(waiting)")
            if waiting >= repeatCount {
                stopWaitTimer()
            }
        }
        
        waitTimer?.fire()
    }
    
    static func stopWaitTimer() {
        waitTimer?.invalidate()
        waiting = 0
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "newRound"), object: nil)
    }
    
    static func cancelWaitTimer() {
        waitTimer?.invalidate()
        waiting = 0
    }
}
