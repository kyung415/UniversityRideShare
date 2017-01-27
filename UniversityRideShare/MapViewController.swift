//
//  MapViewController.swift
//  UniversityRideShare
//
//  Created by Kyung Lee on 1/2/17.
//  Copyright © 2017 Kyung Lee. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    //from, to location, pickup, dropoff location
    let locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        setupViews()
    }
    
    let mapView : MKMapView = {
        let map = MKMapView()
        map.translatesAutoresizingMaskIntoConstraints = false
        return map
    }()
    
    let nextButton : UIButton = {
        let next = UIButton()
        next.backgroundColor = UIColor.blackColor()
        next.translatesAutoresizingMaskIntoConstraints = false
        return next
    }()
    
    func setupViews() {
        self.view.addSubview(mapView)
        self.view.addSubview(nextButton)
        nextButton.addTarget(self, action: #selector(self.nextButtonPressed), forControlEvents: .TouchUpInside)
        
        self.view.addConstraint(NSLayoutConstraint(item: mapView, attribute: .Top, relatedBy: .Equal, toItem: self.view, attribute: .Top, multiplier: 1, constant: 10))
        self.view.addConstraint(NSLayoutConstraint(item: mapView, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1, constant: 10))
        self.view.addConstraint(NSLayoutConstraint(item: mapView, attribute: .Right, relatedBy: .Equal, toItem: self.view, attribute: .Right, multiplier: 1, constant: -10))
        self.view.addConstraint(NSLayoutConstraint(item: mapView, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0, constant: self.view.frame.height / 2))
        
        self.view.addConstraint(NSLayoutConstraint(item: nextButton, attribute: .Top, relatedBy: .Equal, toItem: mapView, attribute: .Bottom, multiplier: 1, constant: 10))
        self.view.addConstraint(NSLayoutConstraint(item: nextButton, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1, constant: 10))
        self.view.addConstraint(NSLayoutConstraint(item: nextButton, attribute: .Right, relatedBy: .Equal, toItem: self.view, attribute: .Right, multiplier: 1, constant: -10))
        self.view.addConstraint(NSLayoutConstraint(item: nextButton, attribute: .Height, relatedBy: .Equal, toItem: self.view, attribute: .Height, multiplier: 0, constant: 15))
        
    }
    
    func nextButtonPressed() {
        let add = AdditionalItemsViewController()
        presentViewController(add, animated: true, completion: nil)
        //dismissViewControllerAnimated(true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
