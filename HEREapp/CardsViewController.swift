//
//  CardsViewController.swift
//  HEREapp
//
//  Created by Aaron Monick on 4/8/15.
//  Copyright (c) 2015 here. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, CardCellDelegate, MapTransitionManagerDelegate {

    @IBOutlet weak var backgroundImageView:UIImageView!
    @IBOutlet weak var collectionView:UICollectionView!
    
    var card1 = Card(id: "Paris001", name: "Paris", address: "France", featuredImage: UIImage(named: "paris"), distance: "1 mile", isLiked: false)
    var card2 = Card(id: "Rome001", name: "Rome", address: "Italy", featuredImage: UIImage(named: "rome"), distance: "2 miles", isLiked: false)
    var card3 = Card(id: "Istanbul001", name: "Istanbul", address: "Turkey", featuredImage: UIImage(named: "istanbul"), distance: "3 miles", isLiked: false)
    var card4 = Card(id: "London001", name: "London", address: "England", featuredImage: UIImage(named: "london"), distance: "4 miles", isLiked: false)
    var card5 = Card(id: "Sydney001", name: "Sydney", address: "Australia", featuredImage: UIImage(named: "sydney"), distance: "5 miles", isLiked: false)
    var card6 = Card(id: "Santorini001", name: "Santorini", address: "Greece", featuredImage: UIImage(named: "santorini"), distance: "6 miles", isLiked: false)
    var card7 = Card(id: "Santorini001", name: "Santorini", address: "Greece", featuredImage: UIImage(named: "santorini"), distance: "7 miles", isLiked: false)
    var card8 = Card(id: "NewYork001", name: "New York", address: "United States", featuredImage: UIImage(named: "newyork"), distance: "8 miles", isLiked: false)
    var card9 = Card(id: "Kyoto001", name: "Kyoto", address: "Japan", featuredImage: UIImage(named: "kyoto"), distance: "9 miles", isLiked: false)
    
    var cards: [Card] = [Card(id: "Paris001", name: "Paris", address: "France", featuredImage: UIImage(named: "paris"), distance: "1 mile", isLiked: false),
        Card(id: "Rome001", name: "Rome", address: "Italy", featuredImage: UIImage(named: "rome"), distance: "2 miles", isLiked: false),
        Card(id: "Istanbul001", name: "Istanbul", address: "Turkey", featuredImage: UIImage(named: "istanbul"), distance: "3 miles", isLiked: false),
        Card(id: "London001", name: "London", address: "England", featuredImage: UIImage(named: "london"), distance: "4 miles", isLiked: false),
        Card(id: "Sydney001", name: "Sydney", address: "Australia", featuredImage: UIImage(named: "sydney"), distance: "5 miles", isLiked: false),
        Card(id: "Santorini001", name: "Santorini", address: "Greece", featuredImage: UIImage(named: "santorini"), distance: "6 miles", isLiked: false),
        Card(id: "NewYork001", name: "New York", address: "United States", featuredImage: UIImage(named: "newyork"), distance: "8 miles", isLiked: false),
        Card(id: "Kyoto001", name: "Kyoto", address: "Japan", featuredImage: UIImage(named: "kyoto"), distance: "9 miles", isLiked: false)]
    
    var mapTransitionManager = MapTransitionManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Apply blurring effect
        backgroundImageView.image = UIImage(named: "cloud")
        let blurEffect = UIBlurEffect(style: .Dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        self.collectionView.backgroundColor = UIColor.clearColor()
        
        // Adjust the height of the collection view for 3.5-inch display
        if UIScreen.mainScreen().bounds.size.height == 480.0 {
            let flowLayout = self.collectionView.collectionViewLayout as UICollectionViewFlowLayout
            flowLayout.itemSize = CGSizeMake(250.0, 300.0)
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "MapSegue" {
            let mapViewController = segue.destinationViewController as MapViewController
            mapViewController.transitioningDelegate = self.mapTransitionManager
            self.mapTransitionManager.delegate = self
        }
    
    }
    
    func dismiss() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as CardViewCell
        
        // Configure the cell
        cell.nameLabel.text = cards[indexPath.row].name
        cell.addressLabel.text = cards[indexPath.row].address
        cell.imageView.image = cards[indexPath.row].featuredImage
        cell.distanceLabel.text = cards[indexPath.row].distance
        cell.isLiked = cards[indexPath.row].isLiked
        
        cell.delegate = self
        
        return cell
    }
    
    func didLikeButtonPressed(cell: CardViewCell) {
        if let indexPath = self.collectionView.indexPathForCell(cell) {
            cards[indexPath.row].isLiked = cards[indexPath.row].isLiked ? false : true
            cell.isLiked = cards[indexPath.row].isLiked
        }
    }
    
    @IBAction func mapButtonPressed(sender: AnyObject) {
        performSegueWithIdentifier("MapSegue", sender: self)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

}
