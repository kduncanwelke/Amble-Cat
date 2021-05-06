//
//  Timer.swift
//  Amble Cat
//
//  Created by Kate Duncan-Welke on 10/18/19.
//  Copyright © 2019 Kate Duncan-Welke. All rights reserved.
//

import Foundation
import UIKit

class AnimationTimer {
    
    static var seconds = 0
    static var timer: Timer?
    
    // timer for animations
    static func beginTimer(once: Bool, outdoors: Bool) {
        var repeatCount = 0
        var interval = 0.0
        
        if once {
            repeatCount = 1
            interval = 1.0
        } else if outdoors {
            interval = 6.5
            repeatCount = Int.random(in: 1...4)
        } else {
            interval = 1.0
            repeatCount = Int.random(in: 4...8)
        }
    
        print(repeatCount)
        
        timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { timer in
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
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "animationEnded"), object: nil)
    }
}

class TextTimer {
    
    static var seconds = 0
    static var timer: Timer?
    static var isRunning = false
    
    static func beginTimer(with label: UILabel, text: [Character]) {
        isRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 0.08, repeats: true) { timer in
           
            label.text?.append(text[seconds])
           
            if seconds == text.count-1 {
                timer.invalidate()
                seconds = 0
                isRunning = false
            } else {
                seconds += 1
            }
        }
        
        timer?.fire()
    }
    
    static func stopTimer() {
        timer?.invalidate()
        seconds = 0
        isRunning = false
    }
}
