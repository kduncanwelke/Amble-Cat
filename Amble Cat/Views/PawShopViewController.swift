//
//  PawShopViewController.swift
//  Amble Cat
//
//  Created by Kate Duncan-Welke on 11/19/19.
//  Copyright © 2019 Kate Duncan-Welke. All rights reserved.
//

import UIKit
import StoreKit
import Network

class PawShopViewController: UIViewController, UITableViewDelegate {

    // MARK: IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var pawPointTotal: UILabel!
    @IBOutlet weak var dismissButton: UIButton!
    
    // MARK: Variables
    
    let pawShopViewModel = PawShopViewModel()
    var hasLoaded = false
    var receipt: Receipt?
    var pawPoints = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(self, selector: #selector(updatePoints), name: NSNotification.Name(rawValue: "updatePoints"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(networkRestored), name: NSNotification.Name(rawValue: "networkRestored"), object: nil)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        dismissButton.layer.cornerRadius = 10
        
        pawPointTotal.text = pawShopViewModel.getCurrencyString()
        
        pawShopViewModel.getProducts()
 
    }
    

    // MARK: Custom functions
    
    @objc func networkRestored() {
        if pawShopViewModel.isProductsEmpty() {
            pawShopViewModel.getProducts()
        }
        
        if Receipt.isReceiptPresent() {
            validateReceipt()
            print("validate on load")
        } else {
            refreshReceipt()
            print("refresh on load")
        }
    }
    
    @objc func updatePoints() {
        Currency.toAdd = pawPoints
        print(pawPoints)
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "addPurchasedCurrency"), object: nil)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "refreshPoints"), object: nil)
        
        pawPointTotal.text = "\(Currency.userTotal)"
        pawPoints = 0
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
    
    @IBAction func dismissPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}

extension PawShopViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pawShopViewModel.getProductsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pawShopCell", for: indexPath) as! PawShopTableViewCell
        
        cell.configure(index: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // purchase item
        Sound.playSound(number: Sounds.blopSound.number)
        
        tableView.cellForRow(at: indexPath)?.animatePress {
        }
        
        let isAuthorizedForPayments = SKPaymentQueue.canMakePayments()
        
        if isAuthorizedForPayments && !pawShopViewModel.isProductsEmpty() {
            if NetworkMonitor.connection {
                StoreObserver.iapObserver.buy(products[indexPath.row])
                
                guard let points = Products.productQuantities[products[indexPath.row].productIdentifier] else { return }
                
                pawPoints = points
            } else {
                showAlert(title: "Purchases unavailable", message: "Purchases cannot be processed without a network connection - please try again")
            }
        } else {
            showAlert(title: "Payments not authorized", message: "This device is not permitted to process payments")
        }
    }
}


// MARK: StoreKit

extension PawShopViewController: SKProductsRequestDelegate {
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        if response.products.count == Products.productQuantities.count {
            products = response.products
            for product in products {
                print(product.localizedTitle)
                print(product.price)
                print(product.priceLocale)
            }
            
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
        
        for invalidIdentifier in response.invalidProductIdentifiers {
            // handle invalid case
        }
    }
    
    func request(_ request: SKRequest, didFailWithError error: Error) {
        print("Failed to load list of products.")
        print("Error: \(error.localizedDescription)")
    }
    
    func requestDidFinish(_ request: SKRequest) {
        if Receipt.isReceiptPresent() {
            validateReceipt()
        }
    }
}
