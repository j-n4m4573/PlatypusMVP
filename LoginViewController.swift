//
//  LoginViewController.swift
//  PlatypusMVP
//
//  Created by Jamar Gibbs on 2/15/16.
//  Copyright © 2016 M1ndful M3d1a. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        // If we have the uid stored, the user is already logged in - no need to sign in again!
        if NSUserDefaults.standardUserDefaults().valueForKey("uid") != nil && Data.data.CURRENT_USER_REF.authData != nil {
            self.performSegueWithIdentifier("LoggedIn", sender: nil)
        }
    }
    
    @IBAction func tryLoggin(sender: AnyObject) {
        let email = emailField.text
        let password = passwordField.text
        
        if email != "" && password != "" {
            
            // Login with the Firebase's authUser method
            
            Data.data.BASE_REF.authUser(email, password: password, withCompletionBlock: { error, authData in
                
                if error != nil {
                    print("This is the Error!", error)
                    self.loginErrorAlert("Nope!", message: "Wrong username and password.")
                } else {
                    
                    // Be sure the correct uid is stored.
                    
                    NSUserDefaults.standardUserDefaults().setValue(authData.uid, forKey: "uid")
                    
                    // Enter the app!
                    
                    self.performSegueWithIdentifier("LoggedIn", sender: nil)
                }
            })
            
        } else {
            
            // There was a problem
            
            loginErrorAlert("Nope!", message: "You forgot to enter your email and password.")
        }
        
    }
    
    func loginErrorAlert(title: String, message: String) {
        
        // Called upon login error to let the user know login didn't work.
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let action = UIAlertAction(title: "Ok", style: .Default, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
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
