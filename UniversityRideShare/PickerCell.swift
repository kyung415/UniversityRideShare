//
//  PickerCell.swift
//  UniversityRideShare
//
//  Created by Kyung Lee on 1/3/17.
//  Copyright © 2017 Kyung Lee. All rights reserved.
//

import Foundation
import UIKit

class PickerCell : UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.blueColor()
        setupViews()
    }
    
    let dateLabel : UILabel = {
        let date = UILabel()
        
        return date
    }()
    
    func setupViews() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}