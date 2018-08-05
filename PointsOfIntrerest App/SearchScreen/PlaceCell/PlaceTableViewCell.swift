//
//  PlaceTableViewCell.swift
//  PointsOfIntrerest App
//
//  Created by Anna on 8/4/18.
//  Copyright © 2018 Anna. All rights reserved.
//

import UIKit

class PlaceTableViewCell: UITableViewCell {
    static let reuseID = String(describing: PlaceTableViewCell.self)
    
    let photoImgView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 32
        img.clipsToBounds = true
        return img
    }()

    let titleLbl: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subTitleLbl: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //
        contentView.addSubview(photoImgView)
        contentView.addSubview(titleLbl)
        contentView.addSubview(subTitleLbl)
        //
        setImgViewConstraints()
        setTitleLblConstraints()
        setSubTitleLblConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: - Set Constraints
    private func setImgViewConstraints() {
        
        let leadingConstraint = NSLayoutConstraint(
            item: photoImgView,
            attribute: .leading,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .leading,
            multiplier: 1, constant: 16
        )
        
        let verticalConstraint = NSLayoutConstraint(
            item: photoImgView,
            attribute: .centerY,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .centerY,
            multiplier: 1, constant: 0
        )
        
        let widthConstraint = NSLayoutConstraint(
            item: photoImgView,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1, constant: 62
        )
        
        let heightConstraint = NSLayoutConstraint(
            item: photoImgView,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1, constant: 62
        )
        //
        contentView.addConstraints([leadingConstraint, verticalConstraint, widthConstraint, heightConstraint])
    }

    private func setTitleLblConstraints() {
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        
        let leadingConstraint = NSLayoutConstraint(
            item: titleLbl,
            attribute: .leading,
            relatedBy: .equal,
            toItem: photoImgView,
            attribute: .trailing,
            multiplier: 1, constant: 8
        )
        
        let topConstraint = NSLayoutConstraint(
            item: titleLbl,
            attribute: .top,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .top,
            multiplier: 1, constant: 16
        )
        //
        contentView.addConstraints([leadingConstraint, topConstraint])
    }
    
    private func setSubTitleLblConstraints() {
        
        let leadingConstraint = NSLayoutConstraint(
            item: subTitleLbl,
            attribute: .leading,
            relatedBy: .equal,
            toItem: photoImgView,
            attribute: .trailing,
            multiplier: 1, constant: 8
        )
        
        let topConstraint = NSLayoutConstraint(
            item: subTitleLbl,
            attribute: .top,
            relatedBy: .equal,
            toItem: titleLbl,
            attribute: .bottom,
            multiplier: 1, constant: 8
        )
        //
        contentView.addConstraints([leadingConstraint, topConstraint])
    }
}
