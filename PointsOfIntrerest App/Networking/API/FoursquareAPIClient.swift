//
//  FoursquareAPIClient.swift
//  PointsOfIntrerest App
//
//  Created by Anna on 8/5/18.
//  Copyright © 2018 Anna. All rights reserved.
//

import Foundation
import Alamofire

class FoursquareAPIClient: APIClient {
    private struct Keys {
        static let version = "v"
        static let clientId = "client_id"
        static let clientSecret = "client_secret"
    }
    
    private let apiKey: APIKey.Type
    
    init(apiKey: APIKey.Type = FoursquareAPIKey.self) {
        self.apiKey = apiKey
        super.init(baseURL: apiKey.baseURL)
    }
    
    func withParams(_ params: [String : Any]) -> Self {
        self.addParams(params)
        return self
    }
    
    override func run() -> DataRequest {
        self.addParams(
            [
                Keys.version: apiKey.version,
                Keys.clientId: apiKey.clientId,
                Keys.clientSecret: apiKey.clientSecret
            ]
        )
        return super.run()
    }
    
}
