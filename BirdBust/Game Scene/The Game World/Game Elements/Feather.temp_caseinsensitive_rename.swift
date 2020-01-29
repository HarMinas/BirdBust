//
//  Feathers.swift
//  BirdBust
//
//  Created by Harutyun Minasyan on 12/12/17.
//  Copyright © 2017 Harutyun Minasyan. All rights reserved.
//

import SpriteKit


class Feather: SKNode
{
///////////////////////////////////////////////// INSTANCE VARIABLES ///////////////////////////////////////////////
    private var feather: SKSpriteNode!
    private var count: SKLabelNode!
    
    
    
///////////////////////////////////////////////// CREATING FEATHERS ///////////////////////////////////////////////////////
    private func createFeather(featherType: String)
    {
        count = SKLabelNode(text: "0")
        count.fontSize = 25
        count.verticalAlignmentMode = .center
        count.horizontalAlignmentMode = .left
        
        
    
        switch featherType
        {
        case "blueFeather": feather = SKSpriteNode(imageNamed: "blueFeather")
                count.fontColor = SKColor(displayP3Red: 0, green: 0, blue: 255, alpha: 1)
        case "redFeather": feather = SKSpriteNode(imageNamed: "redFeather")
                count.fontColor = UIColor(red: 185, green: 29, blue: 24, alpha: 1)
        case "yellowFeather": feather = SKSpriteNode(imageNamed: "yellowFeather")
                count.fontColor = UIColor(red: 251, green: 208, blue: 51, alpha: 1)
        case "blueFeather": feather = SKSpriteNode(imageNamed: "blueFeather")
                count.fontColor = UIColor(red: 149, green: 152, blue: 157, alpha: 1)
        default: break
        }
        
        feather.position = CGPoint(x: 0, y: 0)
        feather.setScale(0.2)
        count.position = CGPoint(x: feather.size.width, y: self.frame.origin.y)
        
        
        self.addChild(feather)
        self.addChild(count)
    }
    
    
//////////////////////////////////////////////   FEATHER ANIMATION    /////////////////////////////////////////////////////////////
    
    func animateFeather()
    {
        let scaleUp = SKAction.scale(by: 2, duration: 0.25)
        let scaleDown = SKAction.scale(by: 0.5, duration: 0.25)
        let delay = SKAction.wait(forDuration: 0.05)
        let scaleSequence = SKAction.sequence([scaleUp, delay, scaleDown])
        self.run(scaleSequence)
    }
    
//////////////////////////////////////////////  GETTERS AND SETTERS    /////////////////////////////////////////////////////////////


////////////////////////////////////////////// FEATHER INITIALIZER  /////////////////////////////////////////////////////////////
    init(type: String)
    {
        super.init()
        createFeather(featherType: type)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
