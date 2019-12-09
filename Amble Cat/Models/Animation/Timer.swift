//
//  Timer.swift
//  Amble Cat
//
//  Created by Kate Duncan-Welke on 10/18/19.
//  Copyright © 2019 Kate Duncan-Welke. All rights reserved.
//

import Foundation
import UIKit

enum AnimationStyle {
    case blink
    case sitBlink
}

class TimerManager {
    
    static var seconds = 0
    static var timer: Timer?
    static var style: AnimationStyle?
    
    static func beginTimer(with image: UIImageView) {
        
        if image.animationImages == AnimationManager.blinkAnimation {
            style = .blink
        } else if image.animationImages == AnimationManager.sitBlinkAnimation {
            style = .sitBlink
        }
        
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
                        if style == .blink {
                            image.animationImages = AnimationManager.blinkAnimation
                        } else if style == .sitBlink {
                            image.animationImages = AnimationManager.sitBlinkAnimation
                        }
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


class TutorialTimer {
    
    static var seconds = 0
    static var timer: Timer?
    
    static func beginTimer(with image: UIImageView) {
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            seconds += 1
            
            
            
            if seconds == 5 {
                image.startAnimating()
            } else if seconds == 6 {
                seconds = 0
                
                let tailTwitch = Bool.random()
                
                if tailTwitch {
                    image.animationImages = AnimationManager.tailAnimation
                    image.startAnimating()
                    seconds = 5
                } else {
                    image.animationImages = AnimationManager.sitBlinkAnimation
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
