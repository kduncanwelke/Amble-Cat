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

class ViewController: UIViewController {
    
     // MARK: IBOutlets

     @IBOutlet weak var stepsLabel: UILabel!
     @IBOutlet weak var distanceLabel: UILabel!
     @IBOutlet weak var stepsYesterday: UILabel!
     @IBOutlet weak var currentsBackground: UIView!
     @IBOutlet weak var pointsLabel: UILabel!
     @IBOutlet weak var collectView: UIView!
     @IBOutlet weak var collectText: UILabel!
     
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
     
     
     // MARK: Variables

     let userDefaultDate = "userDefaultDate"
     var earned = 200
   
     override func viewDidLoad() {
          super.viewDidLoad()
          // Do any additional setup after loading the view.
          dimView.isHidden = true
          
          NotificationCenter.default.addObserver(self, selector: #selector(refreshPoints), name: NSNotification.Name(rawValue: "refreshPoints"), object: nil)
          
          NotificationCenter.default.addObserver(self, selector: #selector(decorChanged), name: NSNotification.Name(rawValue: "decorChanged"), object: nil)
          
          NotificationCenter.default.addObserver(self, selector: #selector(refreshView), name: NSNotification.Name(rawValue: "refreshView"), object: nil)
          
          
          currentsBackground.layer.cornerRadius = 20
          collectView.layer.cornerRadius = 20
          
          loadCareState()
          loadCurrency()
          loadEquipment()
          
          if CareState.hasBeenFed {
               food.isHidden = false
          }
          
          if CareState.hasBeenWatered {
               water.isHidden = false
          }
        
          let healthKitTypes: Set = [ HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!, HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceWalkingRunning)! ]
   
          HealthStore.store.requestAuthorization(toShare: healthKitTypes, read: healthKitTypes) { [unowned self] (bool, error) in
            if (bool) {
                self.getSteps { (result) in
                    DispatchQueue.main.async {
                        let stepCount = String(Int(result))
                        self.stepsLabel.text = "\(stepCount) steps"
                    }
                }
                
                self.getDistance { (result) in
                    DispatchQueue.main.async {
                        let distance = String(Int(result))
                        self.distanceLabel.text = "\(distance) meters"
                    }
                }
                
                self.querySteps { (result) in
                    DispatchQueue.main.async {
                        let steps = Int(result)
                        self.stepsYesterday.text = "\(steps) Steps Yesterday"
                       
                         if self.isSameDay() == false && steps >= 1000 {
                              self.dimView.isHidden = false
                              let thousands = Int(steps / 1000)
                              self.earned = 10 * thousands
                              //self.earned = 200
                              self.view.bringSubviewToFront(self.collectView)
                              self.collectText.text = "You earned \(self.earned) Paw Points for walking \(steps) steps yesterday!"
                         }
                    }
                }
                
                self.queryDistanceHistory()
            }
        }
          
          beginAnimation()
    }
	
     // MARK: Custom functions
     
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
          var range = [1,2,3,4]
          
          if CareState.hasBeenFed && CareState.hasBeenWatered {
               range = [1,2,3,4,5,6]
          } else if CareState.hasBeenFed {
               range = [1,2,3,4,5]
          } else if CareState.hasBeenWatered {
               range = [1,2,3,4,6]
          }
          
          let animation = range.randomElement() //Int.random(in: 1...max)
          
          TimerManager.stopTimer()
          catArt.stopAnimating()
          sleepArt.stopAnimating()
          playArt.stopAnimating()
          loafArt.stopAnimating()
          eatArt.stopAnimating()
          drinkArt.stopAnimating()
          
          
          print(animation)
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
          }
     }
     
     func checkCareProgress() {
          if CareState.hasBeenFed && CareState.hasBeenWatered {
               CareState.daysCaredFor += 1
          }
          
          if CareState.daysCaredFor == 7 {
               dimView.isHidden = false
               earned = 50
               view.bringSubviewToFront(collectView)
               collectText.text = "You earned \(self.earned) Paw Points for taking care of your cat for 7 days in a row!"
               
               CareState.daysCaredFor = 0
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
               //showAlert(title: "Could not retrieve data", message: "\(error.userInfo)")
          }
     }
     
     func loadCareState() {
          var managedContext = CoreDataManager.shared.managedObjectContext
          var fetchRequest = NSFetchRequest<CareStatus>(entityName: "CareStatus")
          
          do {
               var result = try managedContext.fetch(fetchRequest)
               if let result = result.first {
                    
                    if isSameDay() == false {
                         if result.hasBeenFed && result.hasBeenWatered {
                              CareState.daysCaredFor = result.daysOfConsecutiveCare + 1
                         } else {
                              CareState.daysCaredFor = 0
                         }
                         
                         CareState.hasBeenFed = false
                         CareState.hasBeenWatered = false
                    } else {
                         CareState.care = result
                         CareState.hasBeenFed = result.hasBeenFed
                         CareState.hasBeenWatered = result.hasBeenWatered
                         CareState.daysCaredFor = result.daysOfConsecutiveCare
                    }
               }
               print("care loaded")
               
          } catch let error as NSError {
               //showAlert(title: "Could not retrieve data", message: "\(error.userInfo)")
          }
     }
     
     func updateCare() {
          var managedContext = CoreDataManager.shared.managedObjectContext
          
          // save currency anew if it doesn't exist (like on app initial launch)
          guard let currentCare = CareState.care else {
               let careSave = CareStatus(context: managedContext)
               
               careSave.hasBeenFed = CareState.hasBeenFed
               careSave.hasBeenWatered = CareState.hasBeenWatered
               careSave.daysOfConsecutiveCare = CareState.daysCaredFor
               print(CareState.hasBeenFed)
               print(CareState.hasBeenWatered)
               print(CareState.daysCaredFor)
               do {
                    try managedContext.save()
                    print("saved")
               } catch {
                    // this should never be displayed but is here to cover the possibility
                    //showAlert(title: "Save failed", message: "Notice: Data has not successfully been saved.")
               }
               
               return
          }
          
          currentCare.hasBeenFed = CareState.hasBeenFed
          currentCare.hasBeenWatered = CareState.hasBeenWatered
          currentCare.daysOfConsecutiveCare = CareState.daysCaredFor
          print(CareState.hasBeenFed)
          print(CareState.hasBeenWatered)
          print(CareState.daysCaredFor)
          
          do {
               try managedContext.save()
               print("resave successful")
          } catch {
               // this should never be displayed but is here to cover the possibility
               //showAlert(title: "Save failed", message: "Notice: Data has not successfully been saved.")
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
               // showAlert(title: "Could not retrieve data", message: "\(error.userInfo)")
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
                    //showAlert(title: "Save failed", message: "Notice: Data has not successfully been saved.")
               }
          
               return
          }
         
          // otherwise rewrite data
          let newTotal = Currency.userTotal + amount
          Currency.userTotal = newTotal
          currentCurrency.total = Int64(newTotal)
         
          do {
               try managedContext.save()
               print("resave successful")
          } catch {
               // this should never be displayed but is here to cover the possibility
               //showAlert(title: "Save failed", message: "Notice: Data has not successfully been saved.")
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
                    resultCount = sum.doubleValue(for: HKUnit.meter())
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
                        let distance = sum.doubleValue(for: HKUnit.meter())
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

     @IBAction func foodPressed(_ sender: UIButton) {
          if CareState.hasBeenFed {
               return
          } else {
               food.isHidden = false
               CareState.hasBeenFed = true
               
               checkCareProgress()
               updateCare()
          }
     }
     
     
     @IBAction func waterPressed(_ sender: UIButton) {
          if CareState.hasBeenWatered {
               return
          } else {
               water.isHidden = false
               CareState.hasBeenWatered = true
               
               checkCareProgress()
               updateCare()
          }
     }
     
     @IBAction func viewStatsPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "viewStatistics", sender: Any?.self)
     }
     
     @IBAction func storePressed(_ sender: UIButton) {
          performSegue(withIdentifier: "goToStore", sender: Any?.self)
     }
     
    
     @IBAction func collectButtonTapped(_ sender: UIButton) {
          dimView.isHidden = true
          self.view.sendSubviewToBack(collectView)
          addCurrency(with: earned)
          pointsLabel.text = "\(Currency.userTotal) Paw Points"
          loadCurrency()
     }
}


