//
//  Test.swift
//  UniversityRideShare
//
//  Created by Kyung Lee on 12/26/16.
//  Copyright © 2016 Kyung Lee. All rights reserved.
//

import UIKit
import Foundation

class Test: UIViewController {
    var hi = "hi"
    override func viewDidLoad() {
        view.backgroundColor = UIColor.blueColor()
        navigationItem.title = "UniRide"
        setupViews()
    }
    
    let testLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = UIColor.redColor()
        return label
    }()
    
    let button : UIButton = {
        let butt = UIButton()
        butt.translatesAutoresizingMaskIntoConstraints = false
        butt.backgroundColor = UIColor.greenColor()
        return butt
    }()
    
    
    func setupViews() {
        
        //self.view.addSubview(testLabel) userButton.addTarget(self, action: #selector(DriverRiderViewController.riderButtonPressed), forControlEvents: .TouchUpInside)
        self.view.addSubview(button)
        button.addTarget(self, action: #selector(Test.buttonPressed), forControlEvents: .TouchUpInside)
        
        self.view.addConstraint(NSLayoutConstraint(item: button, attribute: .Top, relatedBy: .Equal, toItem: self.view, attribute: .Top, multiplier: 1, constant: 100))
        self.view.addConstraint(NSLayoutConstraint(item: button, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1, constant: 10))
        self.view.addConstraint(NSLayoutConstraint(item: button, attribute: .Right, relatedBy: .Equal, toItem: self.view, attribute: .Right, multiplier: 1, constant: -10))
        self.view.addConstraint(NSLayoutConstraint(item: button, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0, constant: 100))
        
        
    }
    
    func buttonPressed() {
        let log = LoginInfo()
        log.loginName = "Kyung Lee"
        print(log.loginName!)
        let filter = FiltersViewController()
        //filter.addLoginStuff(log)
        navigationController?.setViewControllers([filter], animated: true)
        //navigationController?.pushViewController(filter, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
