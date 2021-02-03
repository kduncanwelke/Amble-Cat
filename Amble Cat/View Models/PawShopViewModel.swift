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
    
    func isProductsEmpty() -> Bool {
        return StoreManager.products.isEmpty
    }
    
    func getCurrencyString() -> String {
        return "\(Currency.userTotal)"
    }
    
    func getProductsCount() -> Int {
        return StoreManager.products.count
    }
    
    func getTitle(index: IndexPath) -> String {
        return StoreManager.products[index].localizedTitle
    }
    
    func getPrice(index: IndexPath) -> String {
        return StoreManager.products[index].price
    }
    
    func getDescrip(index: IndexPath) -> String {
        return StoreManager.products[index].localizedDescription
    }
    
    func getImage(index: IndexPath) -> UIImage {
        let item = StoreManager.products[index]
        return Products.productImages[item.productIdentifier]
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
        
        StoreManager.request = SKProductsRequest(productIdentifiers: productIdentifiers)
        StoreManager.request.delegate = self
        StoreManager.request.start()
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
}
