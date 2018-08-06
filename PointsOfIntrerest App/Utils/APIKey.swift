//
//  Auth.swift
//  PointsOfIntrerest App
//
//  Created by Anna on 8/5/18.
//  Copyright © 2018 Anna. All rights reserved.
//

import Foundation

protocol APIKey {
    static var clientId: String { get }
    static var clientSecret: String { get }
    static var baseURL: String { get }
    static var version: String { get }
}

struct FoursquareAPIKey: APIKey {
    
    #if DEBUG
    static var clientId: String = "KC10KK1YPL0KVMZRKALGZQR2F0XZIRZ2KSRC1T2ACLWYWKEM"
    static var clientSecret: String = "MYS4IKXUFAT0OIIE4LG22QL5NKPTVUPOEWFEIDD0PEPZ3VKU"
    static var baseURL: String = "https://api.foursquare.com/v2/"
    static var version: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        return dateFormatter.string(from: Date())
    }
    #else
    
    #endif
    
}
