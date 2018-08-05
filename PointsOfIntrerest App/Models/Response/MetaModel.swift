//
//  MetaModel.swift
//  PointsOfIntrerest App
//
//  Created by Anna on 8/5/18.
//  Copyright © 2018 Anna. All rights reserved.
//

import Foundation

struct MetaModel: Codable {
    let code: Int
    let requestId: String
    
    enum CodingKeys: String, CodingKey {
        case code, requestId
    }
}
