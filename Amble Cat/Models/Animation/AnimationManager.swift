//
//  AnimationManager.swift
//  Amble Cat
//
//  Created by Kate Duncan-Welke on 11/13/19.
//  Copyright © 2019 Kate Duncan-Welke. All rights reserved.
//

import Foundation
import UIKit

struct AnimationManager {
    
    static var location: Location = .middle
    static var direction: Direction = .left
    
    enum Location {
        case middle
        case bed
        case bath
        case food
        case water
        case toy
        case right
        case left
        case lowerRight
        case lowerLeft
    }
    
    enum Direction {
        case left
        case right
    }
    
    static var standBlink: [UIImage] {
        get {
            switch AnimationManager.direction {
            case .left:
                return [#imageLiteral(resourceName: "left.png"),#imageLiteral(resourceName: "leftblink.png")]
            case .right:
                return [#imageLiteral(resourceName: "right.png"),#imageLiteral(resourceName: "rightblink.png")]
            }
        }
    }
    
    static var standUp: [UIImage] {
        get {
            switch AnimationManager.direction {
            case .left:
                return [#imageLiteral(resourceName: "leftsit.png"),#imageLiteral(resourceName: "left.png")]
            case .right:
                return [#imageLiteral(resourceName: "rightsit.png"),#imageLiteral(resourceName: "right.png")]
            }
        }
    }
    
    static var sitDown: [UIImage] {
        get {
            switch AnimationManager.direction {
            case .left:
                return [#imageLiteral(resourceName: "left.png"),#imageLiteral(resourceName: "leftsit.png")]
            case .right:
                return [#imageLiteral(resourceName: "right.png"),#imageLiteral(resourceName: "rightsit.png")]
            }
        }
    }
    
    static var sitBlink: [UIImage] {
        get {
            switch AnimationManager.direction {
            case .left:
                return [#imageLiteral(resourceName: "leftsit.png"),#imageLiteral(resourceName: "leftsitblink.png")]
            case .right:
                return [#imageLiteral(resourceName: "rightsit.png"),#imageLiteral(resourceName: "rightsitblink.png")]
            }
        }
    }
    
    static var sitTail: [UIImage] {
        get {
            switch AnimationManager.direction {
            case .left:
                return [#imageLiteral(resourceName: "leftsit.png"),#imageLiteral(resourceName: "leftsitblink.png")]
            case .right:
                return [#imageLiteral(resourceName: "rightsit.png"),#imageLiteral(resourceName: "rightsittail.png")]
            }
        }
    }
    
    static var walking: [UIImage] {
        get {
            switch AnimationManager.direction {
            case .left:
                return [#imageLiteral(resourceName: "sideleft.png"),#imageLiteral(resourceName: "walkleft.png"),#imageLiteral(resourceName: "walkleft1.png"),#imageLiteral(resourceName: "walkleft2.png"),#imageLiteral(resourceName: "walkleft3.png")]
            case .right:
                return [#imageLiteral(resourceName: "sideright.png"),#imageLiteral(resourceName: "walkright.png"),#imageLiteral(resourceName: "walkright1.png"),#imageLiteral(resourceName: "walkright2.png"),#imageLiteral(resourceName: "walkright3.png")]
            }
        }
    }
    
    static let back: [UIImage] = [#imageLiteral(resourceName: "back.png")]
    static let drinking: [UIImage] = [#imageLiteral(resourceName: "drink1.png"),#imageLiteral(resourceName: "drink2.png"),#imageLiteral(resourceName: "drink3.png")]
    static let eating: [UIImage] = [#imageLiteral(resourceName: "eating1.png"),#imageLiteral(resourceName: "eating2.png")]
    static let frontSit: [UIImage] = [#imageLiteral(resourceName: "front.png"),#imageLiteral(resourceName: "sitblink.png")]
    static let play: [UIImage] = [#imageLiteral(resourceName: "play1.png"),#imageLiteral(resourceName: "play2.png")]
    static let sleep: [UIImage] = [#imageLiteral(resourceName: "sleep1.png"),#imageLiteral(resourceName: "sleep2.png")]
    static let wash: [UIImage] = [#imageLiteral(resourceName: "washing1.png"),#imageLiteral(resourceName: "washing2.png"),#imageLiteral(resourceName: "washing3.png"),#imageLiteral(resourceName: "washing4.png")]
    
    static let fountain: [UIImage] = [#imageLiteral(resourceName: "fountain.png"),#imageLiteral(resourceName: "fountain2.png")]
}
