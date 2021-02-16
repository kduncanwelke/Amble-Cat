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
     
     @IBOutlet weak var stepsYesterday: UILabel!
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
     @IBOutlet weak var dimView: UIView!
     @IBOutlet weak var historyButton: UIButton!
     
     @IBOutlet weak var containerView: UIView!
     @IBOutlet weak var collectionView: UICollectionView!
     
     
     // MARK: Variables

     var earned = 0
     private let viewModel = ViewModel()
     private let stepViewModel = StepViewModel()
   
     override func viewDidLoad() {
          super.viewDidLoad()
          // Do any additional setup after loading the view.
          dimView.isHidden = true
          
          collectionView.dataSource = self
          collectionView.delegate = self
          
          NotificationCenter.default.addObserver(self, selector: #selector(refreshPoints), name: NSNotification.Name(rawValue: "refreshPoints"), object: nil)
          
          NotificationCenter.default.addObserver(self, selector: #selector(decorChanged), name: NSNotification.Name(rawValue: "decorChanged"), object: nil)
          
          NotificationCenter.default.addObserver(self, selector: #selector(refreshView), name: NSNotification.Name(rawValue: "refreshView"), object: nil)
          
          NotificationCenter.default.addObserver(self, selector: #selector(addPurchasedCurrency), name: NSNotification.Name(rawValue: "addPurchasedCurrency"), object: nil)
          
          NotificationCenter.default.addObserver(self, selector: #selector(hideTutorial), name: NSNotification.Name(rawValue: "hideTutorial"), object: nil)
          
          NotificationCenter.default.addObserver(self, selector: #selector(redoTutorial), name: NSNotification.Name(rawValue: "redoTutorial"), object: nil)
          
          NotificationCenter.default.addObserver(self, selector: #selector(unitChanged), name: NSNotification.Name(rawValue: "unitChanged"), object: nil)
          
          NotificationCenter.default.addObserver(self, selector: #selector(animationEnded), name: NSNotification.Name(rawValue: "animationEnded"), object: nil)
          
          
          currentsBackground.layer.cornerRadius = 20
          historyButton.layer.cornerRadius = 10
          
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
          
          if viewModel.isAppAlreadyLaunchedOnce() {
               containerView.isHidden = true
          } else {
               containerView.isHidden = false
               dimView.isHidden = false
          }
          
          NetworkMonitor.monitor.pathUpdateHandler = { path in
               if path.status == .satisfied {
                    print("connection successful")
                    NetworkMonitor.connection = true
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "networkRestored"), object: nil)
               } else {
                    print("no connection")
                    NetworkMonitor.connection = false
               }
          }
          
          let queue = DispatchQueue(label: "Monitor")
          NetworkMonitor.monitor.start(queue: queue)
        
          moveToMiddle()
          //beginAnimation()
    }
	
     // MARK: Custom functions
     
     func loadUI() {
          pointsLabel.text = viewModel.setPointsLabel()
          
          bowlArt.isHidden = viewModel.showFood()
          waterBowlArt.isHidden = viewModel.showWater()
          
          stepsLabel.text = "\(stepViewModel.stepsToday())"
          distanceLabel.text = "\(stepViewModel.metersToday())"
     }
     
     @objc func animationEnded() {
          catArt.stopAnimating()
     }
     
     @objc func addPurchasedCurrency() {
          viewModel.addCurrency()
     }
     
     @objc func hideTutorial() {
          containerView.isHidden = true
          dimView.isHidden = true
     }
     
     @objc func redoTutorial() {
          containerView.isHidden = false
          dimView.isHidden = false
     }
     
     @objc func unitChanged() {
          // update unit
     }
     
     func updateCare() {
          if viewModel.checkCareProgress() {
               dimView.isHidden = false
               Sound.playSound(number: Sounds.meowSound.number)
          }
     }
     
     func beginAnimation() {
          var range = [1,2,3,7]
          
          if CareState.hasBeenFed && CareState.hasBeenWatered && CareState.daysCaredFor >= 5 {
               range = [1,2,3,4,5,6,7]
          } else if CareState.hasBeenFed && CareState.hasBeenWatered && CareState.daysCaredFor >= 3 {
               range = [1,2,3,5,6,7]
          } else if CareState.hasBeenFed && CareState.hasBeenWatered {
               range = [1,2,3,5,6]
          } else if CareState.hasBeenFed && CareState.daysCaredFor > 3 {
               range = [1,2,3,4,5]
          } else if CareState.hasBeenWatered && CareState.daysCaredFor > 3 {
               range = [1,2,3,4,6]
          } else if CareState.hasBeenFed {
               range = [1,2,3,5]
          } else if CareState.hasBeenWatered {
               range = [1,2,3,6]
          }
          
          let animation = range.randomElement()
     }
     
     func updateHearts() {
          print("update hearts")
       
          for heart in hearts {
               if heart.tag <= CareState.daysCaredFor {
                    heart.image = UIImage(named: "heart")
                    
                    if heart.tag == CareState.daysCaredFor {
                         heart.animateHeart()
                         Sound.playSound(number: Sounds.tingSound.number)
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
          bowlArt.image = viewModel.getBowlImage()
          decorArt.image = viewModel.getDecorImage()
          floorArt.image = viewModel.getFloorImage()
          pictureArt.image = viewModel.getPictureImage()
          rugArt.image = viewModel.getRugImage()
          toyArt.image = viewModel.getToyImage()
          wallArt.image = viewModel.getWallImage()
          waterBowlArt.image = viewModel.getWaterImage()
          windowArt.image = viewModel.getWindowImage()
     }

    
     // MARK: IBActions
     
     @IBAction func viewStatsPressed(_ sender: UIButton) {
          performSegue(withIdentifier: "viewStatistics", sender: Any?.self)
     }
     
     @IBAction func collectButtonTapped(_ sender: UIButton) {
          Sound.playSound(number: Sounds.tingSound.number)
          dimView.isHidden = true
          
        
          viewModel.addCurrency()
          pointsLabel.text = viewModel.setPointsLabel()
          viewModel.loadCurrency()
     }
     
     @IBAction func viewInfoTapped(_ sender: UIButton) {
          performSegue(withIdentifier: "viewAbout", sender: Any?.self)
     }
     
}

// MARK: Collection View

extension ViewController: UICollectionViewDataSource, ButtonTapDelegate {
     func didTap(sender: ButtonCollectionViewCell) {
          guard let path = self.collectionView.indexPath(for: sender) else { return }
          
          Sound.playSound(number: Sounds.blopSound.number)
          
          if path.row == 0 {
               if viewModel.hasBeenFed() {
                    return
               } else {
                    bowlArt.isHidden = viewModel.showFood()
                    viewModel.feedCat()
                    
                    Sound.playSound(number: Sounds.blopSound.number)
                    updateCare()
               }
          } else if path.row == 1 {
               if CareState.hasBeenWatered {
                    return
               } else {
                    waterBowlArt.isHidden = viewModel.showWater()
                    viewModel.waterCat()
                    
                    Sound.playSound(number: Sounds.blopSound.number)
                    updateCare()
               }
          } else if path.row == 2 {
               performSegue(withIdentifier: "goToStore", sender: Any?.self)
          } else if path.row == 3 {
               performSegue(withIdentifier: "goToPointShop", sender: Any?.self)
          }
     }
     
     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          return Buttons.ButtonList.count
     }
     
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          
          if floor(collectionView.frame.size.height / 120.0) > 1 {
               let height = (collectionView.frame.size.height)/2.5
               return CGSize(width: height, height: height)
          } else {
               print("one row")
               let width = (self.view.frame.size.width-20)/4
               print(width)
               return CGSize(width: width, height: (collectionView.frame.size.height))
          }
     }

     
     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "buttonCell", for: indexPath) as! ButtonCollectionViewCell
          
          var item: ButtonInfo
          item = Buttons.ButtonList[indexPath.row]
     
          cell.cellButton.setBackgroundImage(item.image, for: .normal)
          cell.cellText.text = item.text
          
          cell.buttonTapDelegate = self
          
          return cell
     }
     
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
          
          if floor(collectionView.frame.size.height / 130.0) > 1 {
               print("two rows")
               let cellWidth: CGFloat = (self.view.frame.size.width)/3
               let edgeInsets = (self.view.frame.size.width - (2 * cellWidth)) / 2.5
               
               return UIEdgeInsets(top: 10, left: edgeInsets, bottom: 0, right: edgeInsets)
          } else {
               print("one row")
               let cellWidth: CGFloat = (self.view.frame.size.width)/4
               print(cellWidth)
               let numberOfCells = floor(self.view.frame.size.width / cellWidth)
               let edgeInsets = (self.view.frame.size.width - (numberOfCells * cellWidth)) / (numberOfCells + 1)
              
               return UIEdgeInsets(top: 0, left: edgeInsets, bottom: 0, right: edgeInsets)
          }
     }
     
     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
          
          if floor(collectionView.frame.size.height / 130.0) > 1 {
               let height = (collectionView.frame.size.height)/2.5
               let space = collectionView.frame.size.height - (height * 2)
               return space / 2
          } else {
               return 1
          }
     }
}
