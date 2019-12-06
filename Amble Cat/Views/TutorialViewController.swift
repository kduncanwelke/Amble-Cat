//
//  TutorialViewController.swift
//  Amble Cat
//
//  Created by Kate Duncan-Welke on 12/5/19.
//  Copyright © 2019 Kate Duncan-Welke. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController {

    // MARK: IBOutlets
    
    @IBOutlet weak var tutorialText: UILabel!
    @IBOutlet weak var catImage: UIImageView!
    @IBOutlet weak var nextButton: UIButton!
    
    // MARK: Variables
    
    var tutorial = ["My name is Lucy. I will be your walking companion.", "This brief tutorial will familiarize you with AmbleCat.", "By walking, you will earn a currency called Paw Points.", "You can spend these points in the Decor Shop, and use them to buy items in new colors and styles!", "The more you walk, the more points you will earn, and the more you can customize your room.", "You can collect your Paw Points by opening the app daily, so be sure to check back regularly.", "Step data comes directly from your device, so your steps are tracked whether the app is open or closed.", "Don't forget to take care of me too!", "I need food and water daily!", "You will see some empty hearts on your main screen.", "These indicate how many consecutive days you have cared for me . . .", "If you fill all seven of them, something special might happen!", "If you're impatient to get an item from the Decor Shop, you can always visit the Paw Point Shop to buy some more currency!", "I will see you on the next screen - happy walking!"]
    
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.        
        catImage.animationImages = AnimationManager.sitBlinkAnimation
        catImage.animationDuration = 1.0
        catImage.animationRepeatCount = 1
    }
    
    // MARK: Custom functions
    
    func changeText() {
        var textToDisplay = tutorial[index]
        var characterList: [Character] = []
        
        tutorialText.text = ""
        characterList.removeAll()
        
        for character in textToDisplay {
            characterList.append(character)
        }
        
        TextTimer.beginTimer(with: tutorialText, text: characterList)
        
        if index < tutorial.count {
            index += 1
            print(index)
            if index == tutorial.count {
                nextButton.isHidden = true
            }
        } else {
            return
        }
        
        var random = Bool.random()
        if random {
            catImage.startAnimating()
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: IBActions
    
    @IBAction func nextPressed(_ sender: UIButton) {
        if TextTimer.isRunning {
            return
        } else if index < tutorial.count {
            changeText()
        } else {
            return
        }
    }
    
    @IBAction func dismissPressed(_ sender: UIButton) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "hideTutorial"), object: nil)
    }
    
    
}
