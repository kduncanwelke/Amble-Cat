//
//  StoreObserver.swift
//  Amble Cat
//
//  Created by Kate Duncan-Welke on 11/19/19.
//  Copyright © 2019 Kate Duncan-Welke. All rights reserved.
//

import Foundation
import StoreKit

class StoreObserver: NSObject, SKPaymentTransactionObserver {
    
    static let iapObserver = StoreObserver()
    var restored: [String] = []
    var purchased: [String] = []
    static var isComplete = false
    
    override init() {
        super.init()
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        print("updating transactions")
        for transaction in transactions {
            switch transaction.transactionState {
            case .purchasing:
                break
            case .deferred:
                print("deferred")
            // The purchase was successful.
            case .purchased:
                if !transaction.downloads.isEmpty {
                    queue.start(transaction.downloads)
                }
                print("purchase succeeded")
            // The transaction failed.
            case .failed:
                queue.finishTransaction(transaction)
                print("failed")
            // There are restored products.
            case .restored:
                if !transaction.downloads.isEmpty {
                    queue.start(transaction.downloads)
                }
                print("restored")
            default:
                break
            }
        }
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedDownloads downloads: [SKDownload]) {
        for download in downloads {
            
            if download == downloads.last {
                StoreObserver.isComplete = true
            }
            
            switch download.state {
            case .active:
                print("active")
            case .cancelled:
                print("cancelled")
            case .failed:
                print("failed")
            case .paused:
                print("paused")
            case .waiting:
                print("waiting")
            case .finished:
                print("finished")
            }
        }
    }
    
    func buy(_ product: SKProduct) {
        let payment = SKMutablePayment(product: product)
        SKPaymentQueue.default().add(payment)
    }
    
    // do not need?
    func restore() {
        SKPaymentQueue.default().restoreCompletedTransactions()
    }

}
