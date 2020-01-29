//
//  StreakStars.swift
//  BirdBust
//
//  Created by Harutyun Minasyan on 12/21/17.
//  Copyright © 2017 Harutyun Minasyan. All rights reserved.
//

import SpriteKit


class StreakStars: SKNode
{
// /////////////////////////////////////////////////   Instance Variables  /////////////////////////////////////////////
    private var streakStarLabel: SKSpriteNode!
    private var numberOfStars: Int!
    
    
    
    
// /////////////////////////////////////////////////  Instance Methods /////////////////////////////////////////////
/// Changes the texture of the streakStarLabel Sprite
    private func changeTheTexture()
    {
        streakStarLabel.texture = SKTexture(imageNamed: "stars\(numberOfStars!)")
    }
    
/// animates the star and adds a star to the stars
    func addAStar()
    {
        numberOfStars! += 1
        let scaleUp = SKAction.scale(by: 1.3, duration: 0.1)
        let scaleDown = SKAction.scale(by: 1/1.3, duration: 0.1)
        let changingTheTexture = SKAction.run {
            () in
            weak var weakSelf = self
            weakSelf!.changeTheTexture()
        }
        let addStarSequence = SKAction.sequence([scaleUp, changingTheTexture, scaleDown])
        streakStarLabel.run(addStarSequence)
    }
    
/// Resets the starLabel into 0 stars again
    func refreshStars()
    {
        numberOfStars = 0
        streakStarLabel.texture = SKTexture(imageNamed: "stars\(numberOfStars!)")
        
    }
/// returns a bool indicating whether there is a streak or not
    func isStreakComplete()->Bool
    {
        if numberOfStars == 3
        {
            return true
        }
        else
        {
            return false
        }
    }
    
// /////////////////////////////////////////////// INITIALIZERS ///////////////////////////////////////////
    init(position: CGPoint)
    {
        super.init()
        numberOfStars = 0
        streakStarLabel = SKSpriteNode(imageNamed: "stars\(numberOfStars!)")
        streakStarLabel.position = CGPoint(x: selfWidth()/2, y: selfHeight()/2)
        streakStarLabel.zPosition = 20
        streakStarLabel.setScale(0.5)
        
        
        self.position = position
        self.addChild(streakStarLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
