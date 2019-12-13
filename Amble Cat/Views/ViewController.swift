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
     @IBOutlet weak var sleepArt: UIImageView!
     @IBOutlet weak var eatArt: UIImageView!
     @IBOutlet weak var drinkArt: UIImageView!
     @IBOutlet weak var playArt: UIImageView!
     @IBOutlet weak var loafArt: UIImageView!
     
     @IBOutlet weak var food: UIImageView!
     @IBOutlet weak var water: UIImageView!
     
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

     let userDefaultDate = "userDefaultDate"
     var earned = 0
   
     override func viewDidLoad() {
          super.viewDidLoad()
          // Do any additional setup after loading the view.
          dimView.isHidden = true
          collectView.isHidden = true
          
          collectionView.dataSource = self
          collectionView.delegate = self
          
          NotificationCenter.default.addObserver(self, selector: #selector(refreshPoints), name: NSNotification.Name(rawValue: "refreshPoints"), object: nil)
          
          NotificationCenter.default.addObserver(self, selector: #selector(decorChanged), name: NSNotification.Name(rawValue: "decorChanged"), object: nil)
          
          NotificationCenter.default.addObserver(self, selector: #selector(refreshView), name: NSNotification.Name(rawValue: "refreshView"), object: nil)
          
          NotificationCenter.default.addObserver(self, selector: #selector(addPurchasedCurrency), name: NSNotification.Name(rawValue: "addPurchasedCurrency"), object: nil)
          
          NotificationCenter.default.addObserver(self, selector: #selector(hideTutorial), name: NSNotification.Name(rawValue: "hideTutorial"), object: nil)
          
          NotificationCenter.default.addObserver(self, selector: #selector(redoTutorial), name: NSNotification.Name(rawValue: "redoTutorial"), object: nil)
          
          NotificationCenter.default.addObserver(self, selector: #selector(unitChanged), name: NSNotification.Name(rawValue: "unitChanged"), object: nil)
          
          
          currentsBackground.layer.cornerRadius = 20
          collectView.layer.cornerRadius = 20
          historyButton.layer.cornerRadius = 10
          
          // load sounds
          Sound.loadSound(number: &Sounds.blopSound.number, resourceName: Sounds.blopSound.resourceName, type: Sounds.blopSound.type)
          Sound.loadSound(number: &Sounds.tingSound.number, resourceName: Sounds.tingSound.resourceName, type: Sounds.tingSound.type)
          Sound.loadSound(number: &Sounds.registerSound.number, resourceName: Sounds.registerSound.resourceName, type: Sounds.registerSound.type)
          Sound.loadSound(number: &Sounds.meowSound.number, resourceName: Sounds.meowSound.resourceName, type: Sounds.meowSound.type)
          Sound.loadSound(number: &Sounds.chirpSound.number, resourceName: Sounds.chirpSound.resourceName, type: Sounds.chirpSound.type)
          Sound.loadSound(number: &Sounds.failSound.number, resourceName: Sounds.failSound.resourceName, type: Sounds.failSound.type)
          
          loadCareState()
          loadCurrency()
          loadEquipment()
          loadMeasure()
          
          if isAppAlreadyLaunchedOnce() {
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
        
          requestHealthInfo()
          
          beginAnimation()
          
    }
	
     // MARK: Custom functions
     
     func requestHealthInfo() {
          HealthStore.store.requestAuthorization(toShare: HealthStore.healthKitTypes, read: HealthStore.healthKitTypes) { [unowned self] (bool, error) in
               if (bool) {
                    self.getSteps { (result) in
                         DispatchQueue.main.async {
                              let stepCount = String(Int(result))
                              self.stepsLabel.text = "\(stepCount)"
                         }
                    }
                    
                    self.getDistance { (result) in
                         DispatchQueue.main.async {
                              let distance = String(Int(result))
                              self.distanceLabel.text = "\(distance)"
                              self.measurementLabel.text = "\(Measures.preferred.rawValue)"
                         }
                    }
                    
                    self.querySteps { (result) in
                         DispatchQueue.main.async {
                              let steps = Int(result)
                              self.stepsYesterday.text = "\(steps) Steps Yesterday"
                              
                              let date = Date()
                              let calendar = Calendar.current
                              let dateToCompare = calendar.component(.day , from: date)
                              let userDefaultDate = UserDefaults.standard.integer(forKey: "userDefaultDate")
                              
                              if self.isSameDay() == false && steps >= 1000 {
                                   self.dimView.isHidden = false
                                   self.collectView.isHidden = false
                                   let thousands = Int(steps / 1000)
                                   self.earned = 10 * thousands
                                   Currency.toAdd = 10 * thousands
                                   Sound.playSound(number: Sounds.meowSound.number)
                                   self.view.bringSubviewToFront(self.collectView)
                                   self.collectText.text = "You earned \(self.earned) Paw Points for walking \(steps) steps yesterday!"
                              }
                         }
                    }
                    
                    self.queryDistanceHistory()
               }
          }
     }
     
     @objc func addPurchasedCurrency() {
          addCurrency(with: Currency.toAdd)
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
          requestHealthInfo()
     }
     
     func isSameDay() -> Bool {
          let date = Date()
          let calendar = Calendar.current
          let dateToCompare = calendar.component(.day , from: date)
          
          let userDefaultDate = UserDefaults.standard.integer(forKey: "userDefaultDate")
         
          if userDefaultDate != dateToCompare {
               UserDefaults.standard.set(dateToCompare, forKey: self.userDefaultDate)
               return false
          } else {
               return true
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
          
          TimerManager.stopTimer()
          catArt.stopAnimating()
          sleepArt.stopAnimating()
          playArt.stopAnimating()
          loafArt.stopAnimating()
          eatArt.stopAnimating()
          drinkArt.stopAnimating()
          
          if animation == 1 {
               catArt.isHidden = false
               sleepArt.isHidden = true
               eatArt.isHidden = true
               drinkArt.isHidden = true
               playArt.isHidden = true
               loafArt.isHidden = true
               
               catArt.animationImages = AnimationManager.blinkAnimation
               catArt.animationDuration = 1.0
               catArt.animationRepeatCount = 1
               catArt.startAnimating()
               
               TimerManager.beginTimer(with: catArt)
          } else if animation == 2 {
               catArt.isHidden = true
               sleepArt.isHidden = false
               eatArt.isHidden = true
               drinkArt.isHidden = true
               playArt.isHidden = true
               loafArt.isHidden = true
               
               sleepArt.animationImages = AnimationManager.sleepAnimation
               sleepArt.animationDuration = 4.0
               sleepArt.startAnimating()
          } else if animation == 3 {
               catArt.isHidden = true
               sleepArt.isHidden = true
               eatArt.isHidden = true
               drinkArt.isHidden = true
               playArt.isHidden = false
               loafArt.isHidden = true
               
               playArt.animationImages = AnimationManager.playAnimation
               playArt.animationDuration = 2.0
               playArt.startAnimating()
               
               TimerManager.beginTimer(with: playArt)
          } else if animation == 4 {
               catArt.isHidden = true
               sleepArt.isHidden = true
               eatArt.isHidden = true
               drinkArt.isHidden = true
               playArt.isHidden = true
               loafArt.isHidden = false
               
               loafArt.animationImages = AnimationManager.loafAnimation
               loafArt.animationDuration = 1.5
               loafArt.animationRepeatCount = 1
               loafArt.startAnimating()
               
               TimerManager.beginTimer(with: loafArt)
          } else if animation == 5 {
               catArt.isHidden = true
               sleepArt.isHidden = true
               eatArt.isHidden = false
               drinkArt.isHidden = true
               playArt.isHidden = true
               loafArt.isHidden = true
               
               eatArt.animationImages = AnimationManager.eatAnimation
               eatArt.animationDuration = 1.0
               eatArt.startAnimating()
          } else if animation == 6 {
               catArt.isHidden = true
               sleepArt.isHidden = true
               eatArt.isHidden = true
               drinkArt.isHidden = false
               playArt.isHidden = true
               loafArt.isHidden = true
               
               drinkArt.animationImages = AnimationManager.drinkAnimation
               drinkArt.animationDuration = 1.0
               drinkArt.startAnimating()
          } else if animation == 7 {
               catArt.isHidden = false
               sleepArt.isHidden = true
               eatArt.isHidden = true
               drinkArt.isHidden = true
               playArt.isHidden = true
               loafArt.isHidden = true
               
               catArt.animationImages = AnimationManager.sitBlinkAnimation
               catArt.animationDuration = 1.0
               catArt.animationRepeatCount = 1
               catArt.startAnimating()
               
               TimerManager.beginTimer(with: catArt)
          }
     }
     
     func checkCareProgress() {
          print("care progress")
         
          if CareState.hasBeenFed && CareState.hasBeenWatered {
               CareState.daysCaredFor += 1
          }
          
          if CareState.daysCaredFor == 7 {
               dimView.isHidden = false
               earned = 50
               Currency.toAdd = earned
               Sound.playSound(number: Sounds.meowSound.number)
               view.bringSubviewToFront(collectView)
               collectText.text = "You earned \(earned) Paw Points for taking care of Lucy for 7 days in a row!"
          }
          
          saveCare()
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
          guard let bed = StoreInventory.inventoryDictionary[DecorManager.bedID], let bowl = StoreInventory.inventoryDictionary[DecorManager.bowlID], let decor = StoreInventory.inventoryDictionary[DecorManager.decorID], let floor = StoreInventory.inventoryDictionary[DecorManager.floorID], let picture = StoreInventory.inventoryDictionary[DecorManager.pictureID], let rug = StoreInventory.inventoryDictionary[DecorManager.rugID], let toy = StoreInventory.inventoryDictionary[DecorManager.toyID], let wall = StoreInventory.inventoryDictionary[DecorManager.wallID], let water = StoreInventory.inventoryDictionary[DecorManager.waterID], let window = StoreInventory.inventoryDictionary[DecorManager.windowID] else { return }
          
          bedArt.image = bed.image
          bowlArt.image = bowl.image
          decorArt.image = decor.image
          floorArt.image = floor.image
          pictureArt.image = picture.image
          rugArt.image = rug.image
          toyArt.image = toy.image
          wallArt.image = wall.image
          waterBowlArt.image = water.image
          windowArt.image = window.image
     }
     
     func loadMeasure() {
          var managedContext = CoreDataManager.shared.managedObjectContext
          var fetchRequest = NSFetchRequest<Measurement>(entityName: "Measurement")
          
          do {
               var result = try managedContext.fetch(fetchRequest)
               if let result = result.first {
                    Measures.loaded = result
                    if result.selection == "Miles" {
                         Measures.preferred = Distance.miles
                    } else if result.selection == "Meters" {
                         Measures.preferred = Distance.meters
                    }
               }
               print("measures loaded")
               
          } catch let error as NSError {
               showAlert(title: "Could not retrieve data", message: "\(error.userInfo)")
          }
     }
     
     func loadCurrency() {
         var managedContext = CoreDataManager.shared.managedObjectContext
         var fetchRequest = NSFetchRequest<Points>(entityName: "Points")
         
          do {
               var result = try managedContext.fetch(fetchRequest)
               if let total = result.first {
                    print(total.total)
                    Currency.loaded = total
                    Currency.userTotal = Int(total.total)
					pointsLabel.text = "\(Currency.userTotal) Paw Points"
               }
			   print("total loaded")
             
          } catch let error as NSError {
               showAlert(title: "Could not retrieve data", message: "\(error.userInfo)")
          }
     }
     
     func loadCareState() {
          var managedContext = CoreDataManager.shared.managedObjectContext
          var fetchRequest = NSFetchRequest<CareStatus>(entityName: "CareStatus")
          
          do {
               var resultArray = try managedContext.fetch(fetchRequest)
               if let result = resultArray.first {
                    let calendar = Calendar.current
                    
                    // check if last care day was yesterday
                    if let careDay = result.dateOfLastCare {
                         if calendar.isDateInYesterday(careDay) {
                              print("yesterday")
                              // if seven days of consistent care have passed, reset
                              if result.daysOfConsecutiveCare == 7 {
                                   CareState.daysCaredFor = 0
                                   CareState.care = result
                              } else {
                                   // otherwise don't reset
                                   CareState.daysCaredFor = result.daysOfConsecutiveCare
                                   CareState.care = result
                              }
                         } else if calendar.isDateInToday(careDay) {
                              print("today")
                              CareState.daysCaredFor = result.daysOfConsecutiveCare
                              CareState.hasBeenFed = result.hasBeenFed
                              CareState.hasBeenWatered = result.hasBeenWatered
                              CareState.care = result
                         } else {
                              print("not yesterday")
                              // last care was not yesterday nor today
                              CareState.care = result
                              CareState.daysCaredFor = 0
                         }
                    } else {
                         CareState.care = result
                         print("no date")
                    }
               }
              
               if CareState.hasBeenFed {
                    food.isHidden = false
               }
               
               if CareState.hasBeenWatered {
                    water.isHidden = false
               }
               
               for heart in hearts {
                    if heart.tag <= CareState.daysCaredFor {
                         heart.image = UIImage(named: "heart")
                         
                    } else {
                         heart.image = UIImage(named: "heartempty")
                    }
               }
               
               print("care loaded")
               
          } catch let error as NSError {
               showAlert(title: "Could not retrieve data", message: "\(error.userInfo)")
          }
     }
     
     func saveCare() {
          var managedContext = CoreDataManager.shared.managedObjectContext
          
          // save care anew if it doesn't exist (like on app initial launch)
          guard let currentCare = CareState.care else {
               let careSave = CareStatus(context: managedContext)
               
               careSave.hasBeenFed = CareState.hasBeenFed
               careSave.hasBeenWatered = CareState.hasBeenWatered
               careSave.daysOfConsecutiveCare = CareState.daysCaredFor
               
               CareState.care = careSave
               
               if CareState.hasBeenFed && CareState.hasBeenWatered {
                    careSave.dateOfLastCare = Date()
                    print("date save")
                    print(careSave.dateOfLastCare)
               }
               
               do {
                    try managedContext.save()
                    print("saved")
               } catch {
                    // this should never be displayed but is here to cover the possibility
                    showAlert(title: "Save failed", message: "Notice: Data has not successfully been saved.")
               }
               
               if CareState.hasBeenFed && CareState.hasBeenWatered {
                    updateHearts()
               }
               
               return
          }
          
          currentCare.hasBeenFed = CareState.hasBeenFed
          currentCare.hasBeenWatered = CareState.hasBeenWatered
          currentCare.daysOfConsecutiveCare = CareState.daysCaredFor
          
          CareState.care = currentCare
          
          if CareState.hasBeenFed && CareState.hasBeenWatered {
               currentCare.dateOfLastCare = Date()
          }
          
          do {
               try managedContext.save()
               print("resave successful")
          } catch {
               // this should never be displayed but is here to cover the possibility
               showAlert(title: "Save failed", message: "Notice: Data has not successfully been saved.")
          }
          
          if CareState.hasBeenFed && CareState.hasBeenWatered {
               updateHearts()
          }
     }
     
     func loadEquipment() {
          // load purchase status
          var managedContext = CoreDataManager.shared.managedObjectContext
          var fetchRequest = NSFetchRequest<Equipped>(entityName: "Equipped")
          
          do {
               var result = try managedContext.fetch(fetchRequest)
               if let loaded = result.first {
                    DecorManager.equipped = loaded
                    DecorManager.bedID = loaded.bed
                    DecorManager.bowlID = loaded.bowl
                    DecorManager.decorID = loaded.decor
                    DecorManager.floorID = loaded.floor
                    DecorManager.pictureID = loaded.picture
                    DecorManager.rugID = loaded.rug
                    DecorManager.toyID = loaded.toy
                    DecorManager.wallID = loaded.wall
                    DecorManager.waterID = loaded.waterbowl
                    DecorManager.windowID = loaded.window
                    
                    print("equipment loaded")
               }
          } catch let error as NSError {
                showAlert(title: "Could not retrieve data", message: "\(error.userInfo)")
          }
          
          guard DecorManager.equipped != nil else {
               // if nothing was loaded, there are no changes to make
               return
          }
          
          bedArt.image = StoreInventory.inventoryDictionary[DecorManager.bedID]?.image
          bowlArt.image = StoreInventory.inventoryDictionary[DecorManager.bowlID]?.image
          decorArt.image = StoreInventory.inventoryDictionary[DecorManager.decorID]?.image
          floorArt.image = StoreInventory.inventoryDictionary[DecorManager.floorID]?.image
          pictureArt.image = StoreInventory.inventoryDictionary[DecorManager.pictureID]?.image
          rugArt.image = StoreInventory.inventoryDictionary[DecorManager.rugID]?.image
          toyArt.image = StoreInventory.inventoryDictionary[DecorManager.toyID]?.image
          wallArt.image = StoreInventory.inventoryDictionary[DecorManager.wallID]?.image
          waterBowlArt.image = StoreInventory.inventoryDictionary[DecorManager.waterID]?.image
          windowArt.image = StoreInventory.inventoryDictionary[DecorManager.windowID]?.image
     }
     
     func addCurrency(with amount: Int) {
         var managedContext = CoreDataManager.shared.managedObjectContext
         
         // save currency anew if it doesn't exist (like on app initial launch)
          guard let currentCurrency = Currency.loaded else {
               let pointSave = Points(context: managedContext)
          
               pointSave.total = Int64(amount)
               Currency.userTotal = amount
           
               do {
                    try managedContext.save()
                    print("saved")
               } catch {
                    // this should never be displayed but is here to cover the possibility
                    showAlert(title: "Save failed", message: "Notice: Data has not successfully been saved.")
               }
          
               Currency.toAdd = 0
               return
          }
         
          // otherwise rewrite data
          let newTotal = Currency.userTotal + amount
          Currency.userTotal = newTotal
          currentCurrency.total = Int64(newTotal)
          Currency.toAdd = 0
          
          do {
               try managedContext.save()
               print("resave successful")
          } catch {
               // this should never be displayed but is here to cover the possibility
               showAlert(title: "Save failed", message: "Notice: Data has not successfully been saved.")
          }
     }
    
     func isAppAlreadyLaunchedOnce() -> Bool {
          let defaults = UserDefaults.standard

          if let isAppAlreadyLaunchedOnce = defaults.string(forKey: "isAppAlreadyLaunchedOnce") {
               print("App already launched : \(isAppAlreadyLaunchedOnce)")
               return true
          } else {
               defaults.set(true, forKey: "isAppAlreadyLaunchedOnce")
               print("App launched first time")
               return false
          }
     }
     
     // MARK: Healthkit
    
     func getSteps(completion: @escaping (Double) -> Void) {
        let type = HKQuantityType.quantityType(forIdentifier: .stepCount)!
            
        let now = Date()
        let startOfDay = Calendar.current.startOfDay(for: now)
        var interval = DateComponents()
        interval.day = 1
        
        let query = HKStatisticsCollectionQuery(quantityType: type, quantitySamplePredicate: nil, options: [.cumulativeSum], anchorDate: startOfDay, intervalComponents: interval)
        
        query.initialResultsHandler = { _, result, error in
                var resultCount = 0.0
                result!.enumerateStatistics(from: startOfDay, to: now) { statistics, _ in

                if let sum = statistics.sumQuantity() {
                    resultCount = sum.doubleValue(for: HKUnit.count())
                }
               
                DispatchQueue.main.async {
                    completion(resultCount)
                }
            }
        }
        
        query.statisticsUpdateHandler = {
            query, statistics, statisticsCollection, error in

            // If new statistics are available
            if let sum = statistics?.sumQuantity() {
                let resultCount = sum.doubleValue(for: HKUnit.count())
              
                DispatchQueue.main.async {
                    completion(resultCount)
                }
            }
        }
        
        HealthStore.store.execute(query)
     }

     func getDistance(completion: @escaping (Double) -> Void) {
        let type = HKQuantityType.quantityType(forIdentifier: .distanceWalkingRunning)!
            
        let now = Date()
        let startOfDay = Calendar.current.startOfDay(for: now)
        var interval = DateComponents()
        interval.day = 1
        
        let query = HKStatisticsCollectionQuery(quantityType: type, quantitySamplePredicate: nil, options: [.cumulativeSum], anchorDate: startOfDay, intervalComponents: interval)
        
        query.initialResultsHandler = { _, result, error in
                var resultCount = 0.0
                result!.enumerateStatistics(from: startOfDay, to: now) { statistics, _ in

                if let sum = statistics.sumQuantity() {
                    var measurement: HKUnit
                    switch Measures.preferred {
                    case .meters:
                         measurement = HKUnit.meter()
                    case .miles:
                         measurement = HKUnit.mile()
                    }
                    resultCount = sum.doubleValue(for: measurement)
                }

                DispatchQueue.main.async {
                    completion(resultCount)
                }
            }
        }
        
        query.statisticsUpdateHandler = {
            query, statistics, statisticsCollection, error in

            // If new statistics are available
            if let sum = statistics?.sumQuantity() {
                let resultCount = sum.doubleValue(for: HKUnit.meter())
                
                DispatchQueue.main.async {
                    completion(resultCount)
                }
            }
        }
        
        HealthStore.store.execute(query)
     }
    
    
     func querySteps(completion: @escaping (Double) -> Void) {
        let type = HKQuantityType.quantityType(forIdentifier: .stepCount)!
        let calendar = NSCalendar.current
        let interval = NSDateComponents()
        interval.day = 1

        var anchorComponents = calendar.dateComponents([.day, .month, .year], from: NSDate() as Date)
        anchorComponents.hour = 0
        let anchorDate = calendar.date(from: anchorComponents)

        // Define 1-day intervals starting from 0:00
        let stepsQuery = HKStatisticsCollectionQuery(quantityType: type, quantitySamplePredicate: nil, options: .cumulativeSum, anchorDate: anchorDate!, intervalComponents: interval as DateComponents)

        // Set the results handler
        stepsQuery.initialResultsHandler = {query, results, error in
            let today = Date()
            
            guard let endDate = calendar.date(byAdding: .day, value: -1, to: today, wrappingComponents: false), let startDate = calendar.date(byAdding: .day, value: -6, to: endDate, wrappingComponents: false) else { return }
            
            if let myResults = results {
                myResults.enumerateStatistics(from: startDate, to: endDate) { statistics, stop in
                   
                if let quantity = statistics.sumQuantity() {
                        let date = statistics.startDate
                        let steps = quantity.doubleValue(for: HKUnit.count())
                        print("\(date): steps = \(steps)")
                      
                        HealthDataManager.stepHistory.insert(steps, at: 0)
                        HealthDataManager.dates.insert(date, at: 0)
                } else {
                        let date = statistics.startDate
                        let steps = 0.0
                        print("\(date): steps = \(steps)")
                    
                        HealthDataManager.stepHistory.insert(steps, at: 0)
                        HealthDataManager.dates.insert(date, at: 0)
                    }
                }
                
                DispatchQueue.main.async {
                    completion(HealthDataManager.stepHistory[0])
                }
            }
        }
        HealthStore.store.execute(stepsQuery)
     }

     func queryDistanceHistory() {
        let type = HKQuantityType.quantityType(forIdentifier: .distanceWalkingRunning)!
        let calendar = NSCalendar.current
        let interval = NSDateComponents()
        interval.day = 1

        var anchorComponents = calendar.dateComponents([.day, .month, .year], from: NSDate() as Date)
        anchorComponents.hour = 0
        let anchorDate = calendar.date(from: anchorComponents)

        // Define 1-day intervals starting from 0:00
        let distanceQuery = HKStatisticsCollectionQuery(quantityType: type, quantitySamplePredicate: nil, options: .cumulativeSum, anchorDate: anchorDate!, intervalComponents: interval as DateComponents)

        // Set the results handler
        distanceQuery.initialResultsHandler = {query, results, error in
            let today = Date()
            
            guard let endDate = calendar.date(byAdding: .day, value: -1, to: today, wrappingComponents: false), let startDate = calendar.date(byAdding: .day, value: -6, to: endDate, wrappingComponents: false) else { return }
            
            if let myResults = results {
                myResults.enumerateStatistics(from: startDate, to: endDate) { statistics, stop in
                   
                    if let sum = statistics.sumQuantity() {
                         var measurement: HKUnit
                         switch Measures.preferred {
                         case .meters:
                              measurement = HKUnit.meter()
                         case .miles:
                              measurement = HKUnit.mile()
                         }
                         
                        let distance = sum.doubleValue(for: measurement)
                        HealthDataManager.distances.insert(distance, at: 0)
                    } else {
                        let distance = 0.0
                        HealthDataManager.distances.insert(distance, at: 0)
                    }
                }
            }
        }
        
        HealthStore.store.execute(distanceQuery)
     }

    
     // MARK: IBActions
     
     @IBAction func viewStatsPressed(_ sender: UIButton) {
          performSegue(withIdentifier: "viewStatistics", sender: Any?.self)
     }
     
     @IBAction func collectButtonTapped(_ sender: UIButton) {
          Sound.playSound(number: Sounds.tingSound.number)
          dimView.isHidden = true
          collectView.isHidden = true
          self.view.sendSubviewToBack(collectView)
          addCurrency(with: Currency.toAdd)
          pointsLabel.text = "\(Currency.userTotal) Paw Points"
          loadCurrency()
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
               if CareState.hasBeenFed {
                    return
               } else {
                    food.isHidden = false
                    CareState.hasBeenFed = true
                    
                    Sound.playSound(number: Sounds.blopSound.number)
                    checkCareProgress()
               }
          } else if path.row == 1 {
               if CareState.hasBeenWatered {
                    return
               } else {
                    water.isHidden = false
                    CareState.hasBeenWatered = true
                    
                    Sound.playSound(number: Sounds.blopSound.number)
                    checkCareProgress()
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
