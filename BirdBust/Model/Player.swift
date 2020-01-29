//
//  GameModel.swift
//  BirdBust
//
//  Created by Harutyun Minasyan on 11/27/17.
//  Copyright © 2017 Harutyun Minasyan. All rights reserved.
//

import Foundation


class Player {
    
    
// ////////////////////////////////////////////////Instance variables/////////////////////////////////////////
    private var name: String?
    private var bestScore: Int
    private var currentScore: Int
    private var numberOfCannonBalls: Int
    private var streak: Int
    
// ///////////////////////////////////////////////////Initializer////////////////////////////////////////////
    init(bestScore: Int, numberOfCannonBalls: Int, playerName: String?)
    {
        self.bestScore = bestScore
        self.numberOfCannonBalls = numberOfCannonBalls
        self.name = playerName
        self.streak = 0
        self.currentScore = 0
    }
    
// ////////////////////////////////////////////////////Getters////////////////////////////////////////////////
///number of Cannon Balls
    func getNumberOfCannonBalls()->Int
    {
        return numberOfCannonBalls
    }
///get best Score
    func getBestScore()->Int
    {
        return bestScore
    }
///player Name
    func getPlayerName()->String?
    {
        return name
    }
///streak
    func getStreak()->Int
    {
        return streak
    }
///Current Score
    func getCurrentScore()->Int
    {
        return currentScore
    }
// //////////////////////////////////////////////////////Setters//////////////////////////////////////////////////
///number of cannon Balles
    func setNumberOfCannonBalls(amount: Int)
    {
        numberOfCannonBalls = amount
    }
///player Name
    func setPlayerName(name: String?)
    {
        self.name = name
    }
///Streak
    func setStreak(to: Int)
    {
        streak = to
    }
///Best Score Setter
    func setBestScore(to: Int)
    {
        bestScore = to
    }
///CurrentScore Setter
    func setCurrentScore(score: Int)
    {
        currentScore = score
    }
    func addStreak(by: Int)
    {
        streak += by
    }
///reduces the number of the cannonballs by "by"
    func reduceCannonBalls(by: Int)
    {
        numberOfCannonBalls -= by
    }
    
///increases the number of the cannonballs by "by"
    func  addCannonBalls(by: Int)
    {
        numberOfCannonBalls += by
    }
    
///Notifies if the player has more cannonballs
    func hasMoreCannonBalls()->Bool
    {
        let answer: Bool
        if numberOfCannonBalls > 0 {
            answer = true
        } else {
            answer = false
        }
        return answer
    }
    
}
