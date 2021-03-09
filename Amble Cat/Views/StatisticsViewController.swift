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
    
    @IBOutlet var days: [UILabel]!
    @IBOutlet var steps: [UILabel]!
    @IBOutlet weak var dismissButton: UIButton!
    
    // MARK: Variables
    
    private let stepViewModel = StepViewModel()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        dismissButton.layer.cornerRadius = 10
        showStepHistory()
    }
    
    
    // MARK: Custom functions
    
    func showStepHistory() {
        for dayLabel in days {
            dayLabel.text = stepViewModel.getDay(index: dayLabel.tag)
        }
        
        for stepLabel in steps {
            stepLabel.text = "\(stepViewModel.getSteps(index: stepLabel.tag))"
        }
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

