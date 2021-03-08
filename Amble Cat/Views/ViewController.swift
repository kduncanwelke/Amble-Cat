//
//  ViewController.swift
//  Amble Cat
//
//  Created by Kate Duncan-Welke on 9/30/19.
//  Copyright © 2019 Kate Duncan-Welke. All rights reserved.
//

import UIKit
import HealthKit
import CoreData

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
     // MARK: IBOutlets

     @IBOutlet weak var stepsLabel: UILabel!
     @IBOutlet weak var distanceLabel: UILabel!
     @IBOutlet weak var measurementLabel: UILabel!
     
     @IBOutlet weak var currentsBackground: UIView!
     @IBOutlet weak var pointsLabel: UILabel!
     @IBOutlet weak var collectView: UIView!
     @IBOutlet weak var collectText: UILabel!
     
     @IBOutlet var hearts: [UIImageView]!
     
     @IBOutlet weak var catArt: UIImageView!

     @IBOutlet weak var bedArt: UIImageView!
     @IBOutlet weak var bowlArt: UIImageView!
     @IBOutlet weak var decorArt: UIImageView!
     @IBOutlet weak var toyArt: UIImageView!
     @IBOutlet weak var pictureArt: UIImageView!
     @IBOutlet weak var floorArt: UIImageView!
     @IBOutlet weak var rugArt: UIImageView!
     @IBOutlet weak var wallArt: UIImageView!
     @IBOutlet weak var waterBowlArt: UIImageView!
     @IBOutlet weak var windowArt: UIImageView!
     
     @IBOutlet weak var bath: UIImageView!
     @IBOutlet weak var bathEdge: UIImageView!
     
     @IBOutlet var buttons: [UIButton]!
     
     // MARK: Variables

     var earned = 0
     private let viewModel = ViewModel()
     private let stepViewModel = StepViewModel()
     var selectedIndex = 0
   
     override func viewDidLoad() {
          super.viewDidLoad()
          // Do any additional setup after loading the view.
          NotificationCenter.default.addObserver(self, selector: #selector(refreshPoints), name: NSNotification.Name(rawValue: "refreshPoints"), object: nil)
          
          NotificationCenter.default.addObserver(self, selector: #selector(decorChanged), name: NSNotification.Name(rawValue: "decorChanged"), object: nil)
          
          NotificationCenter.default.addObserver(self, selector: #selector(refreshView), name: NSNotification.Name(rawValue: "refreshView"), object: nil)
          
          NotificationCenter.default.addObserver(self, selector: #selector(addPurchasedCurrency), name: NSNotification.Name(rawValue: "addPurchasedCurrency"), object: nil)
          
          NotificationCenter.default.addObserver(self, selector: #selector(unitChanged), name: NSNotification.Name(rawValue: "unitChanged"), object: nil)
          
          NotificationCenter.default.addObserver(self, selector: #selector(animationEnded), name: NSNotification.Name(rawValue: "animationEnded"), object: nil)
          
          
          // load sounds
          Sound.loadSound(number: &Sounds.blopSound.number, resourceName: Sounds.blopSound.resourceName, type: Sounds.blopSound.type)
          Sound.loadSound(number: &Sounds.tingSound.number, resourceName: Sounds.tingSound.resourceName, type: Sounds.tingSound.type)
          Sound.loadSound(number: &Sounds.registerSound.number, resourceName: Sounds.registerSound.resourceName, type: Sounds.registerSound.type)
          Sound.loadSound(number: &Sounds.meowSound.number, resourceName: Sounds.meowSound.resourceName, type: Sounds.meowSound.type)
          Sound.loadSound(number: &Sounds.chirpSound.number, resourceName: Sounds.chirpSound.resourceName, type: Sounds.chirpSound.type)
          Sound.loadSound(number: &Sounds.failSound.number, resourceName: Sounds.failSound.resourceName, type: Sounds.failSound.type)
          
          viewModel.loadCurrency()
          viewModel.loadMeasure()
          viewModel.loadCareState()
          viewModel.loadEquipment()
          
          stepViewModel.getStepData()
          stepsLabel.text = "\(stepViewModel.updateSteps())"
          
          viewModel.monitorNetwork()
          loadUI()
          beginAnimation()
    }
	
     // MARK: Custom functions
     
     func loadUI() {
          pointsLabel.text = viewModel.setPointsLabel()
          stepsLabel.text = "\(stepViewModel.stepsToday())"
          distanceLabel.text = "\(stepViewModel.metersToday())"
          bowlArt.image = viewModel.showFood()
          updateHearts()
          loadWater()
     }
     
     func loadWater() {
          if let empty = viewModel.showWater() {
               waterBowlArt.image = empty
          } else {
               animateWater()
          }
     }
     
     func changeSelection() {
          for button in buttons {
               if button.tag == selectedIndex {
                    button.setBackgroundImage(UIImage(named: "select"), for: .normal)
               } else {
                    button.setBackgroundImage(UIImage(named: "none"), for: .normal)
               }
          }
     }
     
     @objc func animationEnded() {
          beginAnimation()
     }
     
     @objc func addPurchasedCurrency() {
          viewModel.addCurrency()
     }
     
     @objc func unitChanged() {
          // update unit
     }
     
     func updateCare() {
          updateHearts()
          
          if viewModel.checkCareProgress() {
               // give reward
               Sound.playSound(number: Sounds.meowSound.number)
          }
     }
     
     func updateHearts() {
          print("update hearts")
       
          var days = viewModel.getDaysCaredFor()
          
          for heart in hearts {
               if heart.tag <= days {
                    heart.image = UIImage(named: "heart")
                    
                    if heart.tag == days {
                         heart.animateHeart()
                    }
               } else {
                    heart.image = UIImage(named: "heartempty")
               }
          }
     }
     
     @objc func refreshPoints() {
          pointsLabel.text = "\(Currency.userTotal) Paw Points"
     }
     
     @objc func refreshView() {
          beginAnimation()
     }
     
     @objc func decorChanged() {
          bedArt.image = viewModel.getBedImage()
          bowlArt.image = viewModel.showFood()
          decorArt.image = viewModel.getDecorImage()
          floorArt.image = viewModel.getFloorImage()
          pictureArt.image = viewModel.getPictureImage()
          rugArt.image = viewModel.getRugImage()
          toyArt.image = viewModel.getToyImage()
          wallArt.image = viewModel.getWallImage()
          waterBowlArt.image = viewModel.showWater()
          windowArt.image = viewModel.getWindowImage()
     }
     
     func feed() {
          if viewModel.hasBeenFed() {
               return
          } else {
               viewModel.feedCat()
               Sound.playSound(number: Sounds.blopSound.number)
               updateCare()
               bowlArt.image = viewModel.showFood()
          }
     }

     func water() {
          if CareState.hasBeenWatered {
               return
          } else {
               viewModel.waterCat()
               Sound.playSound(number: Sounds.blopSound.number)
               updateCare()
               loadWater()
          }
     }
    
     // MARK: IBActions
     
     @IBAction func viewStatsPressed(_ sender: UIButton) {
          performSegue(withIdentifier: "viewStatistics", sender: Any?.self)
     }
     
     @IBAction func enterPressed(_ sender: UIButton) {
          Sound.playSound(number: Sounds.blopSound.number)
          
          var selectedButton = buttons[selectedIndex]
          
          switch selectedButton.tag {
          case 0:
               feed()
          case 1:
               water()
          case 2:
               performSegue(withIdentifier: "viewStatistics", sender: Any?.self)
          case 3:
               performSegue(withIdentifier: "goToStore", sender: Any?.self)
          case 4:
               performSegue(withIdentifier: "goToPointShop", sender: Any?.self)
          default:
               return
          }
     }
     
     @IBAction func leftPressed(_ sender: UIButton) {
          Sound.playSound(number: Sounds.blopSound.number)
          
          if selectedIndex != 0 {
               selectedIndex -= 1
          }
          
          changeSelection()
     }
     
     @IBAction func rightPressed(_ sender: UIButton) {
          Sound.playSound(number: Sounds.blopSound.number)
          
          if selectedIndex != buttons.count-1 {
               selectedIndex += 1
          }
          
          changeSelection()
     }
     
     
     @IBAction func collectButtonTapped(_ sender: UIButton) {
          Sound.playSound(number: Sounds.tingSound.number)
        
          // FIXME
          viewModel.addCurrency()
          pointsLabel.text = viewModel.setPointsLabel()
          viewModel.loadCurrency()
     }
     
     @IBAction func viewInfoTapped(_ sender: UIButton) {
          performSegue(withIdentifier: "viewAbout", sender: Any?.self)
     }
     
}
