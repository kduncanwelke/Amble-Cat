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
import CoreMotion

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, StepTotalDelegate {
    
     // MARK: IBOutlets

     @IBOutlet weak var stepsLabel: UILabel!
     @IBOutlet weak var distanceLabel: UILabel!
     @IBOutlet weak var measurementLabel: UILabel!
     
     @IBOutlet weak var currentsBackground: UIView!
     @IBOutlet weak var pointsLabel: UILabel!
     
     @IBOutlet var hearts: [UIImageView]!
     
     @IBOutlet weak var catArt: UIImageView!

     @IBOutlet weak var bedArt: UIImageView!
     @IBOutlet weak var bowlArt: UIImageView!
     @IBOutlet weak var decorArt: UIImageView!
     @IBOutlet weak var toyArt: UIImageView!
     @IBOutlet weak var pictureArt: UIImageView!
     @IBOutlet weak var floorArt: UIImageView!
     @IBOutlet weak var rugArt: UIImageView!
     @IBOutlet weak var couchArt: UIImageView!
     @IBOutlet weak var wallArt: UIImageView!
     @IBOutlet weak var waterBowlArt: UIImageView!
     @IBOutlet weak var windowArt: UIImageView!
     
     @IBOutlet weak var bathroomView: UIView!
     @IBOutlet weak var bathroomWall: UIImageView!
     @IBOutlet weak var wallTile: UIImageView!
     @IBOutlet weak var floorTile: UIImageView!
     @IBOutlet weak var cabinet: UIImageView!
     @IBOutlet weak var towels: UIImageView!
     @IBOutlet weak var bathmat: UIImageView!
     @IBOutlet weak var bathroomCat: UIImageView!
     @IBOutlet weak var bath: UIImageView!
     @IBOutlet weak var bathToy: UIImageView!
     @IBOutlet weak var bathWater: UIImageView!
     
     @IBOutlet weak var outsideView: UIView!
     @IBOutlet weak var outsideBackground: UIImageView!
     @IBOutlet weak var walkingOutside: UIImageView!
     
     @IBOutlet var buttons: [UIButton]!
     @IBOutlet weak var bonus: UIImageView!
     
     @IBOutlet weak var enterButton: UIButton!
     @IBOutlet weak var leftArrow: UIButton!
     @IBOutlet weak var rightArrow: UIButton!
     @IBOutlet weak var infoButton: UIButton!
     
     @IBOutlet weak var selectionLabel: UILabel!
     
     
     // MARK: Variables

     var earned = 0
     private let viewModel = ViewModel()
     private let stepViewModel = StepViewModel()
     var selectedIndex = 0
     var paused = false
   
     override func viewDidLoad() {
          super.viewDidLoad()
          // Do any additional setup after loading the view.
          NotificationCenter.default.addObserver(self, selector: #selector(refreshPoints), name: NSNotification.Name(rawValue: "refreshPoints"), object: nil)
          
          NotificationCenter.default.addObserver(self, selector: #selector(updateHearts), name: NSNotification.Name(rawValue: "updateHearts"), object: nil)
          
          NotificationCenter.default.addObserver(self, selector: #selector(decorChanged), name: NSNotification.Name(rawValue: "decorChanged"), object: nil)
          
          NotificationCenter.default.addObserver(self, selector: #selector(refreshView), name: NSNotification.Name(rawValue: "refreshView"), object: nil)
          
          NotificationCenter.default.addObserver(self, selector: #selector(addPurchasedCurrency), name: NSNotification.Name(rawValue: "addPurchasedCurrency"), object: nil)
          
          NotificationCenter.default.addObserver(self, selector: #selector(unitChanged), name: NSNotification.Name(rawValue: "unitChanged"), object: nil)
          
          NotificationCenter.default.addObserver(self, selector: #selector(animationEnded), name: NSNotification.Name(rawValue: "animationEnded"), object: nil)
          
          NotificationCenter.default.addObserver(self, selector: #selector(jumpUp), name: NSNotification.Name(rawValue: "jumpUp"), object: nil)
          
          NotificationCenter.default.addObserver(self, selector: #selector(jumpToBath), name: NSNotification.Name(rawValue: "jumpToBath"), object: nil)
          
          NotificationCenter.default.addObserver(self, selector: #selector(jumpToCounter), name: NSNotification.Name(rawValue: "jumpToCounter"), object: nil)
          
          // load sounds
          Sound.loadSound(number: &Sounds.blopSound.number, resourceName: Sounds.blopSound.resourceName, type: Sounds.blopSound.type)
          Sound.loadSound(number: &Sounds.tingSound.number, resourceName: Sounds.tingSound.resourceName, type: Sounds.tingSound.type)
          Sound.loadSound(number: &Sounds.registerSound.number, resourceName: Sounds.registerSound.resourceName, type: Sounds.registerSound.type)
          Sound.loadSound(number: &Sounds.meowSound.number, resourceName: Sounds.meowSound.resourceName, type: Sounds.meowSound.type)
          Sound.loadSound(number: &Sounds.chirpSound.number, resourceName: Sounds.chirpSound.resourceName, type: Sounds.chirpSound.type)
          Sound.loadSound(number: &Sounds.failSound.number, resourceName: Sounds.failSound.resourceName, type: Sounds.failSound.type)
          
          stepViewModel.stepTotalDelegate = self
          stepViewModel.getStepsToday()
          
          stepViewModel.trackMovementType()
          stepViewModel.getStepData()
          
          enterButton.layer.cornerRadius = 21
          rightArrow.layer.cornerRadius = 21
          leftArrow.layer.cornerRadius = 21
          infoButton.layer.cornerRadius = 10
          
          viewModel.loadEquipment()
          viewModel.loadCurrency()
          viewModel.loadMeasure()
          viewModel.loadCareState()
          
          loadUI()
          
          stepViewModel.addCoinsForMissedSteps()
          stepViewModel.updateSteps()
          
          toggleBathroom()
          beginAnimation(inMotion: stepViewModel.isMoving())
     }
     
     // MARK: Custom functions
     
     func loadUI() {
          print("load ui")
          pointsLabel.text = "\(viewModel.setPointsLabel()) Paw Points"
          bowlArt.image = viewModel.showFood()
          updateHearts()
          loadWater()
          stepsLabel.text = "\(stepViewModel.stepsToday())"
          measurementLabel.text = stepViewModel.distanceMeasure()
          distanceLabel.text = "\(stepViewModel.distanceToday())"
          decorChanged()
     }
     
     func disappearOutside() {
          outsideView.isHidden = true
     }
     
     func disappearBathroom() {
          bathroomView.isHidden = true
     }
     
     func toggleBathroom() {
          bathroomView.isHidden = false
     }
     
     func toggleOutside() {
          outsideView.isHidden = false
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
                    selectionLabel.text = viewModel.getLabelName(tag: button.tag)
               } else {
                    button.setBackgroundImage(UIImage(named: "none"), for: .normal)
               }
          }
     }
     
     // delegate
     func updateSteps(stepTotal: Int) {
          stepsLabel.text = "\(stepTotal)"
     }
     
     @objc func animationEnded() {
          beginAnimation(inMotion: stepViewModel.isMoving())
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
               // show collectable coin
               bonus.isHidden = false
          }
     }
     
     @objc func updateHearts() {
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
          DispatchQueue.main.async {
               self.pointsLabel.text = "\(Currency.userTotal) Paw Points"
          }
     }
     
     @objc func refreshView() {
          paused = false
          beginAnimation(inMotion: stepViewModel.isMoving())
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
     
     func randomPlaceAnimation() {
          var specific = Bool.random()
          
          switch AnimationManager.location {
          case .middle, .right, .left:
               randomStaying()
          case .bed:
               if specific {
                    sleep()
               } else {
                    randomStaying()
               }
          case .couch:
               if specific {
                    jumpDown()
               } else {
                    randomStaying()
               }
          case .food:
               if specific && viewModel.hasBeenFed() {
                    eat()
               } else {
                    randomStaying()
               }
          case .water:
               if specific && viewModel.hasBeenWatered() {
                    drink()
               } else {
                    randomStaying()
               }
          case .toy:
               if specific {
                    play()
               } else {
                    randomStaying()
               }
          }
     }
    
     // MARK: IBActions
     
     @IBAction func enterPressed(_ sender: UIButton) {
          enterButton.animateButton()
          
          Sound.playSound(number: Sounds.blopSound.number)
          
          var selectedButton = buttons[selectedIndex]
          
          switch selectedButton.tag {
          case 0:
               paused = true
               performSegue(withIdentifier: "playGame", sender: Any?.self)
          case 1:
               paused = true
               performSegue(withIdentifier: "viewStatistics", sender: Any?.self)
          case 2:
               feed()
          case 3:
               water()
          case 4:
               paused = true
               performSegue(withIdentifier: "goToStore", sender: Any?.self)
          case 5:
               paused = true
               performSegue(withIdentifier: "goToPointShop", sender: Any?.self)
          default:
               return
          }
     }
     
     @IBAction func leftPressed(_ sender: UIButton) {
          leftArrow.animateButton()
          
          Sound.playSound(number: Sounds.blopSound.number)
          
          if selectedIndex != 0 {
               selectedIndex -= 1
          }
          
          changeSelection()
     }
     
     @IBAction func rightPressed(_ sender: UIButton) {
          rightArrow.animateButton()
          
          Sound.playSound(number: Sounds.blopSound.number)
          
          if selectedIndex != buttons.count-1 {
               selectedIndex += 1
          }
     
          changeSelection()
     }
     
     @IBAction func bonusTapped(_ sender: UITapGestureRecognizer) {
          viewModel.addCurrency()
          Sound.playSound(number: Sounds.meowSound.number)
          bonus.isHidden = true
     }
     
     @IBAction func viewInfoTapped(_ sender: UIButton) {
          performSegue(withIdentifier: "viewAbout", sender: Any?.self)
     }
     
}
