//
//  DriverPostViewController.swift
//  UniversityRideShare
//
//  Created by Kyung Lee on 12/18/16.
//  Copyright © 2016 Kyung Lee. All rights reserved.
//

import UIKit
import FirebaseDatabase

class DriverPostViewController: UIViewController {
    
    var userID2 = ""
    var ref : FIRDatabaseReference!
    @IBOutlet weak var dateOfRide: UITextField!
    @IBOutlet weak var fromLocation: UITextField!
    @IBOutlet weak var toLocation: UITextField!
    @IBOutlet weak var roundTrip: UITextField!
    @IBOutlet weak var costOfTrip: UITextField!
    @IBOutlet weak var pickupLocation: UITextField!
    @IBOutlet weak var dropOffLocation: UITextField!
    @IBOutlet weak var numOfSeats: UITextField!
    @IBOutlet weak var timeOfPickup: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("UserID2: ")
        print(userID2)
        //gets everything from the database
        ref = FIRDatabase.database().reference()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func postRideButtonPressed(sender: AnyObject) {
        
        let hi : String = "hi"
        let entry = ["User": self.userID2, "Date": self.dateOfRide.text!, "From Location": self.fromLocation.text!, "To Location": self.toLocation.text!, "Round Trip": self.roundTrip.text!, "Cost of Trip": self.costOfTrip.text!, "Pickup Location": self.pickupLocation.text!, "Dropoff Location": self.dropOffLocation.text!, "Number of Seats": self.numOfSeats.text!, "Pickup Time": self.timeOfPickup.text!]
        var myString = String(arc4random())
        self.ref.child("Driver Post").child(myString).setValue(entry)
        
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
