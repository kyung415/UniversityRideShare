//
//  RiderDriverPostsCollectionViewController.swift
//  UniversityRideShare
//
//  Created by Kyung Lee on 12/21/16.
//  Copyright © 2016 Kyung Lee. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
import Firebase

private let reuseIdentifier = "Cell"
var driverPostGlobal = [Int:[String]]()
var widthGlobal : CGFloat = 0.0
class RiderDriverPostsCollectionViewController: UICollectionViewController {
    
    var driverPost = [Int:[String]]()
    var index : Int = 0
    let padding : CGFloat = 50.0
    let numOfItemsPerRow : CGFloat = 3.0
    let heightAdjust : CGFloat = 30.0
    var width : CGFloat = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Filter"
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.registerClass(PostCell.self, forCellWithReuseIdentifier: "Cell")
        // Do any additional setup after loading the view.
        
        width = (CGRectGetWidth(collectionView!.frame) - padding)
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSizeMake(width, width / 2)
        driverPostGlobal = self.driverPost
        //self.printA()
        
        
    }
    
//    func printA() {
//        for var i = 0; i < driverPostGlobal.count; i += 1 {
//            print(driverPostGlobal[i])
//        }
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
//        print(self.driverPost.count)
//        return self.driverPost.count
//    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.driverPost.count
        //return 5
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! PostCell
        cell.costLabel.text = driverPost[indexPath.row]![0]
        cell.dateLabel.text = driverPost[indexPath.row]![1]
        cell.fromLocationLabel.text = driverPost[indexPath.row]![3]
        cell.toLocationLabel.text = driverPost[indexPath.row]![8]
        cell.nameLabel.text = driverPost[indexPath.row]![9]
        cell.ratingLabel.text = "4/5"
        //(CGRectGetWidth(collectionView!.frame)
//        cell.costOfRide.center.x = self.width / 2
//        cell.costOfRide.text = driverPost[indexPath.row]![0]
//        cell.dateOfRide.text = driverPost[indexPath.row]![1]
//        cell.fromLocation.text = driverPost[indexPath.row]![3]
//        cell.nameOfDriver.text = driverPost[indexPath.row]![9]
//        cell.ratingOfDriver.text = "4/5"
//        cell.toLocation.text = driverPost[indexPath.row]![8]

        return cell
    }
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

//}
