//
//  SubscriptionMessage.swift
//  CoinbaseSocketSwift
//
//  Created by Hani Shabsigh on 10/29/17.
//  Copyright © 2017 Hani Shabsigh. All rights reserved.
//

import Foundation

open class SubscriptionMessage {
    
    public let channels: [Channel]
    public let productIds: [ProductId]
    
    public init(channels:[Channel], productIds:[ProductId]) {
        self.channels = channels
        self.productIds = productIds
    }
    
    open func subscribeJSON(type: MessageType, channels:[Channel], productIds:[ProductId]) -> [String : Any] {
        let channels = self.channels.map { $0.rawValue }
        let productIds = self.productIds.map { $0.rawValue }
        
        var json = [String:Any]()
        json["type"] = type.rawValue
        json["product_ids"] = productIds
        json["channels"] = channels
        return json
    }
}
