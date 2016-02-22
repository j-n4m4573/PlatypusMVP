//
//  Brews.swift
//  PlatypusMVP
//
//  Created by Jamar Gibbs on 2/15/16.
//  Copyright © 2016 M1ndful M3d1a. All rights reserved.
//

import UIKit
import Foundation

class Brews: NSObject {
    var image : UIImage
    var name  : String
    
    init(image:UIImage, name: String){
        self.image = image
        self.name = name
    }

}

