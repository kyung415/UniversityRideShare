//
//  DateViewController.swift
//  UniversityRideShare
//
//  Created by Kyung Lee on 1/2/17.
//  Copyright © 2017 Kyung Lee. All rights reserved.
//

import UIKit

//asks for the date and time of the ride
class DateViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    
    var datePickerIndexPath : NSIndexPath?
    var tableArray : [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        navigationController?.title = "Date and Time"
        tableArray = ["Date and Time"]
        setupViews()
        // Do any additional setup after loading the view.
        
    }
    
    let pickerTableView : UITableView = {
        let table = UITableView()
        table.backgroundColor = UIColor.cyanColor()
        table.translatesAutoresizingMaskIntoConstraints = false
        //table.style = UITableViewCellStyle
        return table
    }()
    
    let dateTimeLabel : UILabel = {
        let dateTime = UILabel()
        dateTime.text = "Please enter the date and time of ride."
        dateTime.translatesAutoresizingMaskIntoConstraints = false
        return dateTime
    }()
    
    let nextButton : UIButton = {
        let next = UIButton()
        next.backgroundColor = UIColor.blackColor()
        next.translatesAutoresizingMaskIntoConstraints = false
        return next
    }()
    
    func setupViews() {
        self.view.addSubview(dateTimeLabel)
        self.view.addSubview(pickerTableView)
        self.view.addSubview(nextButton)
        
        pickerTableView.delegate = self
        pickerTableView.dataSource = self
        pickerTableView.registerClass(PickerCell.self, forCellReuseIdentifier: "cell")
        pickerTableView.registerClass(DateCell.self, forCellReuseIdentifier: "datecell")
        
        nextButton.addTarget(self, action: #selector(self.nextButtonPressed), forControlEvents: .TouchUpInside)
        //dateTimePicker.addTarget(self, action: #selector(self.handler(_:)), forControlEvents: UIControlEvents.ValueChanged)
        
        self.view.addConstraint(NSLayoutConstraint(item: dateTimeLabel, attribute: .Top, relatedBy: .Equal, toItem: self.view, attribute: .Top, multiplier: 1, constant: (navigationController?.navigationBar.frame.size.height)! + 20))
        self.view.addConstraint(NSLayoutConstraint(item: dateTimeLabel, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1, constant: 2))
        self.view.addConstraint(NSLayoutConstraint(item: dateTimeLabel, attribute: .Right, relatedBy: .Equal, toItem: self.view, attribute: .Right, multiplier: 1, constant: -2))
        self.view.addConstraint(NSLayoutConstraint(item: dateTimeLabel, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0, constant: 30))
//
//        self.view.addConstraint(NSLayoutConstraint(item: dateTimePicker, attribute: .Top, relatedBy: .Equal, toItem: dateTimeTextField, attribute: .Bottom, multiplier: 1, constant: 5))
//        self.view.addConstraint(NSLayoutConstraint(item: dateTimePicker, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1, constant: 2))
//        self.view.addConstraint(NSLayoutConstraint(item: dateTimePicker, attribute: .Right, relatedBy: .Equal, toItem: self.view, attribute: .Right, multiplier: 1, constant: -2))
//        self.view.addConstraint(NSLayoutConstraint(item: dateTimePicker, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0, constant: 216))
        
        self.view.addConstraint(NSLayoutConstraint(item: pickerTableView, attribute: .Top, relatedBy: .Equal, toItem: dateTimeLabel, attribute: .Bottom, multiplier: 1, constant: 10))
        self.view.addConstraint(NSLayoutConstraint(item: pickerTableView, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1, constant: 2))
        self.view.addConstraint(NSLayoutConstraint(item: pickerTableView, attribute: .Right, relatedBy: .Equal, toItem: self.view, attribute: .Right, multiplier: 1, constant: -2))
        self.view.addConstraint(NSLayoutConstraint(item: pickerTableView, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0, constant: 400))
        
        self.view.addConstraint(NSLayoutConstraint(item: nextButton, attribute: .Top, relatedBy: .Equal, toItem: pickerTableView, attribute: .Bottom, multiplier: 1, constant: 10))
        self.view.addConstraint(NSLayoutConstraint(item: nextButton, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1, constant: 2))
        self.view.addConstraint(NSLayoutConstraint(item: nextButton, attribute: .Right, relatedBy: .Equal, toItem: self.view, attribute: .Right, multiplier: 1, constant: -2))
        self.view.addConstraint(NSLayoutConstraint(item: nextButton, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0, constant: 30))
    }
    
    func nextButtonPressed() {
        //dismissViewControllerAnimated(true, completion: nil)
        let next = MapViewController()
        navigationController?.pushViewController(next, animated: true)
        //navigationController?.pushViewController(next, animated: true)
    }
    
    func handler(sender: UIDatePicker) {
        print(sender.date)
    }
    
//    func textFieldDidBeginEditing(textField: UITextField) {
//        
//    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var row = tableArray?.count
        if datePickerIndexPath != nil {
            row = row! + 1
        }
        return row!
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell : UITableViewCell
        if datePickerIndexPath != nil && datePickerIndexPath?.row == indexPath.row {
            cell = tableView.dequeueReusableCellWithIdentifier("datecell")!
        }
        else {
            cell = tableView.dequeueReusableCellWithIdentifier("cell")!
            cell.textLabel!.text = tableArray![indexPath.row]
        }
        return cell
    }
    
    //datepickerindexpath = nil means hidden
    //1 = no date picker shown, when we click a row a picker shows
    //2 = date picker shown, tap the row above it and date picker is hidden
    //3 = date picker shown, tapped above and below
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.beginUpdates()
        
        if datePickerIndexPath == nil && indexPath.row == 0 {
            datePickerIndexPath = NSIndexPath(forRow: indexPath.row + 1, inSection: 0)
            tableView.insertRowsAtIndexPaths([datePickerIndexPath!], withRowAnimation: .Fade)
        }
        else { //datePickerIndexPath is not hidden && row above is chosen then hide datePicker
            
            if datePickerIndexPath != nil && indexPath.row == 0 {
                tableView.deleteRowsAtIndexPaths([datePickerIndexPath!], withRowAnimation: .Fade)
                datePickerIndexPath = nil
            }
        }
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        tableView.endUpdates()
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        var rowHeight = tableView.rowHeight
        
        if datePickerIndexPath != nil && datePickerIndexPath!.row == indexPath.row {
            rowHeight = 216
        }
        
        return rowHeight
    }
    
    //NSIndexPath(forRow:, inSection:) -> forRow = what row, inSection = what section
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}
