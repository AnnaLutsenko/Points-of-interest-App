//
//  PhotoGroup.swift
//  PointsOfIntrerest App
//
//  Created by Anna on 8/5/18.
//  Copyright © 2018 Anna. All rights reserved.
//

import Foundation

struct PhotoGroupWrapper: Codable {
    let count: Int
    let groups: [PhotoGroup]
    
    enum CodingKeys: String, CodingKey {
        case count, groups
    }
}

struct PhotoGroup: Codable {
    let type: String
    let name: String
    let count: Int
    let items: [Photo]
    
    enum CodingKeys: String, CodingKey {
        case type, name, count, items
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(String.self, forKey: .type)
        self.name = try container.decode(String.self, forKey: .name)
        self.count = try container.decode(Int.self, forKey: .count)
        
        do {
            self.items = try container.decode([Photo].self, forKey: .items)
        } catch {
            let itemsDict = try container.decode( [ [String : Photo] ].self, forKey: .items)
            
            self.items = itemsDict.map {
                $0.map { $0.value }
            }.reduce([Photo]()) { $0 + $1 }
        }
        
    }
}
