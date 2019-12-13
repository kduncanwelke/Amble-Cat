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
    
    var request: SKProductsRequest!
    var products = [SKProduct]()
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
        
        pawPointTotal.text = "\(Currency.userTotal)"
        
        getProducts()
 
    }
    

    // MARK: Custom functions
    
    @objc func networkRestored() {
        if products.isEmpty {
            getProducts()
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
    
    func refreshReceipt() {
        print("Requesting refresh of receipt.")
        let refreshRequest = SKReceiptRefreshRequest()
        refreshRequest.delegate = self
        refreshRequest.start()
    }
    
    func validateReceipt() {
        receipt = Receipt()
        if let receiptStatus = receipt?.status {
            guard receiptStatus == .validationSuccess else {
                print(receiptStatus)
                return
            }
        }
    }
    
    func getProducts() {
        var isAuthorizedForPayments: Bool {
            return SKPaymentQueue.canMakePayments()
        }
        
        if isAuthorizedForPayments {
            validate(productIdentifiers: [Products.fiftyPoints, Products.oneHundredPoints, Products.oneHundredFiftyPoints, Products.twoHundredPoints, Products.threeHundredFiftyPoints, Products.fiveHundredPoints, Products.oneThousandPoints, Products.oneThousandFiveHundredPoints, Products.twoThousandPoints, Products.threeThousandPoints, Products.fiveThousandPoints, Products.tenThousandPoints])
        }
    }
    
    func validate(productIdentifiers: [String]) {
        let productIdentifiers = Set(productIdentifiers)
        
        request = SKProductsRequest(productIdentifiers: productIdentifiers)
        request.delegate = self
        request.start()
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
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pawShopCell", for: indexPath) as! PawShopTableViewCell
        
        var item: SKProduct
        print(indexPath.row)
        item = products[indexPath.row]
        
        cell.title.text = item.localizedTitle
        cell.price.text = "\(item.price)"
        cell.details.text = item.localizedDescription
        cell.picture.image = Products.productImages[item.productIdentifier] 
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // purchase item
        Sound.playSound(number: Sounds.blopSound.number)
        
        tableView.cellForRow(at: indexPath)?.animatePress {
        }
        
        let isAuthorizedForPayments = SKPaymentQueue.canMakePayments()
        
        if isAuthorizedForPayments && !products.isEmpty {
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
