//
//  CreateAccountViewController.swift
//  UniversityRideShare
//
//  Created by Kyung Lee on 12/14/16.
//  Copyright © 2016 Kyung Lee. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class CreateAccountViewController: UIViewController {
    var ref : FIRDatabaseReference!
    var recieveLabel : String = ""
    @IBOutlet weak var errorMessage: UITextView!
    @IBOutlet weak var NewLogin: UITextField!
    @IBOutlet weak var NewPassword: UITextField!
    
    @IBOutlet weak var newName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NewLogin.text = recieveLabel
        ref = FIRDatabase.database().reference()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func registerButtonPressed(sender: AnyObject) {
        if self.NewLogin.text! == "" || self.NewPassword.text! == "" {
            print("Please enter a username or password.")
            return
        }
        //creates an account for the user
        else {
            FIRAuth.auth()?.createUserWithEmail(self.NewLogin.text!, password: self.NewPassword.text!, completion: { (user, error) in
                print("Error: ")
                print(error)
                print("end")
                if error == nil {
                    //adds in the new users info
                    //User
                    //  uid
                    //      Name
                    //      email
                    //      rating
                    let entry = ["Name": self.newName.text!,"Email": self.NewLogin.text!, "Rating": 0]
                    self.ref.child("Users").child(user!.uid).setValue(entry)
                    
                    self.NewLogin.text = ""
                    self.NewPassword.text = ""
                    self.newName.text = ""
                }
                //error: The email address is already in use by another account.
                else if ((error!.localizedDescription.rangeOfString("Code=17007")) == nil) {
                    self.errorMessage.text = "Error: The email address is already in use by another account."
                }
                else {
                    print("Error creating user")
                }
                
            })
            
        }
        
        
    }

}
