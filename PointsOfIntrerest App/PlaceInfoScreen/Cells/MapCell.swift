//
//  MapCell.swift
//  PointsOfIntrerest App
//
//  Created by Anna on 8/4/18.
//  Copyright © 2018 Anna. All rights reserved.
//

import UIKit
import GoogleMaps

class MapCell: UITableViewCell {
    static let reuseID = String(describing: MapCell.self)

    let mapView: GMSMapView = {
        let map = GMSMapView()
        return map
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(mapView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //
        setMapViewConstraints()
    }
    
    //MARK: - Set Constraints
    private func setMapViewConstraints() {
        
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
        //
        contentView.addConstraints([leadingConstraint, trailingConstraint, topConstraint, bottomConstraint])
    }
}
