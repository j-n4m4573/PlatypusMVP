//
//  ChallengesTableViewController.swift
//  PlatypusMVP
//
//  Created by Jamar Gibbs on 2/15/16.
//  Copyright © 2016 M1ndful M3d1a. All rights reserved.
//

import UIKit

class ChallengesTableViewController: UITableViewController {
    var challenges : [Challenges] = []
    var winnerImg = UIImage()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.challenges = [Challenges(image: UIImage(named: "1.jpg")!,name:"Brew", challengeInfo: "Brew challenge: Name these Beers", badge:UIImage(named:"cup-512")!)]
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return challenges.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("challengeCell", forIndexPath: indexPath)
        let challenge = self.challenges[indexPath.row]
                cell.detailTextLabel?.text = challenge.challengeInfo
//        
//        let cellImg : UIImageView = UIImageView(frame: CGRectMake(5, 5, 120, 120))
//        cellImg.image = challenge.image
//        cell.addSubview(cellImg)
        
        return cell
    }
    
    @IBAction func unwindToVC(segue: UIStoryboardSegue) {
        
        
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
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
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destination  =  segue.destinationViewController as! StartViewController
        // Pass the selected object to the new view controller.
        
        let indexPath = tableView.indexPathForSelectedRow
        
        destination.challenges = self.challenges[indexPath!.row]
        

        
    }


}
