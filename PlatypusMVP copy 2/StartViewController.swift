//
//  StartViewController.swift
//  PlatypusMVP
//
//  Created by Jamar Gibbs on 2/15/16.
//  Copyright © 2016 M1ndful M3d1a. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    
    @IBOutlet weak var challengeImageOutlet: UIImageView!
    
    @IBOutlet weak var badgeImageOutlet: UIImageView!
    
    var challenges : Challenges?
    
        override func viewDidLoad() {
        super.viewDidLoad()

            self.challengeImageOutlet.image = challenges?.image
            self.badgeImageOutlet.image = challenges?.badge
            
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

