//
//  LoginViewController.swift
//  UniversityRideShare
//
//  Created by Kyung Lee on 12/27/16.
//  Copyright © 2016 Kyung Lee. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.darkGrayColor()
        setupViews()
        loginText.text = "kjmlee@ucdavis.edu"
        passwordText.text = "hithere"
    }
    
    let loginText : UITextField = {
        let login = UITextField()
        login.placeholder = "Email"
        login.translatesAutoresizingMaskIntoConstraints = false
        login.borderStyle = UITextBorderStyle.None
        return login
    }()
    
    let passwordText : UITextField = {
        let password = UITextField()
        password.placeholder = "Password"
        password.borderStyle = UITextBorderStyle.None
        password.translatesAutoresizingMaskIntoConstraints = false
        return password
    }()
    
    let loginButton: UIButton = {
        let login = UIButton()
        login.backgroundColor = UIColor.blueColor()
        login.translatesAutoresizingMaskIntoConstraints = false
        //login.addTarget(self, action: #selector(self.loginButtonPressed), forControlEvents: .TouchUpInside)
        return login
    }()
    
    let signUpButton : UIButton = {
        let signup = UIButton()
        signup.translatesAutoresizingMaskIntoConstraints = false
        signup.backgroundColor = UIColor.blueColor()
        return signup
    }()
    
    
    func setupViews() {
        self.view.addSubview(loginText)
        self.view.addSubview(passwordText)
        self.view.addSubview(loginButton)
        self.view.addSubview(signUpButton)
        loginButton.addTarget(self, action: #selector(self.loginButtonPressed), forControlEvents: .TouchUpInside)
        signUpButton.addTarget(self, action: #selector(self.signUpButtonPressed), forControlEvents: .TouchUpInside)
        
        self.view.addConstraint(NSLayoutConstraint(item: loginText, attribute: .Top, relatedBy: .Equal, toItem: self.view, attribute: .Top, multiplier: 1, constant: 100))
        self.view.addConstraint(NSLayoutConstraint(item: loginText, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1, constant: 10))
        self.view.addConstraint(NSLayoutConstraint(item: loginText, attribute: .Right, relatedBy: .Equal, toItem: self.view, attribute: .Right, multiplier: 1, constant: -10))
        self.view.addConstraint(NSLayoutConstraint(item: loginText, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0, constant: 100))
        
        self.view.addConstraint(NSLayoutConstraint(item: passwordText, attribute: .Top, relatedBy: .Equal, toItem: loginText, attribute: .Bottom, multiplier: 1, constant: 10))
        self.view.addConstraint(NSLayoutConstraint(item: passwordText, attribute: .Left, relatedBy: .Equal, toItem: loginText, attribute: .Left, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: passwordText, attribute: .Right, relatedBy: .Equal, toItem: loginText, attribute: .Right, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: passwordText, attribute: .Height, relatedBy: .Equal, toItem: loginText, attribute: .Height, multiplier: 0, constant: 100))
        
        self.view.addConstraint(NSLayoutConstraint(item: loginButton, attribute: .Top, relatedBy: .Equal, toItem: passwordText, attribute: .Bottom, multiplier: 1, constant: 10))
        self.view.addConstraint(NSLayoutConstraint(item: loginButton, attribute: .Left, relatedBy: .Equal, toItem: passwordText, attribute: .Left, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: loginButton, attribute: .Right, relatedBy: .Equal, toItem: passwordText, attribute: .Right, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: loginButton, attribute: .Height, relatedBy: .Equal, toItem: passwordText, attribute: .Height, multiplier: 0, constant: 100))

        self.view.addConstraint(NSLayoutConstraint(item: signUpButton, attribute: .Top, relatedBy: .Equal, toItem: loginButton, attribute: .Bottom, multiplier: 1, constant: 10))
        self.view.addConstraint(NSLayoutConstraint(item: signUpButton, attribute: .Left, relatedBy: .Equal, toItem: loginButton, attribute: .Left, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: signUpButton, attribute: .Right, relatedBy: .Equal, toItem: loginButton, attribute: .Right, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: signUpButton, attribute: .Height, relatedBy: .Equal, toItem: loginButton, attribute: .Height, multiplier: 0, constant: 20))
    }
    
    func loginButtonPressed() {
        if self.loginText.text! == "" || self.passwordText.text! == "" {
            print("Please enter a username or password!")
        }
        else {
            FIRAuth.auth()?.signInWithEmail(self.loginText.text!, password: self.passwordText.text!, completion: { (user, error) in
                
                if error == nil {
//                    self.loginText.text = ""
//                    self.passwordText.text = ""
                    let choice = DriverOrRiderViewController()
                    var log1 = LoginInfo()
                    log1.loginName = self.loginText.text!
                    log1.userID = user?.uid
                    choice.log = log1
                    self.navigationController?.setViewControllers([choice], animated: true)
                    //self.userID1 = user!.uid
                    //self.performSegueWithIdentifier("afterlogin", sender: 1)
                }
                else {
                    print("Error:")
                    print(error)
                    print("END")
                }
                
                
            })
        }
    }
    
    func signUpButtonPressed() {
        let google = GoogleVerifyViewController()
        navigationController?.pushViewController(google, animated: true)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
