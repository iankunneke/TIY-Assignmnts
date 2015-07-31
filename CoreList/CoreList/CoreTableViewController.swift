//
//  CoreTableViewController.swift
//  CoreList
//
//  Created by ian kunneke on 7/29/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

import UIKit
import CoreData

protocol AddCoreDelegate
{
    func coreWasMade(aCore: String)
}

class CoreTableViewController: UITableViewController, AddCoreDelegate
{
    var cores = [NSManagedObject]()

    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {

        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {

        return cores.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("CoreCell", forIndexPath: indexPath) as! UITableViewCell

        let core = cores[indexPath.row]
        cell.textLabel!.text = core.valueForKey("name") as? String

        return cell
    }

    func coreWasMade(aCore: String)
    {
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext!
        
        let entity =  NSEntityDescription.entityForName("Core",inManagedObjectContext: managedContext)
        
        let core = NSManagedObject(entity: entity!, insertIntoManagedObjectContext:managedContext)
        cores.append(core)
        tableView.reloadData()
    }

    
    // MARK: - Navigation


    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "AddCoreSegue"
        {
            let destVC = segue.destinationViewController as! AddCoreViewController
            destVC.delegate = self
        }
    }


}
