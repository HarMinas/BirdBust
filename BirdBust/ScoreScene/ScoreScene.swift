//
//  ScoreScene.swift
//  BirdBust
//
//  Created by Harutyun Minasyan on 12/23/17.
//  Copyright © 2017 Harutyun Minasyan. All rights reserved.
//

import SpriteKit

class ScoreScene: SKScene
{
// ///////////////////////////////////////////////// Instance Variabales //////////////////////////////////////////////////
    private var totalScore: Int = 0
    private var feather: GameEndFeathers!
    
/// Layout the Feathers
    
    func addTheFeathers(featherScores: [(FeatherType, Int)])
    {
        var multiplier = 1
        totalScore = 0
        var position = CGPoint(x: selfWidth()/3, y: selfHeight()*(3/4))
      for (featherType, score) in featherScores
        {
            feather = GameEndFeathers(score: score, multiplier: multiplier, type: featherType)
            print(featherType)
            feather.position = position
            self.addChild(feather!)
            position.y -= 70
            totalScore += feather.getResult()
            multiplier *= 2
            multiplier += 2
            self.run(SKAction.wait(forDuration: 3))
        }
        self.backgroundColor = .black
    }
    
    func getTotalScore()->Int
    {
        return totalScore
    }
 
}
