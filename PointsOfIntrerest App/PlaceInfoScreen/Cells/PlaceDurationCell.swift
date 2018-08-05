//
//  PlaceDurationCell.swift
//  PointsOfIntrerest App
//
//  Created by Anna on 8/5/18.
//  Copyright © 2018 Anna. All rights reserved.
//

import UIKit

struct DisplayDurationOfTrip: DisplayObject {
    var durationTime: String
}

class PlaceDurationCell: DisplayObjectCell <DisplayDurationOfTrip> {
    static let reuseID = String(describing: PlaceDurationCell.self)
    
    let timeLbl: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .black
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //
        contentView.addSubview(timeLbl)
        setTimeConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func displayData(_ displayObj: DisplayDurationOfTrip) {
        timeLbl.text = displayObj.durationTime
    }
    
    //MARK: - Set Constraints
    func setTimeConstraints() {
        let views: [String: Any] = ["timeLbl": timeLbl]
        var allConstraints: [NSLayoutConstraint] = []
        
        let metrics = ["padding": 16.0,
                       "textWidth": UIScreen.main.bounds.size.width - 32]
        let topRowHorizontalFormat = "H:|-16-[timeLbl(textWidth)]-16-|"
        
        let topRowHorizontalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: topRowHorizontalFormat,
            options: [.alignAllCenterY],
            metrics: metrics,
            views: views)
        allConstraints += topRowHorizontalConstraints
        
        let summaryHorizontalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-8-[timeLbl]-8-|",
            metrics: metrics,
            views: views)
        allConstraints += summaryHorizontalConstraints
        //
        NSLayoutConstraint.activate(allConstraints)

    }
}
