//
//  APIClient.swift
//  PointsOfIntrerest App
//
//  Created by Anna on 8/5/18.
//  Copyright © 2018 Anna. All rights reserved.
//

import Foundation
import Alamofire

class APIClient {
    private struct Keys {
        static let version = "v"
        static let clientId = "client_id"
        static let clientSecret = "client_secret"
    }
    
    private let apiKey: APIKey.Type
    
    private (set) var requestURL: String
    private (set) var requestParams: [String : Any] = [ : ]
    private (set) var requestMethod: HTTPMethod = .get
    
    init(apiKey: APIKey.Type = FoursquareAPIKey.self) {
        self.apiKey = apiKey
        self.requestURL = apiKey.baseURL
    }
    
    func get() -> Self {
        self.requestMethod = .get
        return self
    }
    
    func post() -> Self {
        self.requestMethod = .post
        return self 
    }
    
    @discardableResult func addEndpoint(_ endpoint: String, isFinal: Bool = false) -> String {
        self.requestURL += endpoint + (!isFinal ? "/" : "")
        return self.requestURL
    }
    
    @discardableResult func addParams(_ params: [String : Any]) -> [String : Any] {
        self.requestParams.merge(params) { $1 }
        return self.requestParams
    }
    
    func withParams(_ params: [String : Any]) -> Self {
        self.addParams(params)
        return self
    }
    
    func run() -> DataRequest {
        self.addParams(
            [
                Keys.version: apiKey.version,
                Keys.clientId: apiKey.clientId,
                Keys.clientSecret: apiKey.clientSecret
            ]
        )
        return Alamofire.request(self.requestURL,
                                 method: self.requestMethod,
                                 parameters: self.requestParams)
    }
    
}
