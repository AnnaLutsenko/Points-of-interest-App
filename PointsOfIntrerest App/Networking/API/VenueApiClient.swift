//
//  VenueApiClient.swift
//  PointsOfIntrerest App
//
//  Created by Anna on 8/5/18.
//  Copyright © 2018 Anna. All rights reserved.
//

import Foundation

class VenueAPIClient: APIClient {
    enum Endpoint: String {
        case venues, search
    }
    
    func venues(_ id: String? = nil) -> Self {
        self.addEndpoint(.venues)
        if let venueId = id {
            self.addEndpoint(venueId, isFinal: true)
        }
        return self
    }
    
    func search(params: [String : Any]) -> Self {
        self.addEndpoint(.search, isFinal: true)
        self.addParams(params)
        return self
    }
    
    @discardableResult func addEndpoint(_ endpoint: Endpoint, isFinal: Bool = false) -> String {
        return self.addEndpoint(endpoint.rawValue, isFinal: isFinal)
    }
}
