//
//  DriverRiderViewController.swift
//  UniversityRideShare
//
//  Created by Kyung Lee on 12/19/16.
//  Copyright © 2016 Kyung Lee. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class DriverRiderViewController: UIViewController {
    var ref : FIRDatabaseReference!
    var refHandle : UInt!
    
    var driverPost = [Int: [String]]()
    var index = 0
    @IBOutlet weak var driverButton: UIButton!
    @IBOutlet weak var userButton: UIButton!
    var userID = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        print("UserID: ")
        print(userID)
        driverButton.addTarget(self, action: #selector(DriverRiderViewController.driverButtonPressed), forControlEvents: .TouchUpInside)
        userButton.addTarget(self, action: #selector(DriverRiderViewController.riderButtonPressed), forControlEvents: .TouchUpInside)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if sender! as! NSObject == 1 {
            print("bye")
            print(userID)
            let dataTransfer = segue.destinationViewController as! DriverPostViewController
            
            dataTransfer.userID2 = userID
        }
        else {
            print("hi")
            let dataTransfer2 = segue.destinationViewController as! RiderDriverPostsCollectionViewController
            dataTransfer2.driverPost = sender! as! [Int : [String]]
        }
    }
    
    func driverButtonPressed() {
        self.performSegueWithIdentifier("driver", sender: 1)
    }
    func riderButtonPressed() {
        
        ref = FIRDatabase.database().reference()
        refHandle = ref.observeEventType(FIRDataEventType.Value, withBlock: { (snapshot) in
            let dataDict = snapshot.value as! [String : AnyObject]
        })
        ref.childByAppendingPath("Driver Post").observeSingleEventOfType(FIRDataEventType.Value, withBlock: { (snapshot) in
            for child in snapshot.children {
                let key = (child as! FIRDataSnapshot).key
                let post = snapshot.value![key]
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
                self.driverPost[self.index] = tempArr
                self.index += 1
            }
            self.performSegueWithIdentifier("rider", sender: self.driverPost)
            //completion(driverPosts: self.driverPost)
        })
        
        
        
        //self.performSegueWithIdentifier("rider", sender: 2)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
