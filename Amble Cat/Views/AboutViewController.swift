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
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var licenseView: UIView!
    @IBOutlet weak var licenseButton: UIButton!
    @IBOutlet weak var close: UIButton!
    
    private let aboutViewModel = AboutViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        backButton.layer.cornerRadius = 10
        zapsplatButton.layer.cornerRadius = 10
        soundbibleButton.layer.cornerRadius = 10
        privacyPolicyButton.layer.cornerRadius = 10
        licenseButton.layer.cornerRadius = 10
        close.layer.cornerRadius = 10
        
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
        guard let url = URL(string: "http://kduncan-welke.com/microkittyprivacy.php") else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    @IBAction func viewLicense(_ sender: UIButton) {
        licenseView.isHidden = false
    }
    
    @IBAction func closeLicense(_ sender: UIButton) {
        licenseView.isHidden = true
    }
    
    @IBAction func measurementChanged(_ sender: UISegmentedControl) {
        aboutViewModel.saveMeasurement(segment: segmentedControl.selectedSegmentIndex)
    }
    
    @IBAction func dismiss(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
