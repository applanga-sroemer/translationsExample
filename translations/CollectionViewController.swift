//
//  CollectionViewController.swift
//  translations
//
//  Created by François Benaiteau on 27/11/15.
//  Copyright © 2015 Sinnerschrader Mobile. All rights reserved.
//

import UIKit

private let reuseIdentifier = "cell"

enum CollectionType {
    case None
    case Fruits
    case Colors
}

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    var selectedSource: Array<String>?
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    var collectionSourceType: CollectionType = .None {
        didSet {
            switch collectionSourceType {
            case .Fruits:
                selectedSource = fruits
                title = NSLocalizedString("Fruits",comment:"")
            case .Colors:
                selectedSource = colors
                title = NSLocalizedString("Colors",comment:"")
            case .None:
                selectedSource = nil
            }
        }
    }
    
    let fruits = [NSLocalizedString("Apple",comment:""),
        NSLocalizedString("Apricot",comment:""),
        NSLocalizedString("Avocado",comment:""),
        NSLocalizedString("Banana",comment:""),
        NSLocalizedString("Berry",comment:""),
        NSLocalizedString("Blueberry",comment:""),
        NSLocalizedString("Blackberry",comment:""),
        NSLocalizedString("Cranberry",comment:""),
        NSLocalizedString("Grapefruit",comment:""),
        NSLocalizedString("Grape",comment:""),
        NSLocalizedString("Kiwi",comment:""),
        NSLocalizedString("Lemon",comment:""),
        NSLocalizedString("Lychee",comment:""),
        NSLocalizedString("Macadamia",comment:""),
        NSLocalizedString("Nectarine",comment:""),
        NSLocalizedString("Orange",comment:""),
        NSLocalizedString("Peach",comment:""),
        NSLocalizedString("Peanut",comment:""),
        NSLocalizedString("Pine apple",comment:""),
        NSLocalizedString("Raspberry",comment:""),
        NSLocalizedString("Plum",comment:""),
        NSLocalizedString("Strawberry",comment:""),
        NSLocalizedString("Tomato",comment:""),
        NSLocalizedString("Walnut",comment:""),
        NSLocalizedString("Watermelon",comment:"")]

    let colors = [NSLocalizedString("black",comment:""),
        NSLocalizedString("darkGray",comment:""),
        NSLocalizedString("lightGray",comment:""),
        NSLocalizedString("white",comment:""),
        NSLocalizedString("gray",comment:""),
        NSLocalizedString("red",comment:""),
        NSLocalizedString("green",comment:""),
        NSLocalizedString("blue",comment:""),
        NSLocalizedString("cyan",comment:""),
        NSLocalizedString("yellow",comment:""),
        NSLocalizedString("magenta",comment:""),
        NSLocalizedString("orange",comment:""),
        NSLocalizedString("purple",comment:""),
        NSLocalizedString("brown",comment:"")]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = self.selectedSource?.count {
            return count
        }
        return 0
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! BasicCell
        
        cell.titleLabel.text = self.selectedSource![indexPath.row]
        
        return cell
    }
    
    // MARK: UICollectionViewDelegateFlowLayout
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(CGRectGetWidth(self.view.frame), 60)
    }
}
