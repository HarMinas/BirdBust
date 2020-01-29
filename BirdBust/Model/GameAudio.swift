//
//  File.swift
//  BirdBust
//
//  Created by Harutyun Minasyan on 12/21/17.
//  Copyright © 2017 Harutyun Minasyan. All rights reserved.
//

import SpriteKit


class GameAudio: SKNode
{
/// The sound of the cannon blast
    func blastTheCannon()
    {
        let cannonBlast = SKAudioNode(fileNamed: "CannonFire")
        cannonBlast.isPositional = false
        cannonBlast.autoplayLooped = false
        
        self.addChild(cannonBlast)
        cannonBlast.run(SKAction.play())
    }
    
/// The Background music of the game
    func backgroundMusicOn()
    {
        let backgroundMusic = SKAudioNode(fileNamed: "GameBackgroundMusic")
        backgroundMusic.isPositional = false
        backgroundMusic.autoplayLooped = true
        
        self.addChild(backgroundMusic)
        backgroundMusic.run(SKAction.changeVolume(by: -0.25, duration: 0))
        backgroundMusic.run(SKAction.play())
    }
    
/// Adding the Bird FlightSounds
    @objc func birdFlightSound()
    {
        let birdCook = SKAudioNode(fileNamed: "birdSound1")
        birdCook.isPositional = false
        birdCook.autoplayLooped = false
        birdCook.run(.play())
        Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(GameAudio.birdFlightSound), userInfo: nil, repeats: false)
        self.addChild(birdCook)
    }
 
}

