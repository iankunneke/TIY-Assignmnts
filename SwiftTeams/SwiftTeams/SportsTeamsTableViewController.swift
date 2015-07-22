//
//  SportsTeamsTableViewController.swift
//  SwiftTeams
//
//  Created by ian kunneke on 7/21/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

import UIKit

class SportsTeamsTableViewController: UITableViewController
{
    let theTeams = []()

    override func viewDidLoad()
    {
        super.viewDidLoad()

        let teamData = [["teamName": "Orlando Tragic", "sport": "NBA", "bestPlayer": "Pat Garrity", "wins": 72, "loses": 9], ["teamName": "Cleveland Cavaliers", "sport": "NBA", "bestPlayer": "LeChoke James", "wins": 22, "loses": 59], ["teamName": "Denver Nuggets", "sport": "NBA", "bestPlayer": "the fans", "wins": 41, "loses": 41], ["teamName": "Pittsburgh Steelers", "sport": "NFL", "bestPlayer": "Antonio Brown", "wins": 16, "loses": 0], ["teamName": "Miami Dolphins", "sport": "NFL", "bestPlayer": "Ray Finkle", "wins": 8, "loses": 8], ["teamName": "Florida Gators", "sport": "NCAA", "bestPlayer": "Tim Tebow", "wins": 12, "loses": 1], ["teamName": "FSU crimiNoles", "sport": "NCAA", "bestPlayer": "Prisoners", "wins": 3, "loses": 9], ["teamName": "The Iron Yard", "sport": "Programming", "bestPlayer": "Joben Gohlke", "wins": 348, "loses": 0], ["teamName": "Pittsburgh Pirates", "sport": "MLB", "bestPlayer": "Andrew McCutchen", "wins": 100, "loses": 60], ["teamName": "UFC", "sport": "Fighting", "bestPlayer": "Chuck Norris", "wins": 8609238469032869, "loses": 0]]
        
        for (teamName, sport, bestPlayer, wins, loses) in teamData
        {
            
        }
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 0
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
