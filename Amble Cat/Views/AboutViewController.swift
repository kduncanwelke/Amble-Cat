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
    
    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var tutorialButton: UIButton!
    @IBOutlet weak var zapsplatButton: UIButton!
    @IBOutlet weak var soundbibleButton: UIButton!
    @IBOutlet weak var privacyPolicyButton: UIButton!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        dismissButton.layer.cornerRadius = 10
        tutorialButton.layer.cornerRadius = 10
        zapsplatButton.layer.cornerRadius = 10
        soundbibleButton.layer.cornerRadius = 10
        privacyPolicyButton.layer.cornerRadius = 10
        
        switch Measures.preferred {
        case .miles:
            segmentedControl.selectedSegmentIndex = 0
        case .meters:
            segmentedControl.selectedSegmentIndex = 1
        }
    }
    

    // MARK: Custom functions
    
    func saveMeasurement() {
        var managedContext = CoreDataManager.shared.managedObjectContext
        
        // save currency anew if it doesn't exist (like on app initial launch)
        guard let currentMeasure = Measures.loaded else {
            let measureSave = Measurement(context: managedContext)
            
            switch segmentedControl.selectedSegmentIndex {
            case 0:
                measureSave.selection = Distance.miles.rawValue
                Measures.preferred = .miles
            case 1:
                measureSave.selection = Distance.meters.rawValue
                Measures.preferred = .meters
            default:
                return
            }

            do {
                try managedContext.save()
                print("saved measurement")
            } catch {
                // this should never be displayed but is here to cover the possibility
                showAlert(title: "Save failed", message: "Notice: Data has not successfully been saved.")
            }
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "unitChanged"), object: nil)
            return
        }
        
        // otherwise rewrite data
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            currentMeasure.selection = Distance.miles.rawValue
            Measures.preferred = .miles
        case 1:
            currentMeasure.selection = Distance.meters.rawValue
            Measures.preferred = .meters
        default:
            return
        }
        
        do {
            try managedContext.save()
            print("resave of measure successful")
        } catch {
            // this should never be displayed but is here to cover the possibility
            showAlert(title: "Save failed", message: "Notice: Data has not successfully been saved.")
        }
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "unitChanged"), object: nil)
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
        saveMeasurement()
    }
    
    @IBAction func dismiss(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
