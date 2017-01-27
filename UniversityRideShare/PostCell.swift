//
//  PostCell.swift
//  UniversityRideShare
//
//  Created by Kyung Lee on 12/26/16.
//  Copyright © 2016 Kyung Lee. All rights reserved.
//

import Foundation
import UIKit

class PostCell : UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.whiteColor()
        setupViews()
    }
    let filterBarItem : UIBarButtonItem = {
        let filter = UIBarButtonItem()
        return filter
    }()
    
    let blackBar : UILabel = {
        let bar = UILabel()
        bar.backgroundColor = UIColor.blackColor()
        bar.translatesAutoresizingMaskIntoConstraints = false
        return bar
    }()
    
    let dateLabel : UILabel = {
        let date = UILabel()
        date.backgroundColor = UIColor.darkGrayColor()
        date.translatesAutoresizingMaskIntoConstraints = false
        return date
    }()
    
    let costLabel : UILabel = {
        let labelView = UILabel()
        
        labelView.backgroundColor = UIColor.blueColor()
        labelView.translatesAutoresizingMaskIntoConstraints = false
        
        return labelView
    }()
    
    let profilePicture : UIImageView = {
        let profile = UIImageView()
        profile.backgroundColor = UIColor.redColor()
        profile.layer.cornerRadius = 22
        profile.layer.masksToBounds = true
        profile.translatesAutoresizingMaskIntoConstraints = false
        return profile
    }()
    
    let nameLabel : UILabel = {
        let name = UILabel()
        
        name.backgroundColor = UIColor.brownColor()
        name.translatesAutoresizingMaskIntoConstraints = false
        //label.font = label.font.fontWithSize(20)
        name.font = name.font.fontWithSize(10)
        
        return name
    }()
    
    let ratingLabel : UILabel = {
        let rating = UILabel()
        rating.backgroundColor = UIColor.greenColor()
        rating.translatesAutoresizingMaskIntoConstraints = false
        return rating
    }()
    
    let toLocationLabel : UILabel = {
        let location = UILabel()
        location.backgroundColor = UIColor.cyanColor()
        location.font = location.font.fontWithSize(10)
        
        location.translatesAutoresizingMaskIntoConstraints = false
        return location
    }()
    
    let fromLocationLabel : UILabel = {
        let location = UILabel()
        location.backgroundColor = UIColor.redColor()
        location.font = location.font.fontWithSize(10)
        
        location.translatesAutoresizingMaskIntoConstraints = false
        return location
    }()
    
    func setupViews() {
        addSubview(costLabel)
        addSubview(nameLabel)
        addSubview(profilePicture)
        addSubview(blackBar)
        addSubview(toLocationLabel)
        addSubview(fromLocationLabel)
        addSubview(dateLabel)
        addSubview(ratingLabel)
        //self.bringSubviewToFront(costLabel)
        
        //        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-10-v[0]-10", options: NSLayoutFormatOptions(), metrics: nil, views: ["v[0]": cost]))
        //        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-10-v[0]-10", options: NSLayoutFormatOptions(), metrics: nil, views: ["v[0]": cost]))
        
        addConstraint(NSLayoutConstraint(item: dateLabel, attribute: .Width, relatedBy: .Equal, toItem: self, attribute: .Width, multiplier: 0, constant: 100))
        addConstraint(NSLayoutConstraint(item: dateLabel, attribute: .Right, relatedBy: .Equal, toItem: self, attribute: .Right, multiplier: 1, constant: -5))
        addConstraint(NSLayoutConstraint(item: dateLabel, attribute: .Top, relatedBy: .Equal, toItem: self, attribute: .Top, multiplier: 1, constant: 10))
        addConstraint(NSLayoutConstraint(item: dateLabel, attribute: .Height, relatedBy: .Equal, toItem: self, attribute: .Height, multiplier: 0, constant: 15))
        
        addConstraint(NSLayoutConstraint(item: costLabel, attribute: .Top, relatedBy: .Equal, toItem: dateLabel, attribute: .Bottom, multiplier: 1, constant: 5))
        addConstraint(NSLayoutConstraint(item: costLabel, attribute: .Left, relatedBy: .Equal, toItem: dateLabel, attribute: .Left, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: costLabel, attribute: .Right, relatedBy: .Equal, toItem: dateLabel, attribute: .Right, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: costLabel, attribute: .Height, relatedBy: .Equal, toItem: dateLabel, attribute: .Height, multiplier: 0, constant: 15))
        
        addConstraint(NSLayoutConstraint(item: profilePicture, attribute: .Top, relatedBy: .Equal, toItem: self, attribute: .Top, multiplier: 1, constant: self.frame.height / 3 - 10)) //self.frame.height / 3
        addConstraint(NSLayoutConstraint(item: profilePicture, attribute: .Left, relatedBy: .Equal, toItem: self, attribute: .Left, multiplier: 1, constant: self.frame.width / 2 - 20))
        addConstraint(NSLayoutConstraint(item: profilePicture, attribute: .Right, relatedBy: .Equal, toItem: self, attribute: .Right, multiplier: 1, constant: (self.frame.width / 2 - 20) * -1))
        addConstraint(NSLayoutConstraint(item: profilePicture, attribute: .Height, relatedBy: .Equal, toItem: self, attribute: .Height, multiplier: 0, constant: 40))
        
//
        addConstraint(NSLayoutConstraint(item: nameLabel, attribute: .Top, relatedBy: .Equal, toItem: profilePicture, attribute: .Bottom, multiplier: 1, constant: 5))
        addConstraint(NSLayoutConstraint(item: nameLabel, attribute: .Left, relatedBy: .Equal, toItem: self, attribute: .Left, multiplier: 1, constant: self.frame.width / 2 - 30))
        addConstraint(NSLayoutConstraint(item: nameLabel, attribute: .Right, relatedBy: .Equal, toItem: self, attribute: .Right, multiplier: 1, constant: (self.frame.width / 2 - 30) * -1))
        addConstraint(NSLayoutConstraint(item: nameLabel, attribute: .Height, relatedBy: .Equal, toItem: self, attribute: .Height, multiplier: 0, constant: 15))
        
        addConstraint(NSLayoutConstraint(item: blackBar, attribute: .Top, relatedBy: .Equal, toItem: nameLabel, attribute: .Bottom, multiplier: 1, constant: 10))
        addConstraint(NSLayoutConstraint(item: blackBar, attribute: .Left, relatedBy: .Equal, toItem: self, attribute: .Left, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: blackBar, attribute: .Right, relatedBy: .Equal, toItem: self, attribute: .Right, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: blackBar, attribute: .Height, relatedBy: .Equal, toItem: self, attribute: .Height, multiplier: 0, constant: 0.8))
        
        addConstraint(NSLayoutConstraint(item: fromLocationLabel, attribute: .Top, relatedBy: .Equal, toItem: blackBar, attribute: .Bottom, multiplier: 1, constant: 10))
        addConstraint(NSLayoutConstraint(item: fromLocationLabel, attribute: .Left, relatedBy: .Equal, toItem: self, attribute: .Left, multiplier: 1, constant: self.frame.width / 3 - 10))
        addConstraint(NSLayoutConstraint(item: fromLocationLabel, attribute: .Width, relatedBy: .Equal, toItem: nameLabel, attribute: .Width, multiplier: 0, constant: 40))
        addConstraint(NSLayoutConstraint(item: fromLocationLabel, attribute: .Height, relatedBy: .Equal, toItem: nameLabel, attribute: .Height, multiplier: 0, constant: 15))
        
        addConstraint(NSLayoutConstraint(item: toLocationLabel, attribute: .Top, relatedBy: .Equal, toItem: blackBar, attribute: .Bottom, multiplier: 1, constant: 10))
        addConstraint(NSLayoutConstraint(item: toLocationLabel, attribute: .Right, relatedBy: .Equal, toItem: self, attribute: .Right, multiplier: 1, constant: (self.frame.width / 3 - 10) * -1))
        addConstraint(NSLayoutConstraint(item: toLocationLabel, attribute: .Width, relatedBy: .Equal, toItem: self, attribute: .Width, multiplier: 0, constant: 40))
        addConstraint(NSLayoutConstraint(item: toLocationLabel, attribute: .Height, relatedBy: .Equal, toItem: self, attribute: .Height, multiplier: 0, constant: 15))
//
//        addConstraint(NSLayoutConstraint(item: ratingLabel, attribute: .Left, relatedBy: .Equal, toItem: dateLabel, attribute: .Left, multiplier: 1, constant: 0))
//        addConstraint(NSLayoutConstraint(item: ratingLabel, attribute: .Right, relatedBy: .Equal, toItem: dateLabel, attribute: .Right, multiplier: 1, constant: 0))
//        addConstraint(NSLayoutConstraint(item: ratingLabel, attribute: .Top, relatedBy: .Equal, toItem: dateLabel, attribute: .Bottom, multiplier: 1, constant: 10))
//        addConstraint(NSLayoutConstraint(item: ratingLabel, attribute: .Height, relatedBy: .Equal, toItem: dateLabel, attribute: .Height, multiplier: 0, constant: 15))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}