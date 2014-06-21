//
//  GameCell.swift
//  WorldCup-Swift
//
//  Created by Juliana Chahoud on 6/19/14.
//  Copyright (c) 2014 jchahoud. All rights reserved.
//

import UIKit

class MatchCell: UITableViewCell {

    @IBOutlet var homeTeam: UILabel
    @IBOutlet var homeGoals: UILabel
    @IBOutlet var homeLogoImage: UIImageView
    @IBOutlet var awayTeam: UILabel
    @IBOutlet var awayGoals: UILabel
    @IBOutlet var awayLogoImage: UIImageView
    @IBOutlet var stadiums: UILabel
    
    
    
    func configCell (match: Match)->Void
    {
        //load teams names and stadium
        homeTeam.text = match.c_HomeTeam_en
        awayTeam.text = match.c_AwayTeam_en
        stadiums.text = match.c_Stadium

        //load team goals unwrapping the optionals
        if let goals = match.n_HomeGoals
        {
            homeGoals.text = "\(goals)"

        }

        if let goals = match.n_AwayGoals
        {
            awayGoals.text = "\(goals)"
            
        }
        
        //home logo image lazy loading
        self.homeLogoImage.image=nil
        var imgURL: NSURL = NSURL(string: match.c_HomeLogoImage)
        var request: NSURLRequest = NSURLRequest(URL: imgURL, cachePolicy:.ReturnCacheDataElseLoad , timeoutInterval: 120)
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler:
            {(response: NSURLResponse!,data: NSData!,error: NSError!) -> Void in
                if !error? {
                    self.homeLogoImage.image = UIImage(data:data)
                }
                else {
                    println("Error: \(error.localizedDescription)")
                }
            })
        
        //away logo image lazy loading
        /*self.awayLogoImage.image=nil
        var awayImgURL: NSURL = NSURL(string: match.c_AwayLogoImage)
        var awayRequest: NSURLRequest = NSURLRequest(URL: awayImgURL, cachePolicy:.ReturnCacheDataElseLoad , timeoutInterval: 120)
        NSURLConnection.sendAsynchronousRequest(awayRequest, queue: NSOperationQueue.mainQueue(), completionHandler:
            {(response: NSURLResponse!,data: NSData!,error: NSError!) -> Void in
                if !error? {
                    self.awayLogoImage.image = UIImage(data:data)
                }
                else {
                    println("Error: \(error.localizedDescription)")
                }
            })*/
    }
    
    
}
