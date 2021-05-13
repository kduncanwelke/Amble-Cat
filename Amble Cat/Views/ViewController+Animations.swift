//
//  ViewController+Animations.swift
//  Amble Cat
//
//  Created by Kate Duncan-Welke on 2/16/21.
//  Copyright © 2021 Kate Duncan-Welke. All rights reserved.
//

import Foundation
import UIKit

extension ViewController {

    func beginAnimation(inMotion: Bool) {
        print("begin animation")
        catArt.stopAnimating()
        outsideBackground.stopAnimating()
        walkingOutside.stopAnimating()
        
        var showOutside = Bool.random()
        print("in motion \(inMotion)")
            
        if showOutside && inMotion && outsideView.isHidden {
            print("all true show outside")
            toggleOutside()
            randomOutside(moving: inMotion)
        } else if outsideBackground.isAnimating || walkingOutside.isAnimating {
            outsideBackground.stopAnimating()
            randomOutside(moving: inMotion)
            print("random outside")
        } else {
            disappearOutside()
            
            if paused {
                return
            }
            
            var staying = Bool.random()
            
            if staying {
                var placeAnimation = Bool.random()
                
                if placeAnimation {
                    print("random place")
                    randomPlaceAnimation()
                } else {
                    print("random staying")
                    randomStaying()
                }
            } else {
                var pause = Bool.random()
                
                if pause {
                    pauseCat()
                } else {
                    print("random move")
                    if AnimationManager.location == .couch {
                        jumpDown()
                    } else {
                        randomMove()
                    }
                }
            }
        }
    }
    
    func randomMove() {
        var num = Int.random(in: 0...8)
        
        var destination = AnimationManager.Location(rawValue: num)
        
        switch (AnimationManager.location, destination) {
        case (.middle, .middle), (.bed, .bed), (.couch, .couch),(.food, .food), (.water,.water), (.toy, .toy), (.right, .right), (.left, .left):
            randomPlaceAnimation()
            return
        case (.middle, .bed), (.middle, .food), (.middle, .right), (.bed, .food), (.bed, .right), (.couch, .middle), (.couch, .bed), (.couch, .food), (.couch, .water), (.couch, .right), (.food, .right), (.food, .bed), (.water, .middle), (.water, .bed), (.water, .food), (.water, .right), (.toy, .middle), (.toy, .bed), (.toy, .food), (.toy, .right), (.left, .middle), (.left, .bed), (.left, .food), (.left, .water), (.left, .right):
            AnimationManager.direction = .right
        default:
            AnimationManager.direction = .left
        }
        
        AnimationManager.position = .standing
        
        switch destination {
        case .couch:
            moveToCouch()
        case .bed:
            moveToBed()
        case .food:
            moveToFood()
        case .left:
            moveToLeft()
        case .middle:
            moveToMiddle()
        case .right:
            moveToRight()
        case .toy:
            moveToToy()
        case .water:
            moveToWater()
        case .none:
            randomPlaceAnimation()
        }
    }
    
    func randomStaying() {
        if AnimationManager.position == .standing {
            var sitDown = Bool.random()
            
            if sitDown {
                var front = Bool.random()
                
                if front {
                    frontSit()
                } else {
                    sit()
                }
            } else {
                var blink = Bool.random()
                
                if blink {
                    sitBlink()
                } else {
                    sitTail()
                }
            }
            
            AnimationManager.position = .seated
        } else {
            var sitDown = Bool.random()
            var goToSleep = Bool.random()
            
            if goToSleep {
                sleep()
            } else if sitDown {
                AnimationManager.position = .seated
                var front = Bool.random()
                
                if front {
                    frontSit()
                } else {
                    sit()
                }
            } else {
                var standUp = Bool.random()
                
                if standUp {
                    stand()
                    AnimationManager.position = .standing
                } else {
                    AnimationManager.position = .seated
                    sitTail()
                }
            }
        }
    }
    
    // MARK: Outdoor animations
    
    func animateOutside() {
        outsideBackground.animationImages = AnimationManager.outside
        outsideBackground.animationDuration = 6.5
        outsideBackground.startAnimating()
        
        AnimationManager.direction = .left
        walkingOutside.animationImages = AnimationManager.walking
        walkingOutside.animationDuration = 1.0
        walkingOutside.startAnimating()
        AnimationTimer.beginTimer(once: false, outdoors: true)
    }
    
    func randomOutside(moving: Bool) {
        if moving {
            animateOutside()
        } else {
            var tail = Bool.random()
            var washing = Bool.random()
            
            if tail {
                sitTailOutside()
            } else if washing {
                washOutside()
            } else {
                sitBlinkOutside()
            }
        }
    }
    
    func stopWalkingOutside() {
        walkingOutside.stopAnimating()
        outsideBackground.stopAnimating()
    }
    
    func sitTailOutside() {
        walkingOutside.animationImages = AnimationManager.sitTail
        walkingOutside.animationDuration = 2.0
        walkingOutside.startAnimating()
        AnimationTimer.beginTimer(once: false, outdoors: false)
    }
    
    func sitBlinkOutside() {
        walkingOutside.animationImages = AnimationManager.sitBlink
        walkingOutside.animationDuration = 3.0
        walkingOutside.startAnimating()
        AnimationTimer.beginTimer(once: true, outdoors: false)
    }
    
    func washOutside() {
        walkingOutside.animationImages = AnimationManager.wash
        walkingOutside.animationDuration = 2.0
        walkingOutside.startAnimating()
        AnimationTimer.beginTimer(once: false, outdoors: false)
    }
    
    // MARK: Indoor animations

    @objc func jumpUp() {
        print("jump")
        catArt.animationImages = AnimationManager.jump
        catArt.animationDuration = 1.0
        catArt.startAnimating()
        let jumpDestination = CGPoint(x: wallArt.frame.width/2.5, y: wallArt.frame.height/2.0)
        
        catArt.move(to: jumpDestination, duration: 1.0, options: UIView.AnimationOptions.curveEaseOut)
    }
    
    func jumpDown() {
        print("jump down")
        catArt.animationImages = AnimationManager.jumpDown
        catArt.animationDuration = 1.0
        catArt.startAnimating()
        let jumpDownDestination = CGPoint(x: wallArt.frame.width/5, y: wallArt.frame.height/1.6)
        
        catArt.move(to: jumpDownDestination, duration: 1.0, options: UIView.AnimationOptions.curveEaseOut)
        AnimationManager.location = .left
    }
    func pauseCat() {
        catArt.image = AnimationManager.pause.randomElement()
        AnimationTimer.beginTimer(once: false, outdoors: false)
    }
    
    func sit() {
        catArt.image = AnimationManager.sitDown
        catArt.animationDuration = 1.0
        catArt.startAnimating()
        AnimationTimer.beginTimer(once: true, outdoors: false)
    }
    
    func frontSit() {
        catArt.animationImages = AnimationManager.frontSit
        catArt.animationDuration = 1.0
        catArt.startAnimating()
        AnimationTimer.beginTimer(once: true, outdoors: false)
    }
    
    func stand() {
        catArt.image = AnimationManager.standUp
        catArt.animationDuration = 1.0
        catArt.startAnimating()
        AnimationTimer.beginTimer(once: true, outdoors: false)
    }
    
    func sitTail() {
        catArt.animationImages = AnimationManager.sitTail
        catArt.animationDuration = 2.0
        catArt.startAnimating()
        AnimationTimer.beginTimer(once: false, outdoors: false)
    }
    
    func sitBlink() {
        catArt.animationImages = AnimationManager.sitBlink
        catArt.animationDuration = 3.0
        catArt.startAnimating()
        AnimationTimer.beginTimer(once: true, outdoors: false)
    }
    
    func moveToMiddle() {
        print("move")
        catArt.animationImages = AnimationManager.walking
        catArt.animationDuration = 0.5
        catArt.startAnimating()
        let middleDestination = CGPoint(x: wallArt.frame.width/1.5, y: wallArt.frame.height/1.8)
        
        catArt.move(to: middleDestination, duration: 2.0, options: UIView.AnimationOptions.curveEaseOut)
        AnimationManager.location = .middle
    }
    
    func moveToFood() {
        print("food")
        catArt.animationImages = AnimationManager.walking
        catArt.animationDuration = 0.5
        catArt.startAnimating()
        let foodDestination = CGPoint(x: wallArt.frame.width/1.2, y: wallArt.frame.height/1.2)
        
        catArt.move(to: foodDestination, duration: 2.0, options: UIView.AnimationOptions.curveEaseOut)
        AnimationManager.location = .food
    }
    
    func eat() {
        catArt.animationImages = AnimationManager.eating
        catArt.animationDuration = 1.5
        catArt.startAnimating()
        AnimationTimer.beginTimer(once: false, outdoors: false)
    }
    
    func moveToWater() {
        print("water")
        catArt.animationImages = AnimationManager.walking
        catArt.animationDuration = 0.5
        catArt.startAnimating()
        let waterDestination = CGPoint(x: wallArt.frame.width/2.13, y: wallArt.frame.height/1.3)
        
        catArt.move(to: waterDestination, duration: 2.0, options: UIView.AnimationOptions.curveEaseOut)
        AnimationManager.location = .water
    }
    
    func drink() {
        catArt.animationImages = AnimationManager.drinking
        catArt.animationDuration = 1.0
        catArt.startAnimating()
        AnimationTimer.beginTimer(once: false, outdoors: false)
    }
    
    func moveToBed() {
        print("bed")
        catArt.animationImages = AnimationManager.walking
        catArt.animationDuration = 0.5
        catArt.startAnimating()
        let bedDestination = CGPoint(x: wallArt.frame.width/1.26, y: wallArt.frame.height/1.85)
        
        catArt.move(to: bedDestination, duration: 2.0, options: UIView.AnimationOptions.curveEaseOut)
        AnimationManager.location = .bed
    }
    
    func sleep() {
        catArt.animationImages = AnimationManager.sleep
        catArt.animationDuration = 3.0
        catArt.startAnimating()
        AnimationTimer.beginTimer(once: false, outdoors: false)
    }
    
    func moveToToy() {
        print("toy")
        catArt.animationImages = AnimationManager.walking
        catArt.animationDuration = 0.5
        catArt.startAnimating()
        let toyDestination = CGPoint(x: wallArt.frame.width/3.5, y: wallArt.frame.height/1.45)
        
        catArt.move(to: toyDestination, duration: 3.0, options: UIView.AnimationOptions.curveEaseOut)
        AnimationManager.location = .toy
    }
    
    func play() {
        catArt.animationImages = AnimationManager.play
        catArt.animationDuration = 1.5
        catArt.startAnimating()
        AnimationTimer.beginTimer(once: false, outdoors: false)
    }
    
    func moveToCouch() {
        print("couch")
        catArt.animationImages = AnimationManager.walking
        catArt.animationDuration = 0.5
        catArt.startAnimating()
        let couchDestination = CGPoint(x: wallArt.frame.width/2.5, y: wallArt.frame.height/1.6)
        
        catArt.moveWithJump(to: couchDestination, duration: 2.0, options: UIView.AnimationOptions.curveEaseOut)
        AnimationManager.location = .couch
    }
    
    func animateWater() {
        waterBowlArt.animationImages = AnimationManager.fountain
        waterBowlArt.animationDuration = 0.5
        waterBowlArt.startAnimating()
    }
    
    func moveToRight() {
        print("right")
        catArt.animationImages = AnimationManager.walking
        catArt.animationDuration = 0.5
        catArt.startAnimating()
        let rightDestination = CGPoint(x: wallArt.frame.width/1.2, y: wallArt.frame.height/1.6)
        
        catArt.move(to: rightDestination, duration: 2.0, options: UIView.AnimationOptions.curveEaseOut)
        AnimationManager.location = .right
    }
    
    func moveToLeft() {
        print("left")
        catArt.animationImages = AnimationManager.walking
        catArt.animationDuration = 0.5
        catArt.startAnimating()
        let leftDestination = CGPoint(x: wallArt.frame.width/5, y: wallArt.frame.height/1.6)
        
        catArt.move(to: leftDestination, duration: 2.5, options: UIView.AnimationOptions.curveEaseOut)
        AnimationManager.location = .left
    }
    
    // MARK: Bathroom animations
    
    func wash() {
        bathWater.isHidden = false
        catArt.animationImages = AnimationManager.wash
        catArt.animationDuration = 2.0
        catArt.startAnimating()
        AnimationTimer.beginTimer(once: false, outdoors: false)
    }
    
}
