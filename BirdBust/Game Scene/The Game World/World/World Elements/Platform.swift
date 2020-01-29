//
//  Platform.swift
//  BirdBust
//
//  Created by Harutyun Minasyan on 11/27/17.
//  Copyright © 2017 Harutyun Minasyan. All rights reserved.
//

import UIKit
import SpriteKit

class Platform: SKNode {
    
// //////////////////////////////////////////////////// INSTANCE VARIABLES //////////////////////////////////////////////
    private var platform: SKSpriteNode!

// //////////////////////////////////////////////// INITIALIZERs /////////////////////////////////////////////////////////
///Initializer - Sets the image, the position and the scale of a platform
    init(position: CGPoint, scale: CGFloat, imageNamed: String)
    {
        super.init()
        platform = SKSpriteNode(imageNamed: imageNamed)
        platform.position = position
        platform.zPosition = ZPositions.platformZPos
        platform.setScale(0.5)
        platform.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.addChild(platform)
    }

    
///Required Iitializer
    required init?(coder aDecoder: NSCoder)
    {
        super.init()
    }
}

