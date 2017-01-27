//
//  FiltersViewController.swift
//  UniversityRideShare
//
//  Created by Kyung Lee on 12/26/16.
//  Copyright © 2016 Kyung Lee. All rights reserved.
//

import UIKit

class FiltersViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    var hi = "bye"
    
    var rides = RidePosts?()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.redColor()
        navigationItem.title = hi
        
        let doneBarButton = UIBarButtonItem(title: "Done", style: .Plain, target: self, action: #selector(FiltersViewController.doneButtonPressed))
        self.navigationItem.rightBarButtonItem = doneBarButton
        
        setupViews()
        
    }
    
    func doneButtonPressed() {
        
    }
    
    let costLabel : UILabel = {
        let cost = UILabel()
        cost.text = "Price"
        cost.translatesAutoresizingMaskIntoConstraints = false
        return cost
    }()

    let costTextField : UITextField = {
        let cost = UITextField()
        cost.placeholder = "Cost"
        cost.translatesAutoresizingMaskIntoConstraints = false
        return cost
    }()
    
    let costPicker : UIPickerView = {
        let cost = UIPickerView()
        cost.translatesAutoresizingMaskIntoConstraints = false
        cost.hidden = true
        return cost
    }()
    
    func setupViews() {
        self.view.addSubview(costTextField)
        self.view.addSubview(costPicker)
        
        costPicker.dataSource = self
        costPicker.delegate = self
        
        costTextField.delegate = self
        
        self.view.addConstraint(NSLayoutConstraint(item: costTextField, attribute: .Top, relatedBy: .Equal, toItem: self.view, attribute: .Top, multiplier: 1, constant: (self.navigationController?.navigationBar.frame.size.height)! + 10))
        self.view.addConstraint(NSLayoutConstraint(item: costTextField, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1, constant: 10))
        self.view.addConstraint(NSLayoutConstraint(item: costTextField, attribute: .Right, relatedBy: .Equal, toItem: self.view, attribute: .Right, multiplier: 1, constant: -10))
        self.view.addConstraint(NSLayoutConstraint(item: costTextField, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0, constant: 50))
        
        self.view.addConstraint(NSLayoutConstraint(item: costPicker, attribute: .Top, relatedBy: .Equal, toItem: costTextField, attribute: .Bottom, multiplier: 1, constant: 10))
        self.view.addConstraint(NSLayoutConstraint(item: costPicker, attribute: .Left, relatedBy: .Equal, toItem: costTextField, attribute: .Left, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: costPicker, attribute: .Right, relatedBy: .Equal, toItem: costTextField, attribute: .Right, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: costPicker, attribute: .Height, relatedBy: .Equal, toItem: costTextField, attribute: .Height, multiplier: 0, constant: 100))
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row)"
    }
    
    //func pickerView(_ pickerView: UIPickerView!,numberOfRowsInComponent component: Int) -> Int{}
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 5
    }
    
    //func numberOfComponentsInPickerView(_ pickerView: UIPickerView!) -> Int {}
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.costTextField.text = "\(row)"
        costPicker.hidden = true
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        print("hi")
        costPicker.hidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
