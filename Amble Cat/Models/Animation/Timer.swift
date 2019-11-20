//
//  Timer.swift
//  Amble Cat
//
//  Created by Kate Duncan-Welke on 10/18/19.
//  Copyright © 2019 Kate Duncan-Welke. All rights reserved.
//

import Foundation
import UIKit

class TimerManager {
    
    static var seconds = 0
    static var timer: Timer?
    
    static func beginTimer(with image: UIImageView) {
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            seconds += 1
            
            if seconds == 5 {
                image.startAnimating()
            } else if seconds == 6 {
                seconds = 0
                
                if image.tag == 1 {
                    let tailTwitch = Bool.random()
                    
                    if tailTwitch {
                        image.animationImages = AnimationManager.tailAnimation
                        image.startAnimating()
                        seconds = 5
                    } else {
                        image.animationImages = AnimationManager.blinkAnimation
                    }
                }
                
            } else {
                image.stopAnimating()
            }
        }
        
        timer?.fire()
    }

    static func stopTimer() {
        timer?.invalidate()
        seconds = 0
    }
}
