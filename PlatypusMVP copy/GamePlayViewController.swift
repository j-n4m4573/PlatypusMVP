//
//  GamePlayViewController.swift
//  PlatypusMVP
//
//  Created by Jamar Gibbs on 2/15/16.
//  Copyright © 2016 M1ndful M3d1a. All rights reserved.
//

import UIKit

class GamePlayViewController: UIViewController, UIAlertViewDelegate {

    @IBOutlet weak var cardView: UIImageView!
    
    @IBOutlet weak var buttonOne: UIButton!
    
    @IBOutlet weak var buttonTwo: UIButton!
    
    var counter: Int = 0
        
        var brew : [Brews] = [ Brews(image: UIImage(named:"Shock Top")!, name: "Shock Top"),Brews(image:UIImage(named:"Modelo")!, name: "Modelo"), Brews(image: UIImage(named:"Keystone")!, name: "Keystone"),Brews(image: UIImage(named:"Guiness")!, name: "Guiness"),Brews(image: UIImage(named:"Fosters")!, name: "Fosters"),Brews(image: UIImage(named:"Heineken")!, name: "Heineken"),Brews(image: UIImage(named:"Pabst")!, name: "Pabst"), Brews(image: UIImage(named:"Fat Tire")!, name: "Fat Tire")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.cardView.image = self.brew[0].image
        
        self.buttonOne.setTitle(self.brew[0].name, forState: UIControlState.Normal)
        self.buttonTwo.setTitle(self.brew[1].name, forState: UIControlState.Normal)
    }
    
    func buttonOneTapped(sender:UIButton) {
        let buttons = [self.buttonOne, self.buttonTwo]
       
        counter++
        
        let alert = UIAlertController(title:"Congrats!", message:"Congratulations, you have just memorized all the beers in the world", preferredStyle: UIAlertControllerStyle.Alert)
        let acceptAction = UIAlertAction(title:"I am a Champion", style: .Default) { (_) -> Void in
        self.performSegueWithIdentifier("Completed", sender:self)
            
        }
            alert.addAction(acceptAction)
        
        if self.brew[counter].name == "Fat Tire" {
                presentViewController(alert, animated: true, completion: { () -> Void in
                    self
                })
        }
        
        self.cardView.image = self.brew[counter].image
        
        self.buttonOne.backgroundColor = (UIColor .whiteColor())
        self.buttonTwo.backgroundColor = (UIColor .whiteColor())
        
        buttons[Int(arc4random_uniform(UInt32(buttons.count)))].setTitle(self.brew[counter].name, forState: UIControlState.Normal)
        
        print(brew)
    }
    
    @IBAction func buttonTapped(sender: UIButton) {
        
        if self.brew[counter].name == sender.titleLabel?.text {
            
        self.buttonOneTapped(sender)
            
        } else { sender.backgroundColor =
            (UIColor .redColor())
                }
        }
    
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

