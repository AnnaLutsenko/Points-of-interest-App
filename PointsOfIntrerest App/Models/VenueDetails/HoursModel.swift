//
//  HoursModel.swift
//  PointsOfIntrerest App
//
//  Created by Anna on 8/5/18.
//  Copyright © 2018 Anna. All rights reserved.
//

import Foundation

struct Timeframe: Codable {
    struct Open: Codable {
        var renderedTime: String
        enum CodingKeys: String, CodingKey {
            case renderedTime
        }
    }
    
    let includesToday: Bool?
    let days: String
    let open: [Open]
    
    enum CodingKeys: String, CodingKey {
        case includesToday, days, open
    }
}

struct HoursModel: Codable {
    let status: String
    let isOpen: Bool
    let timeframes: [Timeframe]
    
    enum CodingKeys: String, CodingKey {
        case status, isOpen, timeframes
    }
}
