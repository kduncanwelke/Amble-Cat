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
        catArt.startAnimating()
        let middleDestination = CGPoint(x: wallArt.frame.width/2, y: wallArt.frame.height/3)
        
        catArt.move(to: middleDestination, duration: 2.0, options: UIView.AnimationOptions.curveEaseOut)
        AnimationManager.location = .middle
    }
}
