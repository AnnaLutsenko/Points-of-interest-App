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
    private (set) var requestURL: String
    private (set) var requestParams: [String : Any] = [ : ]
    private (set) var requestMethod: HTTPMethod = .get
    
    init(baseURL: String) {
        self.requestURL = baseURL
    }
    
    @discardableResult func addEndpoint(_ endpoint: String, isFinal: Bool = false) -> String {
        self.requestURL += endpoint + (!isFinal ? "/" : "")
        return self.requestURL
    }
    
    @discardableResult func addParams(_ params: [String : Any]) -> [String : Any] {
        self.requestParams.merge(params) { $1 }
        return self.requestParams
    }
    
    func get() -> Self {
        self.requestMethod = .get
        return self
    }
    
    func post() -> Self {
        self.requestMethod = .post
        return self
    }
    
    func run() -> DataRequest {
        return Alamofire.request(self.requestURL,
                                 method: self.requestMethod,
                                 parameters: self.requestParams)
    }
}
