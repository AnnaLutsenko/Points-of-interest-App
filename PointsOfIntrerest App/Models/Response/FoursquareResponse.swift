//
//  FoursquareResponse.swift
//  PointsOfIntrerest App
//
//  Created by Anna on 8/5/18.
//  Copyright © 2018 Anna. All rights reserved.
//

import Foundation

struct FoursquareResponse<T: Codable>: Codable {
    let meta: MetaModel
    let response: T
    
    enum CodingKeys: String, CodingKey {
        case meta, response
    }
}
