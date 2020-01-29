//
//  background.swift
//  BirdBust
//
//  Created by Harutyun Minasyan on 11/27/17.
//  Copyright © 2017 Harutyun Minasyan. All rights reserved.
//


import UIKit
import SpriteKit

class Background: SKNode {
    
// //////////////////////////////  INSTANCE VARIABLES  /////////////////////////////////////////
    var background1: SKSpriteNode!
    var background2: SKSpriteNode!
    var background3: SKSpriteNode!
    
// //////////////////////////////  ADDING THE BACKGROUND  /////////////////////////////////////////
/// Adding the background images and positioning them at different zpositions so things can pass through them.
    func addBackground(size: CGSize)
    {
        background1 = SKSpriteNode(imageNamed: "background1L1")
        background2 = SKSpriteNode(imageNamed: "background1L2")
        background3 = SKSpriteNode(imageNamed: "background1L3")
        
        background1.size = size
        background2.size = size
        background3.size = size
        
        background1.zPosition = ZPositions.backgroundZPos1
        background2.zPosition = ZPositions.backgroundZPos2
        background3.zPosition = ZPositions.backgroundZPos3
        
        background1.anchorPoint = CGPoint(x: 0, y: 0)
        background2.anchorPoint = CGPoint(x: 0, y: 0)
        background3.anchorPoint = CGPoint(x: 0, y: 0)

        self.addChild(background1)
        self.addChild(background2)
        self.addChild(background3)
    }

    
// //////////////////////////////  Custom Initializer /////////////////////////////////////////
    init(size: CGSize)
   {
        super.init()
        addBackground(size: size)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
}
// END OF CLASS
