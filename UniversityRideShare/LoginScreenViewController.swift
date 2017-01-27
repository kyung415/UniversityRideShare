//
//  LoginScreenViewController.swift
//  UniversityRideShare
//
//  Created by Kyung Lee on 12/18/16.
//  Copyright © 2016 Kyung Lee. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginScreenViewController: UIViewController {

    var userID1 = ""
    @IBOutlet weak var loginName: UITextField!
    @IBOutlet weak var passwordName: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "roadbackground.png")!)
        navigationItem.title = "Login"
        //setupViews()
        self.passwordName.secureTextEntry = true
        // Do any additional setup after loading the view.
    }
    
    let loginText : UITextField = {
        var text = UITextField()
        text.backgroundColor = UIColor.blueColor()
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    let passwordText : UITextField = {
        var text = UITextField()
        text.backgroundColor = UIColor.redColor()
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
//    let backgroundView
    
    func setupViews() {
        
        self.view.addSubview(loginText)
        self.view.addSubview(passwordText)
        
        self.view.addConstraint(NSLayoutConstraint(item: loginText, attribute: .Top, relatedBy: .Equal, toItem: self.view, attribute: .Top, multiplier: 1, constant: 10))
        self.view.addConstraint(NSLayoutConstraint(item: loginText, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1, constant: 10))
        self.view.addConstraint(NSLayoutConstraint(item: loginText, attribute: .Right, relatedBy: .Equal, toItem: self.view, attribute: .Right, multiplier: 1, constant: -10))
        self.view.addConstraint(NSLayoutConstraint(item: loginText, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0, constant: 100))
        
        self.view.addConstraint(NSLayoutConstraint(item: passwordText, attribute: .Top, relatedBy: .Equal, toItem: loginText, attribute: .Bottom, multiplier: 1, constant: 10))
        self.view.addConstraint(NSLayoutConstraint(item: passwordText, attribute: .Left, relatedBy: .Equal, toItem: loginText, attribute: .Left, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: passwordText, attribute: .Right, relatedBy: .Equal, toItem: loginText, attribute: .Right, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: passwordText, attribute: .Height, relatedBy: .Equal, toItem: loginText, attribute: .Height, multiplier: 0, constant: 100))
        
        
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func loginButtonPressed(sender: AnyObject) {
        
        if self.loginName.text! == "" || self.passwordName.text! == "" {
            print("Please enter a username or password!")
        }
        else {
            FIRAuth.auth()?.signInWithEmail(self.loginName.text!, password: self.passwordName.text!, completion: { (user, error) in
                
                if error == nil {
                    self.loginName.text = ""
                    self.passwordName.text = ""
                    self.userID1 = user!.uid
                    self.performSegueWithIdentifier("afterlogin", sender: 1)
                }
                else {
                    print("Error:")
                    print(error)
                    print("END")
                }
                
                
            })
        }
    }
    
    @IBAction func signUpButtonPressed(sender: AnyObject) {
        
        self.performSegueWithIdentifier("googlesignin", sender: 2)
        
        
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if sender! as! NSObject == 1 {
            var dataTransfer = segue.destinationViewController as! DriverRiderViewController
            
            dataTransfer.userID = userID1
        }
        else if sender! as! NSObject == 2 {
            
        }
        
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
