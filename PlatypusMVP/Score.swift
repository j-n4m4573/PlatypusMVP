//
//  Score.swift
//  PlatypusMVP
//
//  Created by Jamar Gibbs on 2/23/16.
//  Copyright © 2016 M1ndful M3d1a. All rights reserved.
//

import Foundation
import Firebase

class Score {
    private var _scoreRef: Firebase!
    
    private var _scoreKey: String!
    private var _timerScore: Int!
    private var _username: String!

    var scoreKey: String {
        return _scoreKey
    }

    var timerScore: Int {
        return _timerScore
    }
    
    var username: String {
        return _username
    }
    
    init(key:String, dictionary: Dictionary<String, AnyObject>) {
        self._scoreKey = key
        
        
        if let time = dictionary["time"] as? Int {
                self._timerScore = time
        }
        
        if let user = ["player"] as? String {
                self._username = user
        } else {
                self._username = ""
        }
        
        self._scoreRef = Data.data.SCORE_REF.childByAppendingPath(self._scoreKey)
    }
}

        
        
        
        

