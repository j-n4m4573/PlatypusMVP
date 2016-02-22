//
//  Challenges.swift
//  PlatypusMVP
//
//  Created by Jamar Gibbs on 2/15/16.
//  Copyright © 2016 M1ndful M3d1a. All rights reserved.
//

import UIKit

class Challenges: NSObject {
    var image : UIImage
    var name  : String
    var challengeInfo : String
    var badge : UIImage
    
    init(image:UIImage, name:String, challengeInfo:String, badge:UIImage){
       
        self.name = name
        self.image = image
        self.challengeInfo = challengeInfo
        self.badge = badge
        
    }
}

