//
//  VenueModel.swift
//  PointsOfIntrerest App
//
//  Created by Anna on 8/5/18.
//  Copyright © 2018 Anna. All rights reserved.
//

import Foundation

struct VenueDetailsWrapper: Codable {
    let venue: VenueModel
    
    enum CodingKeys: String, CodingKey {
        case venue
    }
}

struct VenueSearchWrapper: Codable {
    let venues: [VenueModel]
    
    enum CodingKeys: String, CodingKey {
        case venues
    }
}

struct VenueModel: Codable {
    let id: String
    let name: String
    let location: LocationModel
    let categories: [Category]
    let hours: HoursModel?
    let description: String?
    let rating: Float?
    let ratingColor: String?
    let photos: PhotoGroupWrapper?
    let bestPhoto: Photo?
    
    enum CodingKeys: String, CodingKey {
        case id, description, name, location, categories, hours, rating, ratingColor, photos, bestPhoto
    }
}
