//
//  Data.swift
//  PlatypusMVP
//
//  Created by Jamar Gibbs on 2/22/16.
//  Copyright © 2016 M1ndful M3d1a. All rights reserved.
//

import Foundation
import Firebase


class Data {
    static let data = Data()
    
    private var _BASE_REF = Firebase(url: "\(BASE_URL)")
    private var _USER_REF = Firebase(url: "\(BASE_URL)/users")
    private var _MEDIA_REF = Firebase(url: "\(BASE_URL)/media")
    
    var BASE_REF: Firebase {
        return _BASE_REF
    }
    
    var USER_REF: Firebase {
        return _USER_REF
    }
    
    var CURRENT_USER_REF: Firebase {
        let userID = NSUserDefaults.standardUserDefaults().valueForKey("uid") as! String
        
        let currentUser = Firebase(url: "\(BASE_REF)").childByAppendingPath("users").childByAppendingPath(userID)
        
        return currentUser!
    }
    
    var MEDIA_REF: Firebase {
        return _MEDIA_REF
    }
    
    func createNewAccount(uid: String, user: Dictionary<String, String>) {
        
        // A User is born.
        USER_REF.childByAppendingPath(uid).setValue(user)
}


}
