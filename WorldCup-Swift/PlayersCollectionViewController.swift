//
//  PlayersCollectionViewController.swift
//  WorldCup-Swift
//
//  Created by Juliana Chahoud on 6/19/14.
//  Copyright (c) 2014 jchahoud. All rights reserved.
//

import UIKit

let reuseIdentifier = "Cell"

class PlayersCollectionViewController: UICollectionViewController {

    let allPlayers = [
        "10": ["Neymar", "Attack"],
        "Group B": ["Netherlands","Chile","Australia","Spain"],
        "Group C": ["Colombia","Ivory Coast","Japan","Greece"],
        "Group D": ["Costa Rica", "Italy","England","Uruguay"],
        "Group E": ["France","Switzerland","Ecuador","Honduras"],
        "Group F": ["Argentina","Iran","Nigeria","Bosnia and Herzegovina"],
        "Group G": ["Germany","United States","Ghana","Portugal"],
        "Group H": ["Belgium","Russia","South Korea","Algeria"]
    ]
    
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }

    init(coder aDecoder: NSCoder!)
    {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // #pragma mark UICollectionViewDataSource

    override func collectionView(collectionView: UICollectionView!, numberOfItemsInSection section: Int) -> Int
    {
        return 0
    }

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView!) -> Int
    {
        return  0
    }

    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    override func collectionView(collectionView: UICollectionView!, cellForItemAtIndexPath indexPath: NSIndexPath!) -> UICollectionViewCell!
    {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PlayerCell", forIndexPath: indexPath) as UICollectionViewCell
        
        return cell
    }
    
    /*
    // #pragma mark - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    }
    */

}
