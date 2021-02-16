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
    @IBOutlet weak var dismissButton: UIButton!
    
    // MARK: Variables
    
    var tutorial = ["My name is Lucy. I will be your walking companion.", "This brief tutorial will familiarize you with AmbleCat.", "By walking, you will earn a currency called Paw Points.", "You can spend these points in the Decor Shop, and buy new items!", "The more you walk, the more points you earn to customize your room.", "You collect Paw Points by opening the app daily, so be sure to check back regularly.", "You can always visit the Paw Point Shop if you need some extra points!", "Step data comes from your device, so your steps are recorded automatically.", "Don't forget to take care of me too!", "I need food and water daily!", "You will see some empty hearts on your main screen.", "These indicate how many days in a row you have cared for me . . .", "If you fill all seven of them, something special might happen!", "If you fill the hearts, they will reset the next day, so you can fill them again.", "I will see you on the next screen - happy walking!"]
    
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      
        dismissButton.layer.cornerRadius = 10
        /*catImage.animationImages = AnimationManager.sitBlinkAnimation
        catImage.animationDuration = 1.0
        catImage.animationRepeatCount = 1
        catImage.startAnimating()
        TutorialTimer.beginTimer(with: catImage)*/
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
                Sound.playSound(number: Sounds.chirpSound.number)
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
            Sound.playSound(number: Sounds.blopSound.number)
            changeText()
        } else {
            return
        }
    }
    
    @IBAction func dismissPressed(_ sender: UIButton) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "hideTutorial"), object: nil)
    }
    
    
}
