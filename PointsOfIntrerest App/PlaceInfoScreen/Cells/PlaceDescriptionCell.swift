//
//  PlaceDescriptionCell.swift
//  PointsOfIntrerest App
//
//  Created by Anna on 8/5/18.
//  Copyright © 2018 Anna. All rights reserved.
//

import UIKit

struct DisplayDescription: DisplayObject {
    var description: String?
    
    init?(venue: Venue) {
        self.description = venue.model.description
    }
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
        let views: [String: Any] = ["descriptionLbl": descriptionLbl]
        var allConstraints: [NSLayoutConstraint] = []
        //
        let metrics = [
            "padding": 8,
            "textWidth": UIScreen.main.bounds.size.width - 32]
        //
        let topRowHorizontalFormat = "H:|-8-[descriptionLbl(textWidth)]-8-|"
        
        let topRowHorizontalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: topRowHorizontalFormat,
            options: [.alignAllCenterY],
            metrics: metrics,
            views: views)
        allConstraints += topRowHorizontalConstraints
        //
        let summaryHorizontalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-16-[descriptionLbl]-8-|",
            metrics: metrics,
            views: views)
        allConstraints += summaryHorizontalConstraints
        //
        NSLayoutConstraint.activate(allConstraints)
    }
}
