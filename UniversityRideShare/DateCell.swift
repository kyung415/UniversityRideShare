//
//  DateCell.swift
//  UniversityRideShare
//
//  Created by Kyung Lee on 1/6/17.
//  Copyright © 2017 Kyung Lee. All rights reserved.
//

import Foundation
import UIKit

class DateCell : UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.whiteColor()
        setupViews()
    }
    
    let dateTimePicker : UIDatePicker = {
        let dateTime = UIDatePicker()
        //dateTime.hidden = true
        dateTime.translatesAutoresizingMaskIntoConstraints = false
        return dateTime
    }()
    
    func setupViews() {
        addSubview(dateTimePicker)
        
        addConstraint(NSLayoutConstraint(item: dateTimePicker, attribute: .Top, relatedBy: .Equal, toItem: self, attribute: .Top, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: dateTimePicker, attribute: .Bottom, relatedBy: .Equal, toItem: self, attribute: .Bottom, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: dateTimePicker, attribute: .Left, relatedBy: .Equal, toItem: self, attribute: .Left, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: dateTimePicker, attribute: .Right, relatedBy: .Equal, toItem: self, attribute: .Right, multiplier: 1, constant: 0))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}