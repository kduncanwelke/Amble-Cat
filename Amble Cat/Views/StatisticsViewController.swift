//
//  StatisticsViewController.swift
//  Amble Cat
//
//  Created by Kate Duncan-Welke on 10/15/19.
//  Copyright © 2019 Kate Duncan-Welke. All rights reserved.
//

import UIKit
import HealthKit
import Charts

class StatisticsViewController: UIViewController {
    
    // MARK: IBOutlets
    
    @IBOutlet weak var graphView: BarChartView!
    @IBOutlet weak var tapDate: UILabel!
    @IBOutlet weak var tapSteps: UILabel!
    @IBOutlet weak var tapDistance: UILabel!
    @IBOutlet weak var dismissButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        graphView.delegate = self
        dismissButton.layer.cornerRadius = 10
        
        HealthStore.store.requestAuthorization(toShare: HealthStore.healthKitTypes, read: HealthStore.healthKitTypes) { [unowned self] (bool, error) in
            if (bool) {
                DispatchQueue.main.async {
                     self.updateChart()
                }
            }
        }
    }
    
    
    // MARK: Custom functions
    
    func updateChart() {
        var entries: [BarChartDataEntry] = []
        
        for i in 0..<7 {
            var entry = BarChartDataEntry(x: Double(i), y: HealthDataManager.stepHistory[i])
            entries.append(entry)
        }
        
        let dataSet = BarChartDataSet(entries: entries, label: "Past Week's Steps")
        let data = BarChartData(dataSets: [dataSet])
        
        graphView.xAxis.valueFormatter = DefaultAxisValueFormatter(block: {(index, _) in
            let date = HealthDataManager.dates[Int(index)]
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
        graphView.xAxis.setLabelCount(HealthDataManager.dates.count, force: true)
        graphView.xAxis.labelPosition = .bottom
        graphView.xAxis.granularity = 1.0
        graphView.xAxis.granularityEnabled = true
        graphView.xAxis.labelCount = HealthDataManager.dates.count
        graphView.xAxis.drawGridLinesEnabled = false
        
        graphView.rightAxis.enabled = false
        graphView.leftAxis.enabled = false
        
        dataSet.colors = ChartColorTemplates.joyful()
        graphView.notifyDataSetChanged()
        
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.setLocalizedDateFormatFromTemplate("ddMMyyyy")
        let string = formatter.string(from: HealthDataManager.dates[0])
        
        let steps = Int(HealthDataManager.stepHistory[0])
        tapSteps.text = "\(steps) steps"
        tapDate.text = string
        tapDistance.text = "\(Int(HealthDataManager.distances[0])) meters"
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
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
            
            guard let endDate = calendar.date(byAdding: .day, value: HealthDataManager.startDate, to: today, wrappingComponents: false), let startDate = calendar.date(byAdding: .day, value: HealthDataManager.endDate, to: endDate, wrappingComponents: false) else { return }
            
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
            
            guard let endDate = calendar.date(byAdding: .day, value: HealthDataManager.startDate, to: today, wrappingComponents: false), let startDate = calendar.date(byAdding: .day, value: HealthDataManager.endDate, to: endDate, wrappingComponents: false) else { return }
            
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
    
    @IBAction func nextTapped(_ sender: UIButton) {
        if HealthDataManager.startDate < -1 {
            HealthDataManager.startDate += 7
            HealthDataManager.endDate += 7
            
            querySteps { [unowned self] (result) in
                DispatchQueue.main.async {
                    self.updateChart()
                }
            }
            
            queryDistanceHistory()
        } else {
            // earliest date is being shown
            return
        }
    }
    
    
    @IBAction func previousTapped(_ sender: UIButton) {
        HealthDataManager.startDate -= 7
        HealthDataManager.endDate -= 7
        
        querySteps { [unowned self] (result) in
            DispatchQueue.main.async {
                self.updateChart()
            }
        }
        
        queryDistanceHistory()
    }
    
    
    @IBAction func dismissTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "refreshView"), object: nil)
    }

}

// MARK: Chart delegate

extension StatisticsViewController: ChartViewDelegate {
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        let index = Int(entry.x)
        
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.setLocalizedDateFormatFromTemplate("ddMMyyyy")
        let string = formatter.string(from: HealthDataManager.dates[index])
        
        tapDate.text = string
        let steps = Int(HealthDataManager.stepHistory[index])
        tapSteps.text = "\(steps) steps"
        tapDistance.text = "\(Int(HealthDataManager.distances[index])) meters"
    }
}
