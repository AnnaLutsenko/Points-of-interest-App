//
//  PhotoModel.swift
//  PointsOfIntrerest App
//
//  Created by Anna on 8/5/18.
//  Copyright © 2018 Anna. All rights reserved.
//

import Foundation

struct Photo: Codable {
    let id: String
    let createdAt: TimeInterval
    let prefix: String
    let suffix: String
    let width: Int
    let height: Int
    
    enum CodingKeys: String, CodingKey {
        case id, createdAt, prefix, suffix, width, height
    }
}
