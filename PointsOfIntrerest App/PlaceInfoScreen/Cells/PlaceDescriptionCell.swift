//
//  PlaceDescriptionCell.swift
//  PointsOfIntrerest App
//
//  Created by Anna on 8/5/18.
//  Copyright © 2018 Anna. All rights reserved.
//

import UIKit

struct DisplayDescription: DisplayObject {
    var description: String
}

class PlaceDescriptionCell: DisplayObjectCell <DisplayDescription> {
    static let reuseID = String(describing: PlaceDescriptionCell.self)
    
    let descriptionLbl: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //
        contentView.addSubview(descriptionLbl)
        setDescriptionConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func displayData(_ displayObj: DisplayDescription) {
        descriptionLbl.text = displayObj.description
    }

    //MARK: - Set Constraints
    private func setDescriptionConstraints() {
        
        let leadingConstraint = NSLayoutConstraint(
            item: descriptionLbl,
            attribute: .leading,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .leading,
            multiplier: 1, constant: 8
        )
        
        let trailingConstraint = NSLayoutConstraint(
            item: descriptionLbl,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .trailing,
            multiplier: 1, constant: 8
        )
        
        let topConstraint = NSLayoutConstraint(
            item: descriptionLbl,
            attribute: .top,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .top,
            multiplier: 1, constant: 16
        )
        
        let bottomConstraint = NSLayoutConstraint(
            item: descriptionLbl,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .bottom,
            multiplier: 1, constant: 8
        )
        //
        contentView.addConstraints([leadingConstraint, trailingConstraint, topConstraint, bottomConstraint])
    }
}
