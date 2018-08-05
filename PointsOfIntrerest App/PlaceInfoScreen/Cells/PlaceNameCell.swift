//
//  PlaceNameCell.swift
//  PointsOfIntrerest App
//
//  Created by Anna on 8/5/18.
//  Copyright © 2018 Anna. All rights reserved.
//

import UIKit

struct DisplayName: DisplayObject {
    var name: String
    var rating: String?
    var color: UIColor?
    
    init?(venue: Venue) {
        self.name = venue.model.name
        
        if let rating = venue.rating {
            self.rating = String(rating)
        } else {
            self.rating = nil 
        }
        self.color = venue.ratingColor
    }
}

class PlaceNameCell: DisplayObjectCell <DisplayName> {
    static let reuseID = String(describing: PlaceNameCell.self)
    
    let nameLbl: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let ratingLbl: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //
        contentView.addSubview(nameLbl)
        contentView.addSubview(ratingLbl)
        setConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func displayData(_ displayObj: DisplayName) {
        nameLbl.text = displayObj.name
        ratingLbl.text = displayObj.rating
        ratingLbl.textColor = displayObj.color
    }
    
    //MARK: - Set Constraints
    private func setConstraints() {
        
        let views: [String: Any] = ["nameLbl": nameLbl,
                                    "ratingLbl": ratingLbl]
        var allConstraints: [NSLayoutConstraint] = []
        
        let metrics = ["padding": 8.0,
                       "textWidth": UIScreen.main.bounds.size.width - 16]
        
        let centerXConstraint = NSLayoutConstraint(
            item: nameLbl,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .centerX,
            multiplier: 1, constant: 0
        )
        
        let centerXConstraint2 = NSLayoutConstraint(
            item: ratingLbl,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .centerX,
            multiplier: 1, constant: 0
        )
        
        let summaryVerticalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-8-[nameLbl]-[ratingLbl]-8-|",
            metrics: metrics,
            views: views)
        //
        allConstraints.append(centerXConstraint2)
        allConstraints.append(centerXConstraint)
        allConstraints += summaryVerticalConstraints
        contentView.addConstraints(allConstraints)
    }
}
