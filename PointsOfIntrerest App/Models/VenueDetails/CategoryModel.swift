//
//  CategoryModel.swift
//  PointsOfIntrerest App
//
//  Created by Anna on 8/5/18.
//  Copyright © 2018 Anna. All rights reserved.
//

import Foundation

struct Image: Codable {
    let prefix: String
    let suffix: String
    
    enum CodingKeys: String, CodingKey {
        case prefix, suffix
    }
}

struct Category: Codable {
    let id: String
    let name: String
    let pluralName: String
    let shortName: String
    let primary: Bool?
    let icon: Image
    
    enum CodingKeys: String, CodingKey {
        case id, name, pluralName, shortName, primary, icon
    }
}
