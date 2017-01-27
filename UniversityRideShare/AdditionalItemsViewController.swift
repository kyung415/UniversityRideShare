//
//  AdditionalItemsViewController.swift
//  UniversityRideShare
//
//  Created by Kyung Lee on 1/7/17.
//  Copyright © 2017 Kyung Lee. All rights reserved.
//

import UIKit

class AdditionalItemsViewController: UIViewController {
    
    //cost, seats
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        // Do any additional setup after loading the view.
    }
    
    let additionalLabel : UILabel = {
        let add = UILabel()
        add.translatesAutoresizingMaskIntoConstraints = false
        return add
    }()
    
    let costLabel : UILabel = {
        let cost = UILabel()
        cost.translatesAutoresizingMaskIntoConstraints = false
        return cost
    }()
    
    let costTextField : UITextField = {
        let cost = UITextField()
        cost.translatesAutoresizingMaskIntoConstraints = false
        return cost
    }()
    
    let seatsLabel : UILabel = {
        let seats = UILabel()
        seats.translatesAutoresizingMaskIntoConstraints = false
        return seats
    }()
    
    let seatsTextField : UITextField = {
        let seats = UITextField()
        seats.translatesAutoresizingMaskIntoConstraints = false
        return seats
    }()
    
    let nextButton : UIButton = {
        let next = UIButton()
        next.translatesAutoresizingMaskIntoConstraints = false
        return next
    }()

    func setupViews() {
        
    }
    
    func nextButtonPressed() {
        dismissViewControllerAnimated(true, completion: nil)
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
