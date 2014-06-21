//
//  TeamsTableViewController.swift
//  WorldCup-Swift
//
//  Created by Juliana Chahoud on 6/19/14.
//  Copyright (c) 2014 jchahoud. All rights reserved.
//

import UIKit

class TeamsTableViewController: UITableViewController {


    let allGroups = [
                    "Group A": ["Brasil", "Croácia", "México", "Camarões"],
                    "Group B": ["Netherlands","Chile","Australia","Spain"],
                    "Group C": ["Colombia","Ivory Coast","Japan","Greece"],
                    "Group D": ["Costa Rica", "Italy","England","Uruguay"],
                    "Group E": ["France","Switzerland","Ecuador","Honduras"],
                    "Group F": ["Argentina","Iran","Nigeria","Bosnia and Herzegovina"],
                    "Group G": ["Germany","United States","Ghana","Portugal"],
                    "Group H": ["Belgium","Russia","South Korea","Algeria"]
                    ]
    
    var groups: String[] = []
    var groupedTeams: String[][] = []
    
    
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

        //for learning pourposes 
        for (group, teams) in allGroups
        {
            groups.append(group)
            groupedTeams.append(teams)
        }
        tableView.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //#pragma mark - Table view data source
    
    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
    {
        return groupedTeams[0].count;
    }
    
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("TeamsCell", forIndexPath: indexPath) as UITableViewCell
        
        let teams = groupedTeams[indexPath.section]
        
        cell.text = teams[indexPath.row]
        
        return cell
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int // Default is 1 if not implemented
    {
        return groups.count;
    }
    
    override func tableView(tableView: UITableView!, titleForHeaderInSection section: Int) -> String!{
     // fixed font style. use custom view (UILabel) if you want something different
    
        return groups[section]
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
