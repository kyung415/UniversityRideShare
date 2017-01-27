//
//  CreateAccViewController.swift
//  UniversityRideShare
//
//  Created by Kyung Lee on 12/29/16.
//  Copyright © 2016 Kyung Lee. All rights reserved.
//

import UIKit

class CreateAccViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        setupViews()
        // Do any additional setup after loading the view.
    }
    
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
    
    func setupViews() {
        self.view.addSubview(emailLabel)
        self.view.addSubview(emailTextField)
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

}
