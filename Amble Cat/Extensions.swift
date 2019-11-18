//
//  Extensions.swift
//  Amble Cat
//
//  Created by Kate Duncan-Welke on 11/1/19.
//  Copyright © 2019 Kate Duncan-Welke. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func animatePress(completion: @escaping () -> Void) {
        UIView.animate(withDuration: 0.3, animations: {
            self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }, completion: { [unowned self] _ in
            UIView.animate(withDuration: 0.3) {
                self.transform = CGAffineTransform.identity
            }
            
             completion()
        })
    }
    
    func animateHeart() {
        print("animate heart")
        UIView.animate(withDuration: 0.2, animations: {
            self.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        }, completion: { [unowned self] _ in
            UIView.animate(withDuration: 0.2) {
                self.transform = CGAffineTransform.identity
            }
        })
    }
}
