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
    static var clientId: String = "2Z1HHJDE2H5EWV5AWTF4PXBIOBLQTXVLEDQI41T2UGAL3SQF"
    static var clientSecret: String = "AFHHTVRWP0YPHAFYO1NBFWCAXW0CJRY2GCRXWSBCOZWLEVBN"
    static var baseURL: String = "https://api.foursquare.com/v2/"
    static var version: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        return dateFormatter.string(from: Date())
    }
    #else
    
    #endif
    
}
