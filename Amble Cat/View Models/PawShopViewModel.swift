//
//  PawShopViewModel.swift
//  Amble Cat
//
//  Created by Kate Duncan-Welke on 2/3/21.
//  Copyright © 2021 Kate Duncan-Welke. All rights reserved.
//

import Foundation
import StoreKit

public class PawShopViewModel {
    
    func monitorNetwork() {
        NetworkMonitor.monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                print("connection successful")
                NetworkMonitor.connection = true
                //NotificationCenter.default.post(name: NSNotification.Name(rawValue: "networkRestored"), object: nil)
            } else {
                print("no connection")
                NetworkMonitor.connection = false
            }
        }
        
        let queue = DispatchQueue(label: "Monitor")
        NetworkMonitor.monitor.start(queue: queue)
    }
    
    var toPurchase: SKProduct?
    var receipt: Receipt?
    
    func setReceipt() {
        receipt = Receipt()
    }
    
    func getReceiptStatus() -> Status? {
        return receipt?.status
    }
    
    func setSelected(index: IndexPath) {
        toPurchase = StoreManager.products[index.row]
    }
    
    func isProductsEmpty() -> Bool {
        return StoreManager.products.isEmpty
    }
    
    func getCurrencyString() -> String {
        return "\(Currency.userTotal)"
    }
    
    func getProductsCount() -> Int {
        return StoreManager.products.count
    }
    
    func addProducts(products: [SKProduct]) {
        StoreManager.products = products
    }
    
    func getTitle(index: IndexPath) -> String {
        return StoreManager.products[index.row].localizedTitle
    }
    
    func getPrice(index: IndexPath) -> String {
        return "\(StoreManager.products[index.row].price)"
    }
    
    func getDescrip(index: IndexPath) -> String {
        return StoreManager.products[index.row].localizedDescription
    }
    
    func getImage(index: IndexPath) -> UIImage {
        let item = StoreManager.products[index.row]
        return Products.productImages[item.productIdentifier]!
    }
    
    func addCurrency(amount: Int) {
        Currency.toAdd = amount
    }
    
    func getProductIdentifiers() -> [String] {
        return [Products.fiftyPoints, Products.oneHundredPoints, Products.oneHundredFiftyPoints, Products.twoHundredPoints, Products.threeHundredFiftyPoints, Products.fiveHundredPoints, Products.oneThousandPoints, Products.oneThousandFiveHundredPoints, Products.twoThousandPoints, Products.threeThousandPoints, Products.fiveThousandPoints, Products.tenThousandPoints]
    }
    
    func purchase(index: IndexPath) {
        StoreObserver.iapObserver.buy(StoreManager.products[index.row])
    }
    
    func checkIdentifier(index: IndexPath) -> Int? {
        return Products.productQuantities[StoreManager.products[index.row].productIdentifier]
    }
    
    func checkForReceipt() -> Bool {
        return Receipt.isReceiptPresent()
    }
}
