//
//  Feather.swift
//  BirdBust
//
//  Created by Harutyun Minasyan on 12/13/17.
//  Copyright © 2017 Harutyun Minasyan. All rights reserved.
//

import SpriteKit


class FeatherLabel: SKNode
{
    // ////////////////////////////////////////////// INSTANCE VARIABLES ///////////////////////////////////////////////
    private var featherLabel: SKSpriteNode!
    private var count: SKLabelNode!
    private var score: Int = 0

    
    
    
    
    private func initiateFeatherLabel(type: FeatherType)
    {
        count = SKLabelNode(text: "0")
        switch type
        {
        case .blue: featherLabel = SKSpriteNode(imageNamed: "blueFeather")
        featherLabel.name = "blueFeatherLabel"
        count.fontColor = UIColor(red: 0.251, green: 0.729, blue: 0.894, alpha: 1)
        case .red: featherLabel = SKSpriteNode(imageNamed: "redFeather")
        featherLabel.name = "redFeatherLabel"
        count.fontColor = UIColor(red: 0.839, green: 0, blue: 0, alpha: 1)
        case .yellow: featherLabel = SKSpriteNode(imageNamed: "yellowFeather")
        featherLabel.name = "yellowFeatherLabel"
        count.fontColor = UIColor(red: 0.957, green: 0.906, blue: 0.333, alpha: 1)
        case .gray: featherLabel = SKSpriteNode(imageNamed: "grayFeather")
        featherLabel.name = "grayFeatherLabel"
        count.fontColor = UIColor(red: 0.757, green: 0.757, blue: 0.757, alpha: 1)
        }
        
    }
    
    private func layoutPositions()
    {
        featherLabel.position = CGPoint(x: 0, y: 0)
        featherLabel.anchorPoint = CGPoint(x: 0, y: 0)
        featherLabel.setScale(0.2)
        
        count.position = CGPoint(x: featherLabel.size.width + 10 , y: self.frame.origin.y)
        count.fontSize = 25
        count.fontName = "AmericanTypewriter-Bold"
        
        count.verticalAlignmentMode = .bottom
        count.horizontalAlignmentMode = .left
    }


    
    // ////////////////////////////////////////////// CREATING FEATHERS ///////////////////////////////////////////////////////

    private func attachPhysics()
    {
        featherLabel.physicsBody = SKPhysicsBody(circleOfRadius: featherLabel.size.width)
        featherLabel.physicsBody?.categoryBitMask = Masks.featherLabelCatMask
        featherLabel.physicsBody?.contactTestBitMask = Masks.featherCatMask
        featherLabel.physicsBody?.collisionBitMask = Masks.featherCatMask
        featherLabel.physicsBody?.affectedByGravity = false
        featherLabel.physicsBody?.isDynamic = false
    }
    
    // ////////////////////////////////////////////// CREATING FEATHERS FOR INTERFACE ////////////////////////////////////////////////////
    func createFeather(featherType: FeatherType)
    {
        initiateFeatherLabel(type: featherType)
        layoutPositions()
        attachPhysics()
        
        self.addChild(featherLabel)
        self.addChild(count)
    }
    
    ///Called when the feather count changes
  
    
    
    // ///////////////////////////////////////////   FEATHER ANIMATION    /////////////////////////////////////////////////////////////
    ///Scales the feather label up and down upon contact with the feather of the same color
    func animateFeather()
    {
        let scaleUp = SKAction.scale(by: 1.2, duration: 0.20)
        let scaleDown = SKAction.scale(by: 1/1.2, duration: 0.20)
        let delay = SKAction.wait(forDuration: 0.05)
        let scaleSequence = SKAction.sequence([scaleUp, delay, scaleDown])
        featherLabel.run(scaleSequence)
    }
    
    // ///////////////////////////////////////////  GETTERS AND SETTERS    /////////////////////////////////////////////////////////////
    ///Return the frame rectange of the score label
    func getFramesTop()->CGFloat
    {
        return count.frame.maxY
    }
    
    /// Get the feather Count
    func getFeatherCount()-> Int
    {
        return score
    }
    /// increases the score count by INT
    func setScore(by amount: Int)
    {
        score += amount
        count.text = "\(score)"
    }
    
 
    // /////////////////////////////////////////// FEATHER INITIALIZER  /////////////////////////////////////////////////////////////
 
    init(type: FeatherType)
    {
        super.init()
        createFeather(featherType: type)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
    }
 
    
}

