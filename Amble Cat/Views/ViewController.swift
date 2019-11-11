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
     @IBOutlet weak var bedArt: UIImageView!
     @IBOutlet weak var bowlArt: UIImageView!
     @IBOutlet weak var toyArt: UIImageView!
     @IBOutlet weak var pictureArt: UIImageView!
     @IBOutlet weak var floorArt: UIImageView!
     @IBOutlet weak var wallArt: UIImageView!
     
     
     // MARK: Variables

     let userDefaultDate = "userDefaultDate"
     var earned = 200
     let blinkAnimation: [UIImage] = [#imageLiteral(resourceName: "lucytail2.png"),#imageLiteral(resourceName: "lucytail2.png"),#imageLiteral(resourceName: "blink1.png"),#imageLiteral(resourceName: "blink2.png"),#imageLiteral(resourceName: "blink3.png"),#imageLiteral(resourceName: "blink2.png"),#imageLiteral(resourceName: "blink1.png")]
   
     override func viewDidLoad() {
          super.viewDidLoad()
          // Do any additional setup after loading the view.
          
          NotificationCenter.default.addObserver(self, selector: #selector(refreshPoints), name: NSNotification.Name(rawValue: "refreshPoints"), object: nil)
          
           NotificationCenter.default.addObserver(self, selector: #selector(decorChanged), name: NSNotification.Name(rawValue: "decorChanged"), object: nil)
          
          currentsBackground.layer.cornerRadius = 20
          collectView.layer.cornerRadius = 20
          
          loadCurrency()
          loadEquipment()
        
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
                       
                        let date = Date()
                        let calendar = Calendar.current
                        let dateToCompare = calendar.component(.day , from: date)

                        let userDefaultDate = UserDefaults.standard.integer(forKey: "userDefaultDate")

                        if userDefaultDate != dateToCompare {
                             if steps >= 1000 {
                                   let thousands = Int(steps / 1000)
                                   self.earned = 10 * thousands
                                   self.earned = 200
                                   self.view.bringSubviewToFront(self.collectView)
                                   self.collectText.text = "You earned \(self.earned) Paw Points for walking \(steps) steps yesterday!"
                                   UserDefaults.standard.set(dateToCompare, forKey: self.userDefaultDate)
                              }
                        } else {
                           print("same day")
                        }
                    }
                }
                
                self.queryDistanceHistory()
            }
        }
          
          catArt.animationImages = blinkAnimation
          catArt.animationDuration = 1.0
          catArt.animationRepeatCount = 1
          catArt.startAnimating()
          
          TimerManager.beginTimer(with: catArt)
    }
	
     // MARK: Custom functions
     
     @objc func refreshPoints() {
          pointsLabel.text = "\(Currency.userTotal) Paw Points"
     }
     
     @objc func decorChanged() {
          guard let bed = StoreInventory.inventoryDictionary[DecorManager.bedID], let bowl = StoreInventory.inventoryDictionary[DecorManager.bowlID], let floor = StoreInventory.inventoryDictionary[DecorManager.floorID], let picture = StoreInventory.inventoryDictionary[DecorManager.pictureID], let toy = StoreInventory.inventoryDictionary[DecorManager.toyID], let wall = StoreInventory.inventoryDictionary[DecorManager.wallID] else { return }
          
          bedArt.image = bed.image
          bowlArt.image = bowl.image
          floorArt.image = floor.image
          pictureArt.image = picture.image
          toyArt.image = toy.image
          wallArt.image = wall.image
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
                    DecorManager.floorID = loaded.floor
                    DecorManager.pictureID = loaded.picture
                    DecorManager.toyID = loaded.toy
                    DecorManager.wallID = loaded.wall
                    
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
          floorArt.image = StoreInventory.inventoryDictionary[DecorManager.floorID]?.image
          pictureArt.image = StoreInventory.inventoryDictionary[DecorManager.pictureID]?.image
          toyArt.image = StoreInventory.inventoryDictionary[DecorManager.toyID]?.image
          wallArt.image = StoreInventory.inventoryDictionary[DecorManager.wallID]?.image
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

     @IBAction func viewStatsPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "viewStatistics", sender: Any?.self)
     }
     
     @IBAction func storePressed(_ sender: UIButton) {
          performSegue(withIdentifier: "goToStore", sender: Any?.self)
     }
     
    
     @IBAction func collectButtonTapped(_ sender: UIButton) {
          self.view.sendSubviewToBack(collectView)
          addCurrency(with: earned)
          pointsLabel.text = "\(Currency.userTotal) Paw Points"
          loadCurrency()
     }
}


