//
//  WinnerViewController.swift
//  PlatypusMVP
//
//  Created by Jamar Gibbs on 2/17/16.
//  Copyright © 2016 M1ndful M3d1a. All rights reserved.
//

import UIKit
import Firebase

class WinnerViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    var userScore = ""
    var currentUserName = ""
    var currentUserScore = ""
    var score1 = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(score1)
        
        Data.data.CURRENT_USER_REF.observeEventType(FEventType.Value,withBlock:{
            snapshot in
            let currentUser = snapshot.value.objectForKey("username") as! String
            
            print("username:\(currentUser)")
            self.currentUserName = currentUser
            self.scoreData()
            },
            withCancelBlock: { error in
                print(error.description)
        })
        
    }

    func scoreData() {
        Data.data.SCORE_REF.observeEventType(FEventType.Value, withBlock:{ snapshot in
            let playerScore = snapshot.value.objectForKey("timerScore")as! String
            print("score:\(playerScore)")
            self.currentUserScore = playerScore
            self.userData()
            },
            
            withCancelBlock: { error in
                print(error.description)
                
    })
    
}
    func userData() {
        userScore = String(score1)
        self.scoreLabel.text = "Congratulations you scored \(userScore) points"
        
        let timerScore = score1
        
        let newScore: Dictionary<String, AnyObject> = [
            "timerScore": timerScore,
            "author": currentUserName]
        
        Data.data.createNewScore(newScore)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
