//
//  MatchesTableViewController.swift
//  WorldCup-Swift
//
//  Created by Juliana Chahoud on 6/19/14.
//  Copyright (c) 2014 jchahoud. All rights reserved.
//

import UIKit

class MatchesTableViewController: UITableViewController {

    
    var matches: Match[] = []
    
    
    init(style: UITableViewStyle) {
        super.init(style: style)
        // Custom initialization
    }

    init(coder aDecoder: NSCoder!)
    {
        super.init(coder: aDecoder)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        getMatches()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // #pragma mark - Table view data source

    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
    {
        return matches.count;
    }
    
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("MatchCell", forIndexPath: indexPath) as MatchCell
        
        let match = matches[indexPath.row]
        
        cell.configCell(match)
        
        
        return cell
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int // Default is 1 if not implemented
    {
        return 1;
    }

    /*
    override func tableView(tableView: UITableView!, titleForHeaderInSection section: Int) -> String!{
        // fixed font style. use custom view (UILabel) if you want something different
        
        return ""
    }
    
    
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
    
    func getMatches()
    {
        let apiFifaUrl = NSURL (string: "http://live.mobileapp.fifa.com/api/wc/matches")
        
        var request:NSURLRequest = NSURLRequest (URL: apiFifaUrl)
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler:{
            (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            
            var err: NSError
            
            var jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
            
            //println(jsonResult)
            
            if let data:NSDictionary = jsonResult["data"] as? NSDictionary
            {
                if let group = data["group"] as? NSDictionary[]
                {
                    for matchDict in group
                    {
                        self.matches += Match(dict:matchDict)

                    }
                }
            }
        
            self.tableView.reloadData()
            
            })
        
        return;
    }
    
    
}
