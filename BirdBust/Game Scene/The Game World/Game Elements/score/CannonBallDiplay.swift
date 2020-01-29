//
//  CannonBallDiplay.swift
//  BirdBust
//
//  Created by Harutyun Minasyan on 12/23/17.
//  Copyright © 2017 Harutyun Minasyan. All rights reserved.
//

import SpriteKit

class CannonBallDisplay: SKNode
{
    // ///////////////////////////////////////// Instance Variables //////////////////////////////////////////////
    private var cannonBallLabel: SKSpriteNode!
    private var cannonBallCount: SKLabelNode!
    private var cannonBalls: Int
    
    
    // ///////////////////////////////////////// Setters ////////////////////////////////////////////////////
    func changeCannonBalls(amount: Int)
    {
        cannonBalls += amount
        cannonBallCount.text = "\(cannonBalls) Left."
    }
    // ///////////////////////////////////////// Getters ////////////////////////////////////////////////////

    // ///////////////////////////////////////// Initializer ////////////////////////////////////////////////////
    init(numberOfCannonBalls: Int)
    {
        cannonBalls = numberOfCannonBalls
        super.init()
        cannonBallLabel = SKSpriteNode(imageNamed: "cannonBalls")
        cannonBallLabel.setScale(0.1)
        
        
        cannonBallCount = SKLabelNode(text: "\(cannonBalls) Left.")
        cannonBallCount.fontSize = 25
        cannonBallCount.position = CGPoint(x: cannonBallLabel.size.width, y: self.frame.origin.y)
        cannonBallCount.horizontalAlignmentMode = .left
        cannonBallCount.verticalAlignmentMode = .center
        cannonBallCount.fontColor = .black
        cannonBallCount.fontName = "AmericanTypewritter"
        
        self.addChild(cannonBallLabel)
        self.addChild(cannonBallCount)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
// END OF CLASS
