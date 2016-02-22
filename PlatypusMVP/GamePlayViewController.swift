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
    @IBOutlet weak var timerOutlet: UILabel!
    @IBOutlet weak var label: UILabel!

    var timer = NSTimer()
    var seconds = 30
    var counter: Int = 0
    
    let animationDuration: NSTimeInterval = 0.20
    let switchingInterval: NSTimeInterval = 1000
    
    
    var brew : [Brews] = [ Brews(image: UIImage(named:"Shock Top")!, name: "Shock Top"),Brews(image:UIImage(named:"Modelo")!, name: "Modelo"), Brews(image: UIImage(named:"Keystone")!, name: "Keystone"),Brews(image: UIImage(named:"Guiness")!, name: "Guiness"),Brews(image: UIImage(named:"Fosters")!, name: "Fosters"),Brews(image: UIImage(named:"Heineken")!, name: "Heineken"),Brews(image: UIImage(named:"Pabst")!, name: "Pabst"), Brews(image: UIImage(named:"Fat Tire")!, name: "Fat Tire"),Brews(image: UIImage(named: "Sierra Nevada")!,name: "Sierra Nevada" ),Brews(image: UIImage(named: "Sapporo")!,name: "Sapporo"),
        Brews(image: UIImage(named: "Stella Artois")!,name: "Stella Artois"),
        Brews(image: UIImage(named: "Becks")!, name: "Becks"),
        Brews( image: UIImage(named: "New Castle")!, name: "New Castle"),
        Brews( image: UIImage(named: "Lagunitas")!,name: "Lagunitas"),Brews(image: UIImage(named:"Shock Top")!, name: "Shock Top"),
        ]
    
    func setupGame()  {
                seconds = 50
                timerOutlet.text = "Time: \(seconds)"
    
        timer = NSTimer.scheduledTimerWithTimeInterval(0.06, target: self, selector: "subtractTime", userInfo: nil, repeats: true)
        }
    
    func restartGame(){
            timer.invalidate()
            setupGame()
            self.cardView.image = self.brew[0].image
            counter = 0
            self.buttonOne.titleLabel?.text = self.brew[0].name
            self.buttonTwo.titleLabel?.text = self.brew[1].name

        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGame()
        
        self.buttonOne.layer.borderColor = (UIColor .blueColor()).CGColor
        self.buttonOne.layer.borderWidth = 1.5
        self.buttonTwo.layer.borderColor = (UIColor .blueColor()).CGColor
        self.buttonOne.layer.cornerRadius = 8.0
        self.buttonOne.clipsToBounds = true
        self.buttonOne.backgroundColor = (UIColor .whiteColor())
        self.buttonTwo.layer.borderWidth = 1.5
        self.buttonTwo.layer.cornerRadius = 8.0
        self.buttonTwo.clipsToBounds = true
        self.buttonTwo.backgroundColor = (UIColor .whiteColor())
        
        self.label.text = ("\(counter)/13")

        self.cardView.image = self.brew[0].image
        
        self.buttonOne.setTitle(self.brew[0].name, forState: UIControlState.Normal)
        self.buttonTwo.setTitle(self.brew[1].name, forState: UIControlState.Normal)
        }
    
         func subtractTime(){
            seconds--
            timerOutlet.text = "0:\(seconds)"
            
            if (seconds == 0) {
                timer.invalidate()
                let alert = UIAlertController(title: "Time is up!",
                    message: "You lose",
                    preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Try Again", style: UIAlertActionStyle.Default, handler: {
                    action in self.restartGame()
                }))
                presentViewController(alert, animated: true, completion:nil)
            }
    }

    func animateImageView() {
        CATransaction.begin()
        CATransaction.setAnimationDuration(animationDuration)
        CATransaction.setCompletionBlock {
            let delay = dispatch_time(DISPATCH_TIME_NOW, Int64(self.switchingInterval * NSTimeInterval(NSEC_PER_SEC)))
            dispatch_after(delay, dispatch_get_main_queue()) {
                self.animateImageView()
            }
    }
        let transition = CATransition()
        transition.type = kCATransitionPush
        
        self.cardView.layer.addAnimation(transition, forKey: kCATransition)
        self.cardView.image = self.brew[counter].image
        
        CATransaction.commit()
    }

    func buttonRightTapped(sender:UIButton) {
        var buttons = [self.buttonOne, self.buttonTwo]
       
        counter++
       
        timer.invalidate()
        setupGame()
        
        let alert = UIAlertController(title:"Congrats!", message:"Congratulations, you have just memorized all the beers in the world", preferredStyle: UIAlertControllerStyle.Alert)
        let acceptAction = UIAlertAction(title:"I am a Champion", style: .Default) { (_) -> Void in
        self.performSegueWithIdentifier("Completed", sender:self)
        }
            alert.addAction(acceptAction)
        
        if self.brew[counter].image == (UIImage(named:"Shock Top")) {
                presentViewController(alert, animated: true, completion: { () -> Void in
                    self
                })
            timer.invalidate()
        }
        
        self.cardView.image = self.brew[counter].image
        
        self.buttonOne.backgroundColor = (UIColor .whiteColor())
        self.buttonTwo.backgroundColor = (UIColor .whiteColor())
        
        
        self.label.text = ("\(counter)/13")
        
        self.label.textColor = UIColor .whiteColor()
        
        self.animateImageView()
    
    let rightButton: UIButton! = buttons[Int(arc4random_uniform(UInt32(buttons.count)))]
            
        rightButton.setTitle(self.brew[counter].name, forState: UIControlState.Normal)
    
        while rightButton.titleLabel?.text != self.buttonOne.titleLabel?.text {
            
            
            self.buttonOne.titleLabel?.text = self.brew[Int(arc4random_uniform(UInt32(self.brew.count)))].name
            
        }
        
        
        while rightButton.titleLabel?.text != self.buttonTwo.titleLabel?.text {
            
            
            self.buttonTwo.titleLabel?.text = self.brew[Int(arc4random_uniform(UInt32(self.brew.count)))].name
            
        }
        
        while self.buttonOne.titleLabel?.text == self.buttonTwo.titleLabel?.text {
            
            self.buttonOne.titleLabel?.text = self.brew[Int(arc4random_uniform(UInt32(self.brew.count)))].name
            self.buttonTwo.titleLabel?.text = self.brew[Int(arc4random_uniform(UInt32(self.brew.count)))].name
        }
        
        
        //take the other button set that title to some random title in your array and put this in a while loop to make sure the titles dont match
        
    }
    
    func buttonWrongTapped(sender: UIButton) {
        
        timer.invalidate()
        setupGame()
        
        counter = 0
        
        self.cardView.image = self.brew[0].image
        
        self.buttonOne.setTitle(self.brew[0].name, forState: UIControlState.Normal)
        
        self.buttonTwo.setTitle(self.brew[1].name, forState: UIControlState.Normal)
        
        self.buttonOne.backgroundColor = (UIColor .whiteColor())
        
        
        self.buttonTwo.backgroundColor = (UIColor .whiteColor())
        
        self.label.text = "\(counter)/13"
        
        
    }
    

    @IBAction func buttonTapped(sender: UIButton) {
        
        if self.brew[counter].name == sender.titleLabel?.text {
            
        self.buttonRightTapped(sender)
            
            self.buttonOne.titleLabel?.text = self.brew[Int(arc4random_uniform(UInt32(self.brew.count)))].name
            self.buttonTwo.titleLabel?.text = self.brew[Int(arc4random_uniform(UInt32(self.brew.count)))].name
            
            self.label.textColor = UIColor .blueColor()
            
        } else {
            
            let color: CABasicAnimation = CABasicAnimation(keyPath: "backgroundColor")
            color.fromValue = UIColor.whiteColor().CGColor
            color.toValue = UIColor.redColor().CGColor
            color.duration = 0.5
            color.autoreverses = true
            sender.layer.backgroundColor = UIColor.whiteColor().CGColor
            sender.layer.addAnimation(color, forKey: "")
            
            sender.backgroundColor = (UIColor .redColor())

            self.buttonWrongTapped(sender)
            
            self.label.textColor = UIColor.blueColor()
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

