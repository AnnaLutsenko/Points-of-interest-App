//
//  GoogleApiClient.swift
//  PointsOfIntrerest App
//
//  Created by Anna on 8/5/18.
//  Copyright © 2018 Anna. All rights reserved.
//

import Foundation
import CoreLocation
import Alamofire

class GoogleApiClient: APIClient {
    enum Endpoint: String {
        case directions, json
    }
    
    struct Keys {
        static let origin = "origin"
        static let destination = "destination"
        static let key = "key"
    }
    
    private let googleKeys: GoogleAPIKeys.Type
    
    init(googleKey: GoogleAPIKeys.Type = GoogleAPIKeys.self) {
        self.googleKeys = googleKey
        super.init(baseURL: googleKey.baseUrl)
    }
    
    func directions(from: CLLocationCoordinate2D, to: CLLocationCoordinate2D) -> Self {
        let originString = String(format: "%f,%f", from.latitude, from.longitude)
        let destinationString = String(format: "%f,%f", to.latitude, to.longitude)
        
        let params = [
            Keys.origin: originString,
            Keys.destination: destinationString
        ]
        
        self.addParams(params)
        
        self.addEndpoint(Endpoint.directions.rawValue)
        return self
    }
    
    func json() -> Self {
        self.addEndpoint(Endpoint.json.rawValue, isFinal: true)
        return self
    }
    
    override func run() -> DataRequest {
        self.addParams(
            [
                Keys.key: googleKeys.key
            ]
        )
        return super.run()
    }
    
}
