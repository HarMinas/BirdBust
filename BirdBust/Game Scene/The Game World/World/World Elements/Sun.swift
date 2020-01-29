//
//  Sun.swift
//  BirdBust
//
//  Created by Harutyun Minasyan on 11/27/17.
//  Copyright © 2017 Harutyun Minasyan. All rights reserved.
//


import UIKit
import SpriteKit

class Sun: SKNode {
// //////////////////////////////////////////////////// INSTANCE VARIABLES //////////////////////////////////////////////
    private var sun: SKSpriteNode!
    private var sunFire: SKEmitterNode!
    
// /////////////////////////////////////////////// SUN MOVEMENT /////////////////////////////////////////////////////
    func moveTheSun()
    {
        let movement = SKAction.moveBy(x: -700, y: -50, duration: 500)
        sun.run(movement)
        sunFire.run(movement)
    }
// //////////////////////////////////////////////// INITIALIZERs /////////////////////////////////////////////////////////
    init(position: CGPoint, imageNamed: String)
    {
        super.init()
    
        sun = SKSpriteNode(imageNamed: imageNamed)
        sun.position = position
        sun.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        sun.zPosition = ZPositions.sunZPos
        sun.setScale(1)
        
        sunFire = SKEmitterNode(fileNamed: "fireOfSun")
        sunFire.position = position
        sunFire.zPosition = ZPositions.sunFireZPos
        sunFire!.setScale(0.25)
        
        
        self.addChild(sun)
        self.addChild(sunFire)
        
    }

///Required Initializer
    required init?(coder aDecoder: NSCoder) {
        super.init()
    }
    
}
