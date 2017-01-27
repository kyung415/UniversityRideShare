//
//  Picker.swift
//  UniversityRideShare
//
//  Created by Kyung Lee on 12/30/16.
//  Copyright © 2016 Kyung Lee. All rights reserved.
//

import UIKit
import Foundation

class Picker : UIPickerView, UIPickerViewDelegate , UIPickerViewDataSource{
    
    override func numberOfRowsInComponent(component: Int) -> Int {
        return 5
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(row)"
    }
    
    //func pickerView(_ pickerView: UIPickerView!,numberOfRowsInComponent component: Int) -> Int{}
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 1
    }
    
    //func numberOfComponentsInPickerView(_ pickerView: UIPickerView!) -> Int {}
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 5
    }
}