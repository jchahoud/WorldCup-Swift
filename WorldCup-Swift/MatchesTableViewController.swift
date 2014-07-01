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
    }

    init(coder aDecoder: NSCoder!)
    {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getMatches()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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

    func getMatches()
    {
       let apiFifaUrl = NSURL (string: "http://live.mobileapp.fifa.com/api/wc/matches")
        
        //creates a request with the API URL
        var request:NSURLRequest = NSURLRequest (URL: apiFifaUrl)
        
        /*
        Loads the data for a URL request and executes a handler block on an operation queue when the request completes or fails.
        In Obj-C:
        [NSURLConnection sendAsynchronousRequest:request
                                            queue:[NSOperationQueue mainQueue]
                                completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                                    //...
        }];
        */
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler:{
            (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            
            var err: NSError
            
            var jsonResult: NSDictionary = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
            
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
   
    /*
    // #pragma mark - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
    
}
