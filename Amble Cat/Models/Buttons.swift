//
//  File.swift
//  Amble Cat
//
//  Created by Kate Duncan-Welke on 12/10/19.
//  Copyright © 2019 Kate Duncan-Welke. All rights reserved.
//

import Foundation
import UIKit

struct ButtonInfo {
    let image: UIImage
    let text: String
}

struct Buttons {
    static let ButtonList: [ButtonInfo] = [
        ButtonInfo(image: #imageLiteral(resourceName: "feed.png"), text: "Give Food"),
        ButtonInfo(image: #imageLiteral(resourceName: "givewater.png"), text: "Give Water"),
        ButtonInfo(image: #imageLiteral(resourceName: "decorshop.png"), text: "Decor Shop"),
        ButtonInfo(image: #imageLiteral(resourceName: "pointshop.png"), text: "Point Shop")
    ]
}
