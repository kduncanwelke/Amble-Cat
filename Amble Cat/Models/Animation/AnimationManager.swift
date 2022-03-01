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
    
    static var currentView: CurrentView = .room
    
    static var location: Location = .right
    static var direction: Direction = .left
    static var position: Position = .standing

    static var kitchenLocation: KitchenLocation = .mat
    static var kitchenDirection: Direction = .left
    static var kitchenPosition: Position = .standing
    
    static var bathroomLocation: BathroomLocation = .mat
    static var bathroomDirection: Direction = .left
    static var bathroomPosition: Position = .standing
    
    enum CurrentView: Int {
        case room
        case kitchen
        case bathroom
        case outside
    }
    
    enum Location: Int {
        case middle
        case bed
        case couch
        case toy
        case right
        case left
        case cushion
    }
    
    enum Direction {
        case left
        case right
    }
    
    enum Position {
        case seated
        case standing
    }

    enum KitchenLocation: Int {
        case food
        case water
        case mat
        case counter
        case right
        case left
    }
    
    enum BathroomLocation: Int {
        case bath
        case counter
        case mat
        case bathtoy
        case right
    }
    
    static var standBlink: [UIImage] {
        get {
            switch currentView {
            case .room, .outside:
                switch AnimationManager.direction {
                case .left:
                    return [#imageLiteral(resourceName: "left.png"),#imageLiteral(resourceName: "leftblink.png")]
                case .right:
                    return [#imageLiteral(resourceName: "right.png"),#imageLiteral(resourceName: "rightblink.png")]
                }
            case .kitchen:
                switch AnimationManager.kitchenDirection {
                case .left:
                    return [#imageLiteral(resourceName: "left.png"),#imageLiteral(resourceName: "leftblink.png")]
                case .right:
                    return [#imageLiteral(resourceName: "right.png"),#imageLiteral(resourceName: "rightblink.png")]
                }
            case .bathroom:
                switch AnimationManager.bathroomDirection {
                case .left:
                    return [#imageLiteral(resourceName: "left.png"),#imageLiteral(resourceName: "leftblink.png")]
                case .right:
                    return [#imageLiteral(resourceName: "right.png"),#imageLiteral(resourceName: "rightblink.png")]
                }
            }
        }
    }
    
    static var standUp: UIImage {
        get {
            switch currentView {
            case .room, .outside:
                switch AnimationManager.direction {
                case .left:
                    return #imageLiteral(resourceName: "left.png")
                case .right:
                    return #imageLiteral(resourceName: "right.png")
                }
            case .kitchen:
                switch AnimationManager.kitchenDirection {
                case .left:
                    return #imageLiteral(resourceName: "left.png")
                case .right:
                    return #imageLiteral(resourceName: "right.png")
                }
            case .bathroom:
                switch AnimationManager.bathroomDirection {
                case .left:
                    return #imageLiteral(resourceName: "left.png")
                case .right:
                    return #imageLiteral(resourceName: "right.png")
                }
            }
        }
    }
    
    static var sitDown: UIImage {
        get {
            switch currentView {
            case .room, .outside:
                switch AnimationManager.direction {
                case .left:
                    return #imageLiteral(resourceName: "leftsit.png")
                case .right:
                    return #imageLiteral(resourceName: "rightsit.png")
                }
            case .kitchen:
                switch AnimationManager.kitchenDirection {
                case .left:
                    return #imageLiteral(resourceName: "leftsit.png")
                case .right:
                    return #imageLiteral(resourceName: "rightsit.png")
                }
            case .bathroom:
                switch AnimationManager.bathroomDirection {
                case .left:
                    return #imageLiteral(resourceName: "leftsit.png")
                case .right:
                    return #imageLiteral(resourceName: "rightsit.png")
                }
            }
        }
    }
    
    static var sitBlink: [UIImage] {
        get {
            switch currentView {
            case .room, .outside:
                switch AnimationManager.direction {
                case .left:
                    return [#imageLiteral(resourceName: "leftsit.png"),#imageLiteral(resourceName: "leftsitblink.png")]
                case .right:
                    return [#imageLiteral(resourceName: "rightsit.png"),#imageLiteral(resourceName: "rightsitblink.png")]
                }
            case .kitchen:
                switch AnimationManager.kitchenDirection {
                case .left:
                    return [#imageLiteral(resourceName: "leftsit.png"),#imageLiteral(resourceName: "leftsitblink.png")]
                case .right:
                    return [#imageLiteral(resourceName: "rightsit.png"),#imageLiteral(resourceName: "rightsitblink.png")]
                }
            case .bathroom:
                switch AnimationManager.bathroomDirection {
                case .left:
                    return [#imageLiteral(resourceName: "leftsit.png"),#imageLiteral(resourceName: "leftsitblink.png")]
                case .right:
                    return [#imageLiteral(resourceName: "rightsit.png"),#imageLiteral(resourceName: "rightsitblink.png")]
                }
            }
        }
    }
    
    static var sitTail: [UIImage] {
        get {
            switch currentView {
            case .room, .outside:
                switch AnimationManager.direction {
                case .left:
                    return [#imageLiteral(resourceName: "leftsit.png"),#imageLiteral(resourceName: "leftsittail.png")]
                case .right:
                    return [#imageLiteral(resourceName: "rightsit.png"),#imageLiteral(resourceName: "rightsittail.png")]
                }
            case .kitchen:
                switch AnimationManager.kitchenDirection {
                case .left:
                    return [#imageLiteral(resourceName: "leftsit.png"),#imageLiteral(resourceName: "leftsittail.png")]
                case .right:
                    return [#imageLiteral(resourceName: "rightsit.png"),#imageLiteral(resourceName: "rightsittail.png")]
                }
            case .bathroom:
                switch AnimationManager.bathroomDirection {
                case .left:
                    return [#imageLiteral(resourceName: "leftsit.png"),#imageLiteral(resourceName: "leftsittail.png")]
                case .right:
                    return [#imageLiteral(resourceName: "rightsit.png"),#imageLiteral(resourceName: "rightsittail.png")]
                }
            }
        }
    }
    
    static var walking: [UIImage] {
        get {
            switch currentView {
            case .room, .outside:
                switch AnimationManager.direction {
                case .left:
                    return [#imageLiteral(resourceName: "sideleft.png"),#imageLiteral(resourceName: "walkleft.png"),#imageLiteral(resourceName: "walkleft1.png"),#imageLiteral(resourceName: "walkleft2.png"),#imageLiteral(resourceName: "walkleft3.png")]
                case .right:
                    return [#imageLiteral(resourceName: "sideright.png"),#imageLiteral(resourceName: "walkright.png"),#imageLiteral(resourceName: "walkright1.png"),#imageLiteral(resourceName: "walkright2.png"),#imageLiteral(resourceName: "walkright3.png")]
                }
            case .kitchen:
                switch AnimationManager.kitchenDirection {
                case .left:
                    return [#imageLiteral(resourceName: "sideleft.png"),#imageLiteral(resourceName: "walkleft.png"),#imageLiteral(resourceName: "walkleft1.png"),#imageLiteral(resourceName: "walkleft2.png"),#imageLiteral(resourceName: "walkleft3.png")]
                case .right:
                    return [#imageLiteral(resourceName: "sideright.png"),#imageLiteral(resourceName: "walkright.png"),#imageLiteral(resourceName: "walkright1.png"),#imageLiteral(resourceName: "walkright2.png"),#imageLiteral(resourceName: "walkright3.png")]
                }
            case .bathroom:
                switch AnimationManager.bathroomDirection {
                case .left:
                    return [#imageLiteral(resourceName: "sideleft.png"),#imageLiteral(resourceName: "walkleft.png"),#imageLiteral(resourceName: "walkleft1.png"),#imageLiteral(resourceName: "walkleft2.png"),#imageLiteral(resourceName: "walkleft3.png")]
                case .right:
                    return [#imageLiteral(resourceName: "sideright.png"),#imageLiteral(resourceName: "walkright.png"),#imageLiteral(resourceName: "walkright1.png"),#imageLiteral(resourceName: "walkright2.png"),#imageLiteral(resourceName: "walkright3.png")]
                }
            }
        }
    }
    
    static var petting: [UIImage] {
        get {
            switch currentView {
            case .room, .outside:
                switch AnimationManager.direction {
                case .left:
                    return [#imageLiteral(resourceName: "pet1.png"),#imageLiteral(resourceName: "pet2.png")]
                case .right:
                    return [#imageLiteral(resourceName: "petright1.png"),#imageLiteral(resourceName: "petright2.png")]
                }
            case .kitchen:
                switch AnimationManager.kitchenDirection {
                case .left:
                    return [#imageLiteral(resourceName: "pet1.png"),#imageLiteral(resourceName: "pet2.png")]
                case .right:
                    return [#imageLiteral(resourceName: "petright1.png"),#imageLiteral(resourceName: "petright2.png")]
                }
            case .bathroom:
                switch AnimationManager.bathroomDirection {
                case .left:
                    return [#imageLiteral(resourceName: "pet1.png"),#imageLiteral(resourceName: "pet2.png")]
                case .right:
                    return [#imageLiteral(resourceName: "petright1.png"),#imageLiteral(resourceName: "petright2.png")]
                }
            }
        }
    }
    
    static let jump: [UIImage] = [#imageLiteral(resourceName: "jumpup.png"),#imageLiteral(resourceName: "back.png")]
    static let jumpDown: [UIImage] = [#imageLiteral(resourceName: "jumpdown.png"),#imageLiteral(resourceName: "sitting.png")]
    
    static let back: [UIImage] = [#imageLiteral(resourceName: "back.png")]
    static let drinking: [UIImage] = [#imageLiteral(resourceName: "drink1.png"),#imageLiteral(resourceName: "drink2.png"),#imageLiteral(resourceName: "drink3.png")]
    static let eating: [UIImage] = [#imageLiteral(resourceName: "eating1.png"),#imageLiteral(resourceName: "eating2.png")]
    static let frontSit: [UIImage] = [#imageLiteral(resourceName: "front.png"),#imageLiteral(resourceName: "sitblink.png")]
    static let play: [UIImage] = [#imageLiteral(resourceName: "play1.png"),#imageLiteral(resourceName: "play2.png")]
    static let sleep: [UIImage] = [#imageLiteral(resourceName: "sleep1.png"),#imageLiteral(resourceName: "sleep2.png")]
    static let wash: [UIImage] = [#imageLiteral(resourceName: "washing1.png"),#imageLiteral(resourceName: "washing2.png"),#imageLiteral(resourceName: "washing3.png"),#imageLiteral(resourceName: "washing4.png")]
    
    static let outside: [UIImage] = [#imageLiteral(resourceName: "outside1.png"),#imageLiteral(resourceName: "outside2.png"),#imageLiteral(resourceName: "outside3.png"),#imageLiteral(resourceName: "outside4.png"),#imageLiteral(resourceName: "outside5.png"),#imageLiteral(resourceName: "outside6.png")]
    
    static var pause: [UIImage] {
        get {
            switch currentView {
            case .room, .outside:
                switch AnimationManager.direction {
                case .left:
                    return [#imageLiteral(resourceName: "sitting.png"),#imageLiteral(resourceName: "leftsit.png"),#imageLiteral(resourceName: "left.png"),#imageLiteral(resourceName: "front.png"),#imageLiteral(resourceName: "back.png")]
                case .right:
                    return [#imageLiteral(resourceName: "rightsit.png"),#imageLiteral(resourceName: "right.png"),#imageLiteral(resourceName: "back.png")]
                }
            case .kitchen:
                switch AnimationManager.kitchenDirection {
                case .left:
                    return [#imageLiteral(resourceName: "sitting.png"),#imageLiteral(resourceName: "leftsit.png"),#imageLiteral(resourceName: "left.png"),#imageLiteral(resourceName: "front.png"),#imageLiteral(resourceName: "back.png")]
                case .right:
                    return [#imageLiteral(resourceName: "rightsit.png"),#imageLiteral(resourceName: "right.png"),#imageLiteral(resourceName: "back.png")]
                }
            case .bathroom:
                switch AnimationManager.bathroomDirection {
                case .left:
                    return [#imageLiteral(resourceName: "sitting.png"),#imageLiteral(resourceName: "leftsit.png"),#imageLiteral(resourceName: "left.png"),#imageLiteral(resourceName: "front.png"),#imageLiteral(resourceName: "back.png")]
                case .right:
                    return [#imageLiteral(resourceName: "rightsit.png"),#imageLiteral(resourceName: "right.png"),#imageLiteral(resourceName: "back.png")]
                }
            }
        }
    }
    
    static var fountain: [UIImage] {
        get {
            if DecorManager.waterID == 51 { // blue
                return [#imageLiteral(resourceName: "fountainblue1.png"),#imageLiteral(resourceName: "fountainblue2.png")]
            } else if DecorManager.waterID == 52 { // green
                return [#imageLiteral(resourceName: "fountaingreen1.png"),#imageLiteral(resourceName: "fountaingreen2.png")]
            } else if DecorManager.waterID == 53 { // yellow
                return [#imageLiteral(resourceName: "fountainyellow1.png"),#imageLiteral(resourceName: "fountainyellow2.png")]
            } else if DecorManager.waterID == 54 { // white
                return [#imageLiteral(resourceName: "fountainwhite1.png"),#imageLiteral(resourceName: "fountainwhite2.png")]
            } else { // black
                return [#imageLiteral(resourceName: "fountainblack1.png"),#imageLiteral(resourceName: "fountainblack2.png")]
            }
        }
    }
}
