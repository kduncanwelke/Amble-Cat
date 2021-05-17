//
//  WhackamouseViewController.swift
//  Amble Cat
//
//  Created by Kate Duncan-Welke on 5/17/21.
//  Copyright © 2021 Kate Duncan-Welke. All rights reserved.
//

import UIKit

class WhackamouseViewController: UIViewController {

    // MARK: IBOutlets
    
    @IBOutlet var mice: [UIImageView]!
    @IBOutlet weak var back: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        back.layer.cornerRadius = 10
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
    
    @IBAction func tappedMouse1(_ sender: UITapGestureRecognizer) {
    }
    
    @IBAction func tappedMouse2(_ sender: UITapGestureRecognizer) {
    }
    
    @IBAction func tappedMouse3(_ sender: UITapGestureRecognizer) {
    }
    
    @IBAction func tappedMouse4(_ sender: UITapGestureRecognizer) {
    }
    
    @IBAction func tappedMouse5(_ sender: UITapGestureRecognizer) {
    }
    
    @IBAction func tappedMouse6(_ sender: UITapGestureRecognizer) {
    }
    
    @IBAction func tappedMouse7(_ sender: UITapGestureRecognizer) {
    }
    
    @IBAction func tappedMouse8(_ sender: UITapGestureRecognizer) {
    }
    
    @IBAction func backTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}
