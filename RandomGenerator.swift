//
//  RandomGenerator.swift
//  BirdBust
//
//  Created by Harutyun Minasyan on 12/11/17.
//  Copyright © 2017 Harutyun Minasyan. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit




/////////////////////////////////////////////// BIRD MOVEMENT ////////////////////////////////////////////////////

    //bird Spawn
    func randomFeatherRotation()-> CGFloat
    {
        return CGFloat( 25 + arc4random_uniform(10))
    }
    
    


