//
//  DriverOrRiderViewController.swift
//  UniversityRideShare
//
//  Created by Kyung Lee on 12/29/16.
//  Copyright © 2016 Kyung Lee. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class DriverOrRiderViewController: UIViewController {

    var log : LoginInfo?
    var ref : FIRDatabaseReference!
    var refHandle : UInt!
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.darkGrayColor()
        setupViews()
        print(log?.loginName!)
        print(log?.userID!)
    }
    
    
    let driverButton : UIButton = {
        let driver = UIButton()
        driver.backgroundColor = UIColor.blueColor()
        driver.setTitle("Driver", forState: UIControlState.Normal)
        driver.translatesAutoresizingMaskIntoConstraints = false
        return driver
    }()
    
    let riderButton : UIButton = {
        let rider = UIButton()
        rider.backgroundColor = UIColor.cyanColor()
        rider.setTitle("Rider", forState: UIControlState.Normal)
        rider.translatesAutoresizingMaskIntoConstraints = false
        return rider
    }()
    //self.view.frame.size.height
    func setupViews() {
        self.view.addSubview(driverButton)
        self.view.addSubview(riderButton)
        
        driverButton.addTarget(self, action: #selector(self.driverButtonPressed), forControlEvents: .TouchUpInside)
        riderButton.addTarget(self, action: #selector(self.riderButtonPressed), forControlEvents: .TouchUpInside)
        
        
        //driverButton constraints
        self.view.addConstraint(NSLayoutConstraint(item: driverButton, attribute: .Top, relatedBy: .Equal, toItem: self.view, attribute: .Top, multiplier: 1, constant: self.navigationController!.navigationBar.frame.size.height + 10))
        self.view.addConstraint(NSLayoutConstraint(item: driverButton, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1, constant: 10))
        self.view.addConstraint(NSLayoutConstraint(item: driverButton, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0, constant: self.view.frame.size.width / 2 - 10))
        self.view.addConstraint(NSLayoutConstraint(item: driverButton, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0, constant: self.view.frame.size.height))
        
        //riderButton constraints
        self.view.addConstraint(NSLayoutConstraint(item: riderButton, attribute: .Top, relatedBy: .Equal, toItem: self.view, attribute: .Top, multiplier: 1, constant: self.navigationController!.navigationBar.frame.size.height + 10))
        self.view.addConstraint(NSLayoutConstraint(item: riderButton, attribute: .Left, relatedBy: .Equal, toItem: driverButton, attribute: .Right, multiplier: 1, constant: 10))
        self.view.addConstraint(NSLayoutConstraint(item: riderButton, attribute: .Width, relatedBy: .Equal, toItem: driverButton, attribute: .Width, multiplier: 0, constant: self.view.frame.size.width / 2 - 20))
        self.view.addConstraint(NSLayoutConstraint(item: riderButton, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0, constant: self.view.frame.size.height))
        
    }
    
    func driverButtonPressed() {
        let driver = ProfileViewController()
        //driver.log1 = self.log
        navigationController?.pushViewController(driver, animated: true)
    }
    
    func riderButtonPressed() {
        let flowLayout = UICollectionViewFlowLayout()
        let rider = RiderCollectionViewController(collectionViewLayout: flowLayout)
        rider.log1 = self.log
        
        ref = FIRDatabase.database().reference()
        refHandle = ref.observeEventType(FIRDataEventType.Value, withBlock: { (snapshot) in
            let dataDict = snapshot.value as! [String : AnyObject]
        })
        
        ref.childByAppendingPath("Driver Post").observeSingleEventOfType(FIRDataEventType.Value, withBlock: { (snapshot) in
            for child in snapshot.children {
                //print("hi")
                let key = (child as! FIRDataSnapshot).key
                let post = snapshot.value![key]
                print(post!!["Cost of Trip"] as! String)
                //print(post)
                var tempArr = [String]()
                //print(post!!["Cost of Trip"] as! String)
                tempArr.append(post!!["Cost of Trip"] as! String)
                tempArr.append(post!!["Date"] as! String)
                tempArr.append(post!!["Dropoff Location"] as! String)
                tempArr.append(post!!["From Location"] as! String)
                tempArr.append(post!!["Number of Seats"] as! String)
                tempArr.append(post!!["Pickup Location"] as! String)
                tempArr.append(post!!["Pickup Time"] as! String)
                tempArr.append(post!!["Round Trip"] as! String)
                tempArr.append(post!!["To Location"] as! String)
                tempArr.append(post!!["User"] as! String)
                rider.driverPost[self.index] = tempArr
                self.index = self.index + 1
            }
            self.navigationController?.pushViewController(rider, animated: true)
        })
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
