//
//  CreateAccountViewController.swift
//  PlatypusMVP
//
//  Created by Jamar Gibbs on 2/15/16.
//  Copyright © 2016 M1ndful M3d1a. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {

    @IBOutlet weak var createEmailField: UITextField!
    
    @IBOutlet weak var createUserField: UITextField!
    
    @IBOutlet weak var createPasswordField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func createAccount(sender: AnyObject) {
        
        let username = createUserField.text
        let email = createEmailField.text
        let password = createPasswordField.text
   
    if username != "" && email != "" && password != "" {
    
    // Set Email and Password for the New User.
    
    Data.data.BASE_REF.createUser(email, password: password, withValueCompletionBlock: { error, result in
    print(result);
    
    if error != nil {
    
    // There was a problem.
    self.signupErrorAlert("Nope!", message: "No go, Try again")
    
    } else {
    
    // Create and Login the New User with authUser
    Data.data.BASE_REF.authUser(email, password: password, withCompletionBlock: {
    err, authData in
    
    let user = ["provider": authData.provider!, "email": email!, "username": username!]
    
    // Seal the deal in DataService.swift.
    Data.data.createNewAccount(authData.uid, user: user)
    })
    
    // Store the uid for future access - handy!
    NSUserDefaults.standardUserDefaults().setValue(result ["uid"], forKey: "uid")
    
    // Enter the app.
    self.performSegueWithIdentifier("NewUserLoggedIn", sender: nil)
    }
    })
    
    } else {
    
    signupErrorAlert("Nope!", message: "You forgot to enter your email, password, or a username.")
    }
    
}
func signupErrorAlert(title: String, message: String) {
    
    // Called upon signup error to let the user know signup didn't work.
    
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
