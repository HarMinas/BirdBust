//
//  GameEndFeathers.swift
//  BirdBust
//
//  Created by Harutyun Minasyan on 12/23/17.
//  Copyright © 2017 Harutyun Minasyan. All rights reserved.
//

import SpriteKit
import UIKit

class GameEndFeathers: SKNode
{
// //////////////////////////////////////////////////////// INSTANCE VARIABLES ////////////////////////////////////////////////////////
    private var feather: SKSpriteNode!
    private var scoreLabel: SKLabelNode!
    private var operationLabel: SKLabelNode!
    private var score: Int!
    private var result: Int!
    private var multiplier: Int!

    
// /////////////////////////////////////////// Initiation and Setup of The Feathers ////////////////////////////////////////////////////////

    private func initiateFeatherLabel(type: FeatherType, position: CGPoint)
    {
        switch type
        {
        case .blue: feather = SKSpriteNode(imageNamed: "blueFeather")
        case .red: feather = SKSpriteNode(imageNamed: "redFeather")
        case .yellow: feather = SKSpriteNode(imageNamed: "yellowFeather")
        case .gray: feather = SKSpriteNode(imageNamed: "grayFeather")
        }
        feather.setScale(0.3)
        feather.anchorPoint = CGPoint(x: 0, y: 0.5)
        feather.position = position
        
        self.addChild(feather)
    }

    
// /////////////////////////////////////////// Initiation and Setup of The Score ////////////////////////////////////////////////////////

    private func initiateScoreLabel(position: CGPoint)
    {
        scoreLabel = SKLabelNode(text: String(score!))
        scoreLabel.fontColor = .white
        scoreLabel.fontName = "AmericanTypewriter-Bold"
        scoreLabel.fontSize = 30
        scoreLabel.position = position
        
        self.addChild(scoreLabel)
    }

    
// /////////////////////////////////////////// Initiation and Setup of The Operation Label /////////////////////////////////////////////////

    private func initiateOperationLabel( _ position: CGPoint)
    {
        result = score * multiplier
        operationLabel = SKLabelNode(text: "X \(multiplier!) = \(result!)")
        operationLabel.fontColor = .white
        operationLabel.fontName = "AmericanTypewriter-Bold"
        operationLabel.fontSize = 30
        operationLabel.horizontalAlignmentMode = .left
        operationLabel.verticalAlignmentMode = .bottom
        operationLabel.position = position
    
        self.addChild(operationLabel)
    }
    
// /////////////////////////////////////////// Getters ////////////////////////////////////////////////////////////////////////
    
    func getResult()->Int
    {
        return result!
    }
    
// /////////////////////////////////////////// CUSTOM INITIALIZER ////////////////////////////////////////////////////////////////////////

    init(score: Int, multiplier: Int, type: FeatherType)
    {
        super.init()
        var position = CGPoint(x: 0, y: 0)
        self.score = score
        self.multiplier = multiplier
        result = score * multiplier
        initiateScoreLabel(position: position)
        position.x =  scoreLabel.frame.maxX
        initiateFeatherLabel(type: type, position: position)
        position.x = feather.frame.maxX
        initiateOperationLabel(position)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
