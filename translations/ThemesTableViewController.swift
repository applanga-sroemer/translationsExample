//
//  ThemesTableViewController.swift
//  translations
//
//  Created by François Benaiteau on 27/11/15.
//  Copyright © 2015 Sinnerschrader Mobile. All rights reserved.
//

import UIKit

class ThemesTableViewController: UITableViewController {

    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let collectionVC = segue.destinationViewController as! CollectionViewController
        if segue.identifier == "presentColorsSegue" {
            collectionVC.collectionSourceType = .Colors
        }else if segue.identifier == "presentFruitsSegue" {
            collectionVC.collectionSourceType = .Fruits
        }
    }

}
