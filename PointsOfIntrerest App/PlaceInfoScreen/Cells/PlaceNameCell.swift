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
    var rating: String
    var color: UIColor
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
        
        contentView.addSubview(nameLbl)
        contentView.addSubview(ratingLbl)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //
        setNameConstraints()
        setRatingConstraints()
    }
    
    override func displayData(_ displayObj: DisplayName) {
        nameLbl.text = displayObj.name
        ratingLbl.text = displayObj.rating
        ratingLbl.textColor = displayObj.color
    }
    
    //MARK: - Set Constraints
    private func setNameConstraints() {
        
        let centerXConstraint = NSLayoutConstraint(
            item: nameLbl,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .centerX,
            multiplier: 1, constant: 0
        )
        
        let topConstraint = NSLayoutConstraint(
            item: nameLbl,
            attribute: .top,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .top,
            multiplier: 1, constant: 8
        )
        //
        contentView.addConstraints([centerXConstraint, topConstraint])
    }
    
    private func setRatingConstraints() {
        
        let centerXConstraint = NSLayoutConstraint(
            item: ratingLbl,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .centerX,
            multiplier: 1, constant: 0
        )
        
        let topConstraint = NSLayoutConstraint(
            item: ratingLbl,
            attribute: .top,
            relatedBy: .equal,
            toItem: nameLbl,
            attribute: .bottom,
            multiplier: 1, constant: 8
        )
        //
        contentView.addConstraints([centerXConstraint, topConstraint])
    }

}
