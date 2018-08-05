//
//  DisplayObjectCell.swift
//  PointsOfIntrerest App
//
//  Created by Anna on 8/5/18.
//  Copyright © 2018 Anna. All rights reserved.
//

import UIKit

protocol DisplayObject {

}

class DisplayObjectCell <T:DisplayObject> : UITableViewCell {
    
    func displayData(_ displayObj: T) {
        
    }
    
}
