//
//  MapCell.swift
//  PointsOfIntrerest App
//
//  Created by Anna on 8/4/18.
//  Copyright © 2018 Anna. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation

struct DisplayMap: DisplayObject {
    var name: String
    var coordinate: CLLocationCoordinate2D
    
    init?(venue: Venue) {
        self.name = venue.model.name
        self.coordinate = venue.location
    }
}

class MapCell: DisplayObjectCell <DisplayMap> {
    static let reuseID = String(describing: MapCell.self)
    
    let screenWidth = UIScreen.main.bounds.width

    let mapView: GMSMapView = {
        let map = GMSMapView()
        return map
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //
        contentView.addSubview(mapView)
        setMapViewConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func displayData(_ displayObj: DisplayMap) {
        mapView.clear()
        let marker = GMSMarker(position: displayObj.coordinate)
        marker.title = displayObj.name
        marker.map = mapView
        let camera = GMSCameraPosition.camera(withLatitude: displayObj.coordinate.latitude, longitude: displayObj.coordinate.longitude, zoom: 16)
        mapView.camera = camera
    }
    
    //MARK: - Set Constraints
    private func setMapViewConstraints() {
        mapView.translatesAutoresizingMaskIntoConstraints = false 
        let views: [String: Any] = ["mapView": mapView]
        var allConstraints: [NSLayoutConstraint] = []
        
        let metrics = ["padding":0,
                       "screenWidth": UIScreen.main.bounds.width]
        let horizontal = NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-[mapView]-|",
            metrics: metrics,
            views: views)
        let vertical = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-[mapView(screenWidth)]-|",
            metrics: metrics,
            views: views)
        allConstraints += horizontal + vertical
        NSLayoutConstraint.activate(allConstraints)
        
        /*
        let leadingConstraint = NSLayoutConstraint(
            item: mapView,
            attribute: .leading,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .leading,
            multiplier: 1, constant: 0
        )
        
        let trailingConstraint = NSLayoutConstraint(
            item: mapView,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .trailing,
            multiplier: 1, constant: 0
        )
        
        let topConstraint = NSLayoutConstraint(
            item: mapView,
            attribute: .top,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .top,
            multiplier: 1, constant: 0
        )
        
        let bottomConstraint = NSLayoutConstraint(
            item: mapView,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .bottom,
            multiplier: 1, constant: 0
        )
        
        let height = NSLayoutConstraint(
            item: mapView,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1, constant: screenWidth
        )
 
        //
        contentView.addConstraints([leadingConstraint, trailingConstraint, topConstraint, bottomConstraint, height])
 */
    }
}
