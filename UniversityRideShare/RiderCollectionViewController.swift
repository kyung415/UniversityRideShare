//
//  RiderCollectionViewController.swift
//  UniversityRideShare
//
//  Created by Kyung Lee on 12/29/16.
//  Copyright © 2016 Kyung Lee. All rights reserved.
//

import UIKit

class RiderCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    var log1 : LoginInfo?
    var driverPost = [Int: [String]]()
    let padding : CGFloat = 50.0
    let numOfItemsPerRow : CGFloat = 3.0
    let heightAdjust : CGFloat = 30.0
    var width : CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let filterBarButton = UIBarButtonItem(title: "Filter", style: .Plain, target: self, action: #selector(RiderCollectionViewController.filterBarButtonPressed))
        self.navigationItem.rightBarButtonItem = filterBarButton
        collectionView?.backgroundColor = UIColor.cyanColor()
        print(self.driverPost)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.registerClass(PostCell.self, forCellWithReuseIdentifier: "cell")
        
        width = (CGRectGetWidth(collectionView!.frame) - padding)
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSizeMake(width, width / 2)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func filterBarButtonPressed() {
        let filter = FiltersViewController()
        filter.rides?.driverPost = driverPost
        navigationController?.pushViewController(filter, animated: true)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

//    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.driverPost.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! PostCell
    
        // Configure the cell
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
