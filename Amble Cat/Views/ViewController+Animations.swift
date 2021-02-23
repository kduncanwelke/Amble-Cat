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
    
    func moveToMiddle() {
        print("move")
        catArt.animationImages = AnimationManager.walking
        catArt.animationDuration = 0.5
        catArt.startAnimating()
        let middleDestination = CGPoint(x: wallArt.frame.width/2, y: wallArt.frame.height/1.8)
        
        catArt.move(to: middleDestination, duration: 2.0, options: UIView.AnimationOptions.curveEaseOut)
        AnimationManager.location = .middle
    }
    
    func moveToFood() {
        print("food")
        catArt.animationImages = AnimationManager.walking
        catArt.animationDuration = 0.5
        catArt.startAnimating()
        let foodDestination = CGPoint(x: wallArt.frame.width/1.2, y: wallArt.frame.height/1.43)
        
        catArt.move(to: foodDestination, duration: 2.0, options: UIView.AnimationOptions.curveEaseOut)
        AnimationManager.location = .food
    }
    
    func eat() {
        catArt.animationImages = AnimationManager.eating
        catArt.animationDuration = 1.5
        catArt.startAnimating()
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
    }
    
    func moveToBath() {
        print("bath")
        catArt.animationImages = AnimationManager.walking
        catArt.animationDuration = 0.5
        catArt.startAnimating()
        let bathDestination = CGPoint(x: wallArt.frame.width/3.6, y: wallArt.frame.height/1.93)
        
        catArt.move(to: bathDestination, duration: 2.0, options: UIView.AnimationOptions.curveEaseOut)
        AnimationManager.location = .bath
    }
    
    func wash() {
        bathEdge.isHidden = false
        catArt.animationImages = AnimationManager.wash
        catArt.animationDuration = 2.0
        catArt.startAnimating()
    }
    
    func animateWater() {
        waterBowlArt.animationImages = AnimationManager.fountain
        waterBowlArt.animationDuration = 0.5
        waterBowlArt.startAnimating()
    }
}
