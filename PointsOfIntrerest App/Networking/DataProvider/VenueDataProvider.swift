//
//  VenueDataProvider.swift
//  PointsOfIntrerest App
//
//  Created by Anna on 8/5/18.
//  Copyright © 2018 Anna. All rights reserved.
//

import Foundation
import CoreLocation

class VenueDataProvider {
    private struct Keys {
        static let ll = "ll"
        static let query = "query"
        static let intent = "intent"
        static let global = "global"
    }
    
    enum Result<T> {
        case success(T)
        case failure(Error)
    }
    
    func searchVenues(query: String?, location: CLLocationCoordinate2D?, completion: @escaping ( (Result<[Venue]>) -> Void) ) {
        var params: [String : Any] = [ : ]
        
        query.flatMap { params[Keys.query] = $0 }
        if let coords = location {
            params[Keys.ll] = String(format: "%f,%f", coords.latitude, coords.longitude)
        } else {
            params[Keys.intent] = Keys.global
        }
        
        VenueAPIClient()
            .get()
            .venues()
            .search(params: params)
            .run()
            .validate(statusCode: 200..<300)
            .responseData { (response) in
                switch response.result {
                case .success(let data):
                    do {
                        let venuesResponse = try JSONDecoder().decode(FoursquareResponse<VenueSearchWrapper>.self, from: data)
                        let venues = venuesResponse.response.venues.map { Venue(model: $0) }
                        
                        completion(.success(venues))
                    } catch let error {
                        completion(.failure(error))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
    func getVenueDetails(venueId: String, completion: @escaping ( (Result<Venue>) -> Void) ) {
        VenueAPIClient()
            .get()
            .venues(venueId)
            .run()
            .validate(statusCode: 200..<300)
            .responseData { (response) in
                switch response.result {
                case .success(let data):
                    do {
                        debugPrint(String(data: data, encoding: .utf8)!)
                        let venueResponse = try JSONDecoder().decode(FoursquareResponse<VenueDetailsWrapper>.self, from: data)
                        let venue = Venue(model: venueResponse.response.venue)
                        
                        completion(Result.success(venue))
                    } catch let error {
                        completion(Result.failure(error))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
    
}
