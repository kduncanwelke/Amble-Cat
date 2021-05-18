//
//  WhackamouseViewController.swift
//  Amble Cat
//
//  Created by Kate Duncan-Welke on 5/17/21.
//  Copyright © 2021 Kate Duncan-Welke. All rights reserved.
//

import UIKit

class WhackamouseViewController: UIViewController {

    // MARK: IBOutlets
    
    @IBOutlet weak var pawPointLabel: UILabel!
    @IBOutlet var mice: [UIImageView]!
    @IBOutlet weak var beginButton: UIButton!
    @IBOutlet weak var back: UIButton!
    
    // MARK: Variables
    
    private let gameViewModel = GameViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        back.layer.cornerRadius = 10
        beginButton.layer.cornerRadius = 10
        
        NotificationCenter.default.addObserver(self, selector: #selector(hideMouse), name: NSNotification.Name(rawValue: "hideMouse"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateTotal), name: NSNotification.Name(rawValue: "updateTotal"), object: nil)
        
        hideMouse()
        updateTotal()
    }
    
    // MARK: Custom functions
    
    @objc func updateTotal() {
        pawPointLabel.text = "\(gameViewModel.setPointsLabel()) Paw Points"
    }
    
    @objc func hideMouse() {
        for mouse in mice {
            mouse.isHidden = true
        }
    }
    
    func newGame() {
        gameViewModel.randomizePosition()
        showMouse()
        gameViewModel.randomizeTime()
    }
    
    func showMouse() {
        var mouseToShow = gameViewModel.setMouse()
        
        for mouse in mice {
            if mouse.tag == mouseToShow {
                mouse.isHidden = false
            } else {
                mouse.isHidden = true
            }
        }
    }
    
    func checkForSuccess(sender: UITapGestureRecognizer) {
        if let image = sender.view {
            if gameViewModel.checkIfCorrect(image: image.tag) {
                Sound.playSound(number: Sounds.tingSound.number)
                print("success")
            }
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
    
    @IBAction func beginPressed(_ sender: UIButton) {
        newGame()
        // take money
    }
    
    @IBAction func tappedMouse1(_ sender: UITapGestureRecognizer) {
        checkForSuccess(sender: sender)
    }
    
    @IBAction func tappedMouse2(_ sender: UITapGestureRecognizer) {
        checkForSuccess(sender: sender)
    }
    
    @IBAction func tappedMouse3(_ sender: UITapGestureRecognizer) {
        checkForSuccess(sender: sender)
    }
    
    @IBAction func tappedMouse4(_ sender: UITapGestureRecognizer) {
        checkForSuccess(sender: sender)
    }
    
    @IBAction func tappedMouse5(_ sender: UITapGestureRecognizer) {
        checkForSuccess(sender: sender)
    }
    
    @IBAction func tappedMouse6(_ sender: UITapGestureRecognizer) {
        checkForSuccess(sender: sender)
    }
    
    @IBAction func tappedMouse7(_ sender: UITapGestureRecognizer) {
        checkForSuccess(sender: sender)
    }
    
    @IBAction func tappedMouse8(_ sender: UITapGestureRecognizer) {
        checkForSuccess(sender: sender)
    }
    
    @IBAction func backTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}
