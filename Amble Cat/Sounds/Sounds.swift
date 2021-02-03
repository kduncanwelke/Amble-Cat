//
//  Sounds.swift
//  Amble Cat
//
//  Created by Kate Duncan-Welke on 12/7/19.
//  Copyright © 2019 Kate Duncan-Welke. All rights reserved.
//

import Foundation

import AudioToolbox

class Sound {
    var number: SystemSoundID
    var resourceName: String
    var type: String
    
    init(number: SystemSoundID, resourceName: String, type: String) {
        self.number = number
        self.resourceName = resourceName
        self.type = type
    }
    
    static func loadSound(number: inout SystemSoundID, resourceName: String, type: String) {
        let path = Bundle.main.path(forResource: resourceName, ofType: type)
        let soundURL = URL(fileURLWithPath: path!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &number)
    }
    
    static func playSound(number: SystemSoundID) {
        AudioServicesPlaySystemSound(number)
    }
    
}


struct Sounds {
    static let blopSound = Sound(number: 0, resourceName: "Blop-Mark_DiAngelo-79054334", type: "wav")
    static let tingSound = Sound(number: 1, resourceName: "Ting-Popup_Pixels-349896185", type: "wav")
    static let registerSound = Sound(number: 2, resourceName: "Blastwave_FX_CashRegister_S08IN.92", type: "mp3")
    static let meowSound = Sound(number: 3, resourceName: "animals_cat_meow_002", type: "mp3")
    static let chirpSound = Sound(number: 4, resourceName: "animals_cat_meow_003", type: "mp3")
    static let failSound = Sound(number: 5, resourceName: "sound_ex_machina_Buttons+-+Glass+Button", type: "mp3")
}


// blop sound by Mark DiAngelo
// ting sound by Popup Pixels
