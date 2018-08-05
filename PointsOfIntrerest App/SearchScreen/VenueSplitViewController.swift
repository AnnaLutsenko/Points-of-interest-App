//
//  VenueSplitViewController.swift
//  PointsOfIntrerest App
//
//  Created by Anna on 8/5/18.
//  Copyright © 2018 Anna. All rights reserved.
//

import UIKit

class VenueSplitViewController: UISplitViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func sentVenueToDetailVC(_ venue: Venue) {
        if let venueVC = viewControllers.last,
            let navVC = venueVC as? UINavigationController,
            let placeInfoVC = navVC.viewControllers.last as? PlaceInfoTableViewController{
            placeInfoVC.venue = venue
            placeInfoVC.fetchData()
        }
    }
}
