//
//  ViewController.swift
//  Amble Cat
//
//  Created by Kate Duncan-Welke on 9/30/19.
//  Copyright © 2019 Kate Duncan-Welke. All rights reserved.
//

import UIKit
import HealthKit
import Charts

class ViewController: UIViewController {
    
    // MARK: IBOutlets
    
    @IBOutlet weak var stepsLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var graphView: BarChartView!
    
    @IBOutlet weak var tapDate: UILabel!
    @IBOutlet weak var tapSteps: UILabel!
    
    
    // MARK: Variables
    
    let healthStore = HKHealthStore()
    var stepHistory: [Double] = []
    var dates: [Date] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        graphView.delegate = self
        
        tapSteps.isHidden = true
        tapDate.isHidden = true
        tapSteps.layer.masksToBounds = true
        tapDate.layer.masksToBounds = true
        tapSteps.layer.cornerRadius = 15
        tapDate.layer.cornerRadius = 15
        
        let healthKitTypes: Set = [ HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!, HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.distanceWalkingRunning)! ]
        
        healthStore.requestAuthorization(toShare: healthKitTypes, read: healthKitTypes) { (bool, error) in
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
                
                self.querySteps()
            }
        }

    }
    
    // MARK: Custom functions
    
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
                    // Get steps (they are of double type)
                    resultCount = sum.doubleValue(for: HKUnit.count())
                } // end if
                // Return
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
                // Return
                DispatchQueue.main.async {
                    completion(resultCount)
                }
            }
        }
        
        healthStore.execute(query)
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
                    // Get steps (they are of double type)
                    resultCount = sum.doubleValue(for: HKUnit.meter())
                }

                // Return
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
                // Return
                DispatchQueue.main.async {
                    completion(resultCount)
                }
            }
        }
        
        healthStore.execute(query)
    }
    
    func querySteps() {
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
                      
                        self.stepHistory.insert(steps, at: 0)
                        self.dates.insert(date, at: 0)
                } else {
                        let date = statistics.startDate
                        let steps = 0.0
                        print("\(date): steps = \(steps)")
                    
                        self.stepHistory.insert(steps, at: 0)
                        self.dates.insert(date, at: 0)
                    }
                }
                
                DispatchQueue.main.async {
                    self.updateChart()
                }
            }
        }
        healthStore.execute(stepsQuery)
    }
    
    func updateChart() {
        print(dates)
        var entries: [BarChartDataEntry] = []
        
        for i in 0..<stepHistory.count {
            var entry = BarChartDataEntry(x: Double(i), y: stepHistory[i])
            entries.append(entry)
        }
        
        let dataSet = BarChartDataSet(entries: entries, label: "Steps")
        let data = BarChartData(dataSets: [dataSet])
        
        graphView.xAxis.valueFormatter = DefaultAxisValueFormatter(block: {(index, _) in
            let date = self.dates[Int(index)]
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EE"
            let currentDateString: String = dateFormatter.string(from: date)
            
            return currentDateString
        })
        
        graphView.noDataText = "No step history available"
        dataSet.valueFont = UIFont.systemFont(ofSize: 12.0)
        dataSet.drawValuesEnabled = false
        graphView.data = data
        graphView.xAxis.labelFont = UIFont.systemFont(ofSize: 12.0)
        graphView.xAxis.setLabelCount(dates.count, force: true)
        graphView.xAxis.labelPosition = .bottom
        graphView.xAxis.granularity = 1.0
        graphView.xAxis.granularityEnabled = true
        graphView.xAxis.labelCount = dates.count
        graphView.xAxis.drawGridLinesEnabled = false
        
        graphView.rightAxis.enabled = false
        graphView.leftAxis.enabled = false
        
        dataSet.colors = ChartColorTemplates.joyful()
        graphView.notifyDataSetChanged()
        
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.setLocalizedDateFormatFromTemplate("ddMMyyyy")
        let string = formatter.string(from: dates[0])
        
        let steps = Int(stepHistory[0])
        tapSteps.text = "\(steps) steps"
        tapDate.text = string
        tapSteps.isHidden = false
        tapDate.isHidden = false
    }
}

extension ViewController: ChartViewDelegate {
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        let index = Int(entry.x)
        
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.setLocalizedDateFormatFromTemplate("ddMMyyyy")
        let string = formatter.string(from: dates[index])
        
        tapDate.text = string
        let steps = Int(stepHistory[index])
        tapSteps.text = "\(steps) steps"
    }
}
