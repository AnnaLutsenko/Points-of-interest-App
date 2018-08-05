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

    let nameLbl: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let addressLbl: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //
        contentView.addSubview(photoImgView)
        contentView.addSubview(nameLbl)
        contentView.addSubview(addressLbl)
        //
        setImgViewConstraints()
//        setTitleLblConstraints()
        setSubTitleLblConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: - Set Constraints
    private func setImgViewConstraints() {
        /*
        let leadingConstraint = NSLayoutConstraint(
            item: photoImgView,
            attribute: .leading,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .leading,
            multiplier: 1, constant: 16
        )
 */
        
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
        contentView.addConstraints([verticalConstraint, widthConstraint, heightConstraint])
    }

    private func setTitleLblConstraints() {
        
        let leadingConstraint = NSLayoutConstraint(
            item: nameLbl,
            attribute: .leading,
            relatedBy: .equal,
            toItem: photoImgView,
            attribute: .trailing,
            multiplier: 1, constant: 8
        )
        
        let trailingConstraint = NSLayoutConstraint(
            item: nameLbl,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .trailing,
            multiplier: 1, constant: 8
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
        contentView.addConstraints([leadingConstraint, topConstraint, trailingConstraint])
    }
    
    private func setSubTitleLblConstraints() {
        let views: [String: Any] = ["nameLbl": nameLbl,
                                    "addressLbl": addressLbl,
                                    "photoImgView" : photoImgView]
        var allConstraints: [NSLayoutConstraint] = []
        
        let metrics = ["padding": 8.0,
                       "textWidth": UIScreen.main.bounds.size.width - 16]
        
        let topRowHorizontalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-[photoImgView]-[nameLbl(textWidth)]-|",
            metrics: metrics,
            views: views)
        allConstraints += topRowHorizontalConstraints
        
        let summaryHorizontalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-[nameLbl]-[addressLbl]-|",
            metrics: metrics,
            views: views)
        allConstraints += summaryHorizontalConstraints
        
        let leading = NSLayoutConstraint(
            item: addressLbl,
            attribute: .leading,
            relatedBy: .equal,
            toItem: nameLbl,
            attribute: .leading,
            multiplier: 1, constant: 0
        )
        
        let trailing = NSLayoutConstraint(
            item: addressLbl,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: contentView,
            attribute: .trailing,
            multiplier: 1, constant: 0
        )
        
        allConstraints += [leading, trailing]
        
        NSLayoutConstraint.activate(allConstraints)
    }
}
