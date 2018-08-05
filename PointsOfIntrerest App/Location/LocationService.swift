//
//  LocationService.swift
//  PointsOfIntrerest App
//
//  Created by Anna on 8/5/18.
//  Copyright © 2018 Anna. All rights reserved.
//

import Foundation
import CoreLocation

private extension CLLocationManager {
    var isAuthorized: Bool {
        return CLLocationManager.authorizationStatus() == .authorizedAlways || CLLocationManager.authorizationStatus() == .authorizedWhenInUse
    }
}

class LocationService: NSObject {
    let locationManager: CLLocationManager
    
    var locationUpdated: ((CLLocationCoordinate2D) -> Void)?
    
    var lastCoordinate: CLLocationCoordinate2D? {
        return locationManager.location?.coordinate
    }
    
    init(locationManager: CLLocationManager = CLLocationManager()) {
        self.locationManager = locationManager
        super.init()
        self.locationManager.delegate = self
        if CLLocationManager.authorizationStatus() == .notDetermined {
            self.locationManager.requestWhenInUseAuthorization()
        }
        
        if self.locationManager.isAuthorized {
            self.locationManager.startUpdatingLocation()
        }
    }
}

extension LocationService: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let loc = locations.first else { return }
        self.locationUpdated?(loc.coordinate)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if manager.isAuthorized {
            manager.startUpdatingLocation()
        }
    }
}
