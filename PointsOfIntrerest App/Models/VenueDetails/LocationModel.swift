//
//  LocationModel.swift
//  PointsOfIntrerest App
//
//  Created by Anna on 8/5/18.
//  Copyright © 2018 Anna. All rights reserved.
//

import Foundation

struct LocationModel: Codable {
    let address: String?
    let crossStreet: String?
    let lat: Double
    let lng: Double
    let formattedAddress: [String]
    
    enum CodingKeys: String, CodingKey {
        case address, crossStreet, lat, lng, formattedAddress
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.address = try? container.decode(String.self, forKey: .address)
        self.crossStreet = try? container.decode(String.self, forKey: .crossStreet)
        self.lat = try container.decode(Double.self, forKey: .lat)
        self.lng = try container.decode(Double.self, forKey: .lng)
        
        do {
            self.formattedAddress = try container.decode([String].self, forKey: .formattedAddress)
        } catch {
            let formattedAddrDict = try container.decode([ [String : String] ].self, forKey: .formattedAddress)
            self.formattedAddress = formattedAddrDict.map {
                $0.map { $0.value }
            }.reduce([String]()) { $0 + $1 }
        }
        
    }
}
