//
//  TextCell.swift
//  PointsOfIntrerest App
//
//  Created by Anna on 8/4/18.
//  Copyright © 2018 Anna. All rights reserved.
//

import UIKit


class TextCell: UITableViewCell {
    static let reuseID = String(describing: TextCell.self)
    
    enum TextStyle {
        case name
        case description
        case timeOfWork
        case duration
    }
    
    private var style: TextStyle = .description
    private var textForCell: String? {
        didSet {
            textLabel?.text = textForCell
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
    }
    
    
    func set(text: String, with style: TextStyle) {
        textLabel?.text = text
        
        switch style {
        case .name:
            textLabel?.font = UIFont.boldSystemFont(ofSize: 18)
            textLabel?.textAlignment = .center
        case .description:
            textLabel?.font = UIFont.systemFont(ofSize: 17)
            textLabel?.textAlignment = .left
        case .timeOfWork:
            textLabel?.font = UIFont.boldSystemFont(ofSize: 17)
            textLabel?.textAlignment = .left
        case .duration:
            textLabel?.font = UIFont.systemFont(ofSize: 17)
            textLabel?.textAlignment = .left
        }
    }
}
