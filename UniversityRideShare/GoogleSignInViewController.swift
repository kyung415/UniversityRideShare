//
//  GoogleSignInViewController.swift
//  UniversityRideShare
//
//  Created by Kyung Lee on 12/15/16.
//  Copyright © 2016 Kyung Lee. All rights reserved.
//

//var varName : viewcontrollerName = segue.destinationViewController as viewcontrollerName

import UIKit
import Google
import GoogleSignIn

class GoogleSignInViewController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate {
    
    var loginName = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        var error : NSError?
        GGLContext.sharedInstance().configureWithError(&error)
        
        if error != nil {
            print(error)
            return
        }
        
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
        
        let signButton = GIDSignInButton(frame: CGRectMake(0, 0, 100, 50))
        signButton.center = view.center
        view.addSubview(signButton)
        
        
        // Do any additional setup after loading the view.
        
//        if check == 0 {
//            self.performSegueWithIdentifier("notallowid", sender: nil)
//        }
    }
    
    func setupViews() {
        
    }
    
    @IBAction func didTapSignOut(sender: AnyObject) {
        GIDSignIn.sharedInstance().signOut()
    }
    
    func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!, withError error: NSError!) {
        
        if error != nil {
            print("Error")
            print(error)
            print("END")
            return
        }
        //if ucdavis.edu is a substring
        if (user.profile.email.rangeOfString("ucdavis.edu") != nil) {
            
            let account = CreateAccountViewController()
            account.recieveLabel = user.profile.email
            presentViewController(account, animated: true, completion: nil)
            
            //self.performSegueWithIdentifier("allowid", sender: user.profile.email)
        }
        else {
            GIDSignIn.sharedInstance().signOut()
            //self.performSegueWithIdentifier("notallowid", sender: nil)
        }
        
//        print("Email: ")
//        print(user.profile.email)
//        print("END")
        //self.performSegueWithIdentifier("options", sender: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        print(sender)
//        var loginText = sender!
//        var dataTransfer = segue.destinationViewController as! CreateAccountViewController
//        dataTransfer.recieveLabel = loginText as! String
//    }
    
    @IBAction func signoutButton(sender: AnyObject) {
        GIDSignIn.sharedInstance().signOut()
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
