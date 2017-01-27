//
//  GoogleVerifyViewController.swift
//  UniversityRideShare
//
//  Created by Kyung Lee on 12/29/16.
//  Copyright © 2016 Kyung Lee. All rights reserved.
//

import UIKit
import Google
import GoogleSignIn

class GoogleVerifyViewController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        var error : NSError?
        GGLContext.sharedInstance().configureWithError(&error)
        //GIDSignIn.sharedInstance().signOut()
        if error != nil {
            print(error)
            return
        }
        
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
        setupViews()
    }
    
    let signButton : GIDSignInButton = {
        let sign = GIDSignInButton(frame: CGRectMake(0, 0, 100, 50))
        sign.translatesAutoresizingMaskIntoConstraints = false
        return sign
    }()
    
    let signLabel : UILabel = {
        let sign = UILabel()
        sign.text = "Verify your google.edu account"
        sign.translatesAutoresizingMaskIntoConstraints = false
        return sign
    }()
    
    func setupViews() {
        self.view.addSubview(signLabel)
        self.view.addSubview(signButton)
        signButton.center = view.center
        
        view.addConstraint(NSLayoutConstraint(item: signLabel, attribute: .Top, relatedBy: .Equal, toItem: self.view, attribute: .Top, multiplier: 1, constant: self.view.frame.height / 2 - 30))
        view.addConstraint(NSLayoutConstraint(item: signLabel, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1, constant: self.view.frame.width / 2 - 115))
//        view.addConstraint(NSLayoutConstraint(item: signLabel, attribute: .Right, relatedBy: .Equal, toItem: self.view, attribute: .Right, multiplier: 1, constant: -40))
        view.addConstraint(NSLayoutConstraint(item: signLabel, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0, constant: 25))
        
        view.addConstraint(NSLayoutConstraint(item: signButton, attribute: .Top, relatedBy: .Equal, toItem: signLabel, attribute: .Bottom, multiplier: 1, constant: 5))
        view.addConstraint(NSLayoutConstraint(item: signButton, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1, constant: self.view.frame.width / 2 - 50))
//        view.addConstraint(NSLayoutConstraint(item: signButton, attribute: .Top, relatedBy: .Equal, toItem: signLabel, attribute: .Bottom, multiplier: 1, constant: 5))
//        view.addConstraint(NSLayoutConstraint(item: signButton, attribute: .Top, relatedBy: .Equal, toItem: signLabel, attribute: .Bottom, multiplier: 1, constant: 5))
    }
    
    //sign in the user through google sign in
    func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!, withError error: NSError!) {
        if error == nil {
            if (user.profile.email.rangeOfString("ucdavis.edu") != nil) {
                
                let account = CreateAccViewController()
                //account.recieveLabel = user.profile.email
                presentViewController(account, animated: true, completion: nil)
                
            }
            else {
                GIDSignIn.sharedInstance().signOut()
                let alert = UIAlertView()
                alert.title = "Non .edu email entered"
                alert.message = "Please enter and use a .edu email."
                alert.addButtonWithTitle("OK")
                alert.show()
            }
        }
        else {
            print("Error")
            print(error)
            print("END")
            return
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
