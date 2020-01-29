//
//  World.swift
//  BirdBust
//
//  Created by Harutyun Minasyan on 11/27/17.
//  Copyright © 2017 Harutyun Minasyan. All rights reserved.
//

import UIKit
import SpriteKit

class World: SKNode {
    
///Instance variables
    private var background: Background!
    private var sun: Sun!
    private var clouds: Clouds!
    private var platform: Platform!
    
    
///Custom Initialization
    init(sunPosition: CGPoint, platformPosition: CGPoint, backgroundSize: CGSize)
    {
        super.init()
        background = Background(size: backgroundSize)
        sun = Sun(position: sunPosition, imageNamed: "SunPic")
        clouds = Clouds()
        platform = Platform(position: platformPosition, scale: 0.5, imageNamed: "platform")
        
    
        self.addChild(background)
        self.addChild(sun)
        self.addChild(platform)
        self.addChild(clouds)
        
        clouds.addClouds()
        sun.moveTheSun()
    }
    
///Required Initializer
    required init?(coder aDecoder: NSCoder) {
        super.init()
    }

   

    
}
