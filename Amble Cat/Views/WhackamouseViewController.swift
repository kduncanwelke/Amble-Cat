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
    @IBOutlet weak var gameOver: UIView!
    @IBOutlet weak var bapSummary: UILabel!
    @IBOutlet weak var winningsSummary: UILabel!
    @IBOutlet weak var beginLabel: UILabel!
    @IBOutlet weak var beginButton: UIButton!
    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var insufficientFunds: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    
    // MARK: Variables
    
    private let gameViewModel = GameViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        back.layer.cornerRadius = 10
        beginButton.layer.cornerRadius = 10
        
        NotificationCenter.default.addObserver(self, selector: #selector(showMouse), name: NSNotification.Name(rawValue: "showMouse"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(start), name: NSNotification.Name(rawValue: "start"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(newRound), name: NSNotification.Name(rawValue: "newRound"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(gameEnd), name: NSNotification.Name(rawValue: "gameEnd"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateTotal), name: NSNotification.Name(rawValue: "updateTotal"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(reset), name: NSNotification.Name(rawValue: "reset"), object: nil)
        
        gameOver.isHidden = true
        hideMouse()
        updateTotal()
    }
    
    // MARK: Custom functions
    
    @objc func updateTotal() {
        pawPointLabel.text = "\(gameViewModel.setPointsLabel())"
    }
    
    func hideMouse() {
        for mouse in mice {
            mouse.isHidden = true
            mouse.image = UIImage(named: "whackablemouse")
        }
    }
    
    @objc func reset() {
        hideMouse()
    }
    
    @objc func start() {
        print("start notif")
        hideMouse()
        gameViewModel.beginGame()
    }
    
    @objc func showMouse() {
        var mouseToShow = gameViewModel.setMouse()
        print("mouse to show \(mouseToShow)")
        print("show mouse")
        for mouse in mice {
            if mouse.tag == mouseToShow {
                mouse.isHidden = false
            } else {
                mouse.isHidden = true
            }
        }
    }
    
    @objc func newRound() {
        print("new round notif")
        gameViewModel.newRound()
    }
    
    @objc func gameEnd() {
        winningsSummary.text = "You won \(gameViewModel.winningsSummary()) points!"
        bapSummary.text = "Successful baps: \(gameViewModel.bapsSummary())"
        gameOver.isHidden = false
        
        if gameViewModel.enoughToPlay() {
            playAgainButton.isHidden = false
        } else {
            playAgainButton.isHidden = true
        }
        
        gameViewModel.resetData()
    }
    
    func canPlay() -> Bool {
        if gameViewModel.enoughToPlay() {
            return true
        } else {
            Sound.playSound(number: Sounds.failSound.number)
            insufficientFunds.isHidden = false
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [weak self] in
                self?.insufficientFunds.isHidden = true
            }
            
            return false
        }
    }
    
    func checkForSuccess(sender: UITapGestureRecognizer) {
        if let image = sender.view as? UIImageView {
            if gameViewModel.checkIfCorrect(image: image.tag) {
                image.image = UIImage(named: "hitmouse")
                Sound.playSound(number: Sounds.tingSound.number)
                updateTotal()
                
                // if bonked successfully, play sound and change mouse image as if it were smacked down
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [unowned self] in
                    self.hideMouse()
                    self.gameViewModel.beginGame()
                }
            }
        }
    }
    
    func startNewGame() {
        beginLabel.isHidden = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [unowned self] in
            self.beginLabel.isHidden = true
        }
        
        beginButton.setTitle("...", for: .normal)
        gameViewModel.beginGame()
        
        // take money
        gameViewModel.payToBegin()
        Sound.playSound(number: Sounds.registerSound.number)
        updateTotal()
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
        if !canPlay() {
            return
        }
        
        startNewGame()
        beginButton.isEnabled = false
    }
    
    @IBAction func playAgain(_ sender: UIButton) {
        gameOver.isHidden = true
        startNewGame()
    }
    
    @IBAction func quit(_ sender: UIButton) {
        gameOver.isHidden = true
        beginButton.isEnabled = true
        beginButton.setTitle("5 points to play", for: .normal)
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
        // prevent leaving if game is in progress 
        if gameViewModel.inProgress() {
            return
        }
        
        self.dismiss(animated: true, completion: nil)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "refreshView"), object: nil)
    }

}
