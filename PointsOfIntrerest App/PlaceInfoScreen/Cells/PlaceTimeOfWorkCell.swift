//
//  PlaceTimeOfWorkCell.swift
//  PointsOfIntrerest App
//
//  Created by Anna on 8/5/18.
//  Copyright © 2018 Anna. All rights reserved.
//

import UIKit

struct DisplayTimeOfWork: DisplayObject {
    var time: String?
    
    init?(venue: Venue) {
        self.time = venue.isOpenTitle
    }
}

class PlaceTimeOfWorkCell: DisplayObjectCell <DisplayTimeOfWork> {
    static let reuseID = String(describing: PlaceTimeOfWorkCell.self)
    
    let timeLbl: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = .black
        label.textAlignment = .left
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
    
    override func displayData(_ displayObj: DisplayTimeOfWork) {
        timeLbl.text = displayObj.time
    }
    
    //MARK: - Set Constraints
    private enum Metrics {
        static let padding: CGFloat = 8.0
        static let textWidth: CGFloat = UIScreen.main.bounds.size.width - 16
    }
    
    private func setTimeConstraints() {
        let views: [String: Any] = ["timeLbl": timeLbl]
        var allConstraints: [NSLayoutConstraint] = []
        //
        let metrics = [
            "padding": Metrics.padding,
            "textWidth": Metrics.textWidth]
        //
        let topRowHorizontalFormat = "H:|-padding-[timeLbl(textWidth)]-padding-|"
        
        let topRowHorizontalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: topRowHorizontalFormat,
            options: [.alignAllCenterY],
            metrics: metrics,
            views: views)
        allConstraints += topRowHorizontalConstraints
        //
        let summaryHorizontalConstraints = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-16-[timeLbl]-padding-|",
            metrics: metrics,
            views: views)
        allConstraints += summaryHorizontalConstraints
        //
        NSLayoutConstraint.activate(allConstraints)
    }
}
