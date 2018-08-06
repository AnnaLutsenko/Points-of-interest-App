//
//  DirectionsDataProvider.swift
//  PointsOfIntrerest App
//
//  Created by Anna on 8/5/18.
//  Copyright © 2018 Anna. All rights reserved.
//

import Foundation
import CoreLocation
import Alamofire

class DirectionsDataProvider {
    
    enum Result<T> {
        case success(T)
        case failure(Error)
    }
    
    enum Errors: Error {
        case parseError
    }
    
    func fetchDirections(from: CLLocationCoordinate2D, to: CLLocationCoordinate2D, completion: @escaping ( (Result<String>) -> Void) ) {
        /*
        if let filepath = Bundle.main.url(forResource: "test_route", withExtension: "json") {
            do {
                let data = try Data(contentsOf: filepath)
                
                
                let root = try JSONSerialization.jsonObject(with: data, options: [])
                guard
                    let routes = root as? [String: Any],
                    let r = routes["routes"] as? [[String : Any]],
                    let legs = (r.first?["legs"] as? [[String: Any]])?.first,
                    let duration = legs["duration"] as? [String : Any],
                    let text = duration["text"] as? String
                    else {
                        throw Errors.parseError
                }
                
         completion(.success(text))
         
         } catch {
         completion(.failure(error))
         }
         } else {
         
         }
         
         / */
        GoogleApiClient()
            .get()
            .directions(from: from, to: to)
            .json()
            .run()
            .validate(statusCode: 200..<300)
            .responseData { (response) in
                switch response.result {
                case .success(let data):
                    do {
                        let root = try JSONSerialization.jsonObject(with: data, options: [])
                        guard
                            let routes = root as? [String: Any],
                            let r = routes["routes"] as? [[String : Any]],
                            let legs = (r.first?["legs"] as? [[String: Any]])?.first,
                            let duration = legs["duration"] as? [String : Any],
                            let text = duration["text"] as? String
                            else {
                                throw Errors.parseError
                        }
                        
                        completion(.success(text))
                    } catch let error {
                        completion(.failure(error))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
        }
        //*/
    }
}
