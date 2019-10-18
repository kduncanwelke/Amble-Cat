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
     
     
     // MARK: Variables

     let userDefaultDate = "userDefaultDate"
     var earned = 0
   
     override func viewDidLoad() {
          super.viewDidLoad()
          // Do any additional setup after loading the view.
          
          currentsBackground.layer.cornerRadius = 20
          collectView.layer.cornerRadius = 20
          collectView.isHidden = true
          
          loadCurrency()
        
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
                                   
                                   self.collectView.isHidden = false
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
    }
    
     // MARK: Custom functions
     
     func loadCurrency() {
         var managedContext = CoreDataManager.shared.managedObjectContext
         var fetchRequest = NSFetchRequest<Points>(entityName: "Points")
         
          do {
               var result = try managedContext.fetch(fetchRequest)
               if let total = result.first {
                    Currency.userTotal = Int(total.total)
               }
               print("total loaded")
             
          } catch let error as NSError {
               //showAlert(title: "Could not retrieve data", message: "\(error.userInfo)")
          }
     }
     
     func saveCurrency(with amount: Int) {
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
    
     @IBAction func collectButtonTapped(_ sender: UIButton) {
          collectView.isHidden = true
          saveCurrency(with: earned)
          pointsLabel.text = "\(Currency.userTotal) Paw Points"
     }
}


