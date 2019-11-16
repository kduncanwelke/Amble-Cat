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
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        graphView.delegate = self
        
        updateChart()
    }
    
    
    // MARK: Custom functions
    
    func updateChart() {
        var entries: [BarChartDataEntry] = []
        
        for i in 0..<HealthDataManager.stepHistory.count {
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
    
    // MARK: IBActions
    
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
