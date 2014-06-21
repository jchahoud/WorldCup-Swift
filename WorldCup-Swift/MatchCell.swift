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
        
        homeLogoImage.setImageWithURL(NSURL(string:match.c_HomeLogoImage))

        awayLogoImage.setImageWithURL(NSURL(string:match.c_AwayLogoImage))
    }
}
