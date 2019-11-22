//
//  ReceiptItem.swift
//  Amble Cat
//
//  Created by Kate Duncan-Welke on 11/21/19.
//  Copyright © 2019 Kate Duncan-Welke. All rights reserved.
//

import Foundation

struct ReceiptItem {
    var quantity: Int?
    var productIdentifier: String?
    var transactionIdentifer: String?
    var originalTransactionIdentifier: String?
    var purchaseDate: Date?
    var originalPurchaseDate: Date?
    var subscriptionExpirationDate: Date?
    var subscriptionIntroductoryPricePeriod: Int?
    var subscriptionCancellationDate: Date?
    var webOrderLineId: Int?
    
    init?(with pointer: inout UnsafePointer<UInt8>?, payloadLength: Int) {
        let endPointer = pointer!.advanced(by: payloadLength)
        var type: Int32 = 0
        var xclass: Int32 = 0
        var length = 0
        
        ASN1_get_object(&pointer, &length, &type, &xclass, payloadLength)
        guard type == V_ASN1_SET else {
            return nil
        }
        
        while pointer! < endPointer {
            ASN1_get_object(&pointer, &length, &type, &xclass, pointer!.distance(to: endPointer))
            guard type == V_ASN1_SEQUENCE else {
                return nil
            }
            guard let attributeType = readASN1Integer(ptr: &pointer,
                                                      maxLength: pointer!.distance(to: endPointer))
                else {
                    return nil
            }
            // Attribute version must be an integer, but not using the value
            guard let _ = readASN1Integer(ptr: &pointer,
                                          maxLength: pointer!.distance(to: endPointer))
                else {
                    return nil
            }
            ASN1_get_object(&pointer, &length, &type, &xclass, pointer!.distance(to: endPointer))
            guard type == V_ASN1_OCTET_STRING else {
                return nil
            }
            
            switch attributeType {
            case 1701:
                var p = pointer
                quantity = readASN1Integer(ptr: &p, maxLength: length)
            case 1702:
                var p = pointer
                productIdentifier = readASN1String(ptr: &p, maxLength: length)
            case 1703:
                var p = pointer
                transactionIdentifer = readASN1String(ptr: &p, maxLength: length)
            case 1705:
                var p = pointer
                originalTransactionIdentifier = readASN1String(ptr: &p, maxLength: length)
            case 1704:
                var p = pointer
                purchaseDate = readASN1Date(ptr: &p, maxLength: length)
            case 1706:
                var p = pointer
                originalPurchaseDate = readASN1Date(ptr: &p, maxLength: length)
            case 1708:
                var p = pointer
                subscriptionExpirationDate = readASN1Date(ptr: &p, maxLength: length)
            case 1712:
                var p = pointer
                subscriptionCancellationDate = readASN1Date(ptr: &p, maxLength: length)
            case 1711:
                var p = pointer
                webOrderLineId = readASN1Integer(ptr: &p, maxLength: length)
            default:
                break
            }
            
            pointer = pointer!.advanced(by: length)
        }
    }
}
