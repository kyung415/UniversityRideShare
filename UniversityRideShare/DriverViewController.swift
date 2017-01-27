//
//  DriverViewController.swift
//  UniversityRideShare
//
//  Created by Kyung Lee on 12/29/16.
//  Copyright © 2016 Kyung Lee. All rights reserved.
//

import UIKit

class DriverViewController: UIViewController {
    
    var log1 : LoginInfo?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blueColor()
        setupViews()
        
    }
    
    let dateLabel : UILabel = {
        let date = UILabel()
        return date
    }()
    
    let nextButton : UIButton = {
        let next = UIButton()
        return next
    }()
    
    func setupViews() {
        self.view.addSubview(dateLabel)
        self.view.addSubview(nextButton)
        
        nextButton.addTarget(self, action: #selector(self.nextButtonPressed), forControlEvents: .TouchUpInside)
        
        //nextButton constraints
        
        
    }
    
    func nextButtonPressed() {
        //let hi : String = "hi"
//        let entry = ["User": self.userID2, "Date": self.dateOfRide.text!, "From Location": self.fromLocation.text!, "To Location": self.toLocation.text!, "Round Trip": self.roundTrip.text!, "Cost of Trip": self.costOfTrip.text!, "Pickup Location": self.pickupLocation.text!, "Dropoff Location": self.dropOffLocation.text!, "Number of Seats": self.numOfSeats.text!, "Pickup Time": self.timeOfPickup.text!]
//        var myString = String(arc4random())
//        self.ref.child("Driver Post").child(myString).setValue(entry)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
