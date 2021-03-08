//
//  AboutViewController.swift
//  Amble Cat
//
//  Created by Kate Duncan-Welke on 12/12/19.
//  Copyright © 2019 Kate Duncan-Welke. All rights reserved.
//

import UIKit
import CoreData

class AboutViewController: UIViewController {

    // MARK: IBOutlets
    
    @IBOutlet weak var zapsplatButton: UIButton!
    @IBOutlet weak var soundbibleButton: UIButton!
    @IBOutlet weak var privacyPolicyButton: UIButton!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    private let aboutViewModel = AboutViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        zapsplatButton.layer.cornerRadius = 10
        soundbibleButton.layer.cornerRadius = 10
        privacyPolicyButton.layer.cornerRadius = 10
        
        if aboutViewModel.milesSelected() {
            segmentedControl.selectedSegmentIndex = 0
        } else {
            segmentedControl.selectedSegmentIndex = 1
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

    @IBAction func zapsplat(_ sender: UIButton) {
        guard let url = URL(string: "https://www.zapsplat.com") else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    @IBAction func soundBible(_ sender: UIButton) {
        guard let url = URL(string: "http://soundbible.com") else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    @IBAction func privacyPolicy(_ sender: UIButton) {
        guard let url = URL(string: "http://kduncan-welke.com/amblecatprivacy.php") else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    @IBAction func retakeTutorial(_ sender: UIButton) {
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "redoTutorial"), object: nil)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func measurementChanged(_ sender: UISegmentedControl) {
        aboutViewModel.saveMeasurement(segment: segmentedControl.selectedSegmentIndex)
    }
    
    @IBAction func dismiss(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
