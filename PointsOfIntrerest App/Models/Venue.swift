//
//  Venue.swift
//  PointsOfIntrerest App
//
//  Created by Anna on 8/5/18.
//  Copyright © 2018 Anna. All rights reserved.
//

import UIKit
import CoreLocation

struct Venue {
    let model: VenueModel
    
    init(model: VenueModel) {
        self.model = model
    }
}

// MARK: - Schedule
extension Venue {
    var isOpenTitle: String? {
        return model.hours?.status
    }
    
    var schedule: String? {
        let todaySchedule = model.hours?.timeframes.first(where: { $0.includesToday == true} ) ?? model.hours?.timeframes.first
        let days = todaySchedule?.days
        let time = todaySchedule?.open.first?.renderedTime
        let workingHours = [days, time]
            .compactMap { $0 }
            .reduce("") { $0 + ", " + $1 }
        return !workingHours.isEmpty ? workingHours : nil
    }
}

// MARK: - Icon & Categories
extension Venue {
    enum IconSize: Int {
        case _32 = 32
        case _44 = 44
        case _64 = 64
        case _88 = 88
    }
    
    var categories: [String] {
        return model.categories.map { $0.name }
    }
    
    func categoryIconURL(size: IconSize) -> URL? {
        guard let category = model.categories.first(where: { $0.primary == true }) ?? model.categories.first else {
            return nil
        }
        
        let preffix = category.icon.prefix
        let suffix = category.icon.suffix
        let urlStr = preffix + "\(size.rawValue)" + suffix
        
        return URL(string: urlStr)
    }
}

// MARK: - Photo
extension Venue {
    private var photoModel: Photo? {
        return model.bestPhoto ?? model.photos?.groups.first(where: { !$0.items.isEmpty })?.items.first
    }
    
    var photo: URL? {
        guard let photo = self.photoModel else {
            return nil
        }
        
        let urlString = "\(photo.prefix)\(photo.width)x\(photo.height)\(photo.suffix)"
        return URL(string: urlString)
    }
    
    var photoSize: CGSize? {
        guard let photo = self.photoModel else {
            return nil
        }
        
        return CGSize(width: photo.width, height: photo.height)
    }
}

// MARK: - Rating
extension Venue {
    var rating: Float? {
        return model.rating
    }
    
    var ratingColor: UIColor? {
        // let colorStr = model.ratingColor
        return .black
    }
}

extension Venue {
    var location: CLLocationCoordinate2D {
        let lat = model.location.lat
        let lng = model.location.lng
        
        return CLLocationCoordinate2D(latitude: lat, longitude: lng)
    }
    
    var address: String? {
        return model.location.formattedAddress.first
    }
}
