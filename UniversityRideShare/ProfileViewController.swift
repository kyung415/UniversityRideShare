//
//  ProfileViewController.swift
//  UniversityRideShare
//
//  Created by Kyung Lee on 1/2/17.
//  Copyright © 2017 Kyung Lee. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        setupViews()
    }
    
    let profilePicture : UIImageView = {
        let profile = UIImageView()
        profile.backgroundColor = UIColor.blackColor()
        profile.translatesAutoresizingMaskIntoConstraints = false
        profile.layer.cornerRadius = 50
        profile.layer.masksToBounds = true
        
        return profile
    }()
    
    let nameLabel : UILabel = {
        let name = UILabel()
        name.text = "Name"
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    let nameTextField : UITextField = {
        let name = UITextField()
        name.backgroundColor = UIColor.blueColor()
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    let emailLabel : UILabel = {
        let email = UILabel()
        email.translatesAutoresizingMaskIntoConstraints = false
        return email
    }()
    
    let emailTextField : UITextField = {
        let email = UITextField()
        email.translatesAutoresizingMaskIntoConstraints = false
        return email
    }()
    
    let postButton : UIButton = {
        let post = UIButton()
        post.translatesAutoresizingMaskIntoConstraints = false
        post.backgroundColor = UIColor.cyanColor()
        return post
    }()
    
    //self.view.addConstraint(NSLayoutConstraint(item: <#T##AnyObject#>, attribute: <#T##NSLayoutAttribute#>, relatedBy: <#T##NSLayoutRelation#>, toItem: <#T##AnyObject?#>, attribute: <#T##NSLayoutAttribute#>, multiplier: <#T##CGFloat#>, constant: <#T##CGFloat#>))
    
    func setupViews() {
        self.view.addSubview(profilePicture)
        self.view.addSubview(nameLabel)
        self.view.addSubview(nameTextField)
        self.view.addSubview(postButton)
        
        //profilePicture.clipsToBounds = true
        
        postButton.addTarget(self, action: #selector(self.postButtonPressed), forControlEvents: .TouchUpInside)
        
        self.view.addConstraint(NSLayoutConstraint(item: profilePicture, attribute: .Top, relatedBy: .Equal, toItem: self.view, attribute: .Top, multiplier: 1, constant: 100))
        self.view.addConstraint(NSLayoutConstraint(item: profilePicture, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1, constant: 5))
        self.view.addConstraint(NSLayoutConstraint(item: profilePicture, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0, constant: 100))
        self.view.addConstraint(NSLayoutConstraint(item: profilePicture, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0, constant: 100))
        
        self.view.addConstraint(NSLayoutConstraint(item: nameLabel, attribute: .Top, relatedBy: .Equal, toItem: self.view, attribute: .Top, multiplier: 1, constant: 100))
        self.view.addConstraint(NSLayoutConstraint(item: nameLabel, attribute: .Left, relatedBy: .Equal, toItem: profilePicture, attribute: .Right, multiplier: 1, constant: 10))
        self.view.addConstraint(NSLayoutConstraint(item: nameLabel, attribute: .Width, relatedBy: .Equal, toItem: self.view, attribute: .Width, multiplier: 0, constant: 50))
        self.view.addConstraint(NSLayoutConstraint(item: nameLabel, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0, constant: 15))
        
        self.view.addConstraint(NSLayoutConstraint(item: nameTextField, attribute: .Top, relatedBy: .Equal, toItem: self.view, attribute: .Top, multiplier: 1, constant: 100))
        self.view.addConstraint(NSLayoutConstraint(item: nameTextField, attribute: .Left, relatedBy: .Equal, toItem: nameLabel, attribute: .Right, multiplier: 1, constant: 5))
        self.view.addConstraint(NSLayoutConstraint(item: nameTextField, attribute: .Right, relatedBy: .Equal, toItem: self.view, attribute: .Right, multiplier: 1, constant: -10))
        self.view.addConstraint(NSLayoutConstraint(item: nameTextField, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0, constant: 15))
        
        self.view.addConstraint(NSLayoutConstraint(item: postButton, attribute: .Top, relatedBy: .Equal, toItem: nameTextField, attribute: .Bottom, multiplier: 1, constant: 10))
        self.view.addConstraint(NSLayoutConstraint(item: postButton, attribute: .Left, relatedBy: .Equal, toItem: profilePicture, attribute: .Right, multiplier: 1, constant: 5))
        self.view.addConstraint(NSLayoutConstraint(item: postButton, attribute: .Right, relatedBy: .Equal, toItem: self.view, attribute: .Right, multiplier: 1, constant: -10))
        self.view.addConstraint(NSLayoutConstraint(item: postButton, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0, constant: 15))
        
        
        
    }
    
    func postButtonPressed() {
        let post = DateViewController()
        let postNav = UINavigationController(rootViewController: post)
        navigationController?.presentViewController(postNav, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
