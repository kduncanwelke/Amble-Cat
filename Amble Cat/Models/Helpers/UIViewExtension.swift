//
//  UIViewExtension.swift
//  Amble Cat
//
//  Created by Kate Duncan-Welke on 2/16/21.
//  Copyright © 2021 Kate Duncan-Welke. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func move(to destination: CGPoint, duration: TimeInterval,
              options: UIView.AnimationOptions) {
        UIView.animate(withDuration: duration, delay: 0, options: options, animations: {
            self.center = destination
        }, completion: {(finished: Bool) in
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "animationEnded"), object: nil)
        })
    }
    
    func moveWithJump(to destination: CGPoint, duration: TimeInterval,
              options: UIView.AnimationOptions) {
        UIView.animate(withDuration: duration, delay: 0, options: options, animations: {
            self.center = destination
        }, completion: {(finished: Bool) in
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "jumpUp"), object: nil)
        })
    }
    
    func moveWithCounterJump(to destination: CGPoint, duration: TimeInterval,
                      options: UIView.AnimationOptions) {
        UIView.animate(withDuration: duration, delay: 0, options: options, animations: {
            self.center = destination
        }, completion: {(finished: Bool) in
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "jumpToCounter"), object: nil)
        })
    }
    
    func moveWithBathJump(to destination: CGPoint, duration: TimeInterval,
                             options: UIView.AnimationOptions) {
        UIView.animate(withDuration: duration, delay: 0, options: options, animations: {
            self.center = destination
        }, completion: {(finished: Bool) in
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "jumpToBath"), object: nil)
        })
    }
    
    func animateButton() {
        UIView.animate(withDuration: 0.1, animations: {
            self.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }, completion: { [unowned self] _ in
            UIView.animate(withDuration: 0.1) {
                self.transform = CGAffineTransform.identity
            }
        })
    }
}
