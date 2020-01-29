//
//  BetterCannon.swift
//  BirdBust
//
//  Created by Harutyun Minasyan on 12/8/17.
//  Copyright © 2017 Harutyun Minasyan. All rights reserved.
//

import SpriteKit

let rad = CGFloat(0.785398)

class Cannon: SKNode
{
// /////////////////////////////////////////// INSTANCE VARIABLES ///////////////////////////////////////////////////
    
    private var cannon: SKSpriteNode!
    private var cannonWheel: SKSpriteNode!
    private var rawRevolution: CGFloat! { didSet {rotateCannon()}}
    private var cannonTextures: [SKTexture] = []
    private var cannonAnimation: SKAction!
    private var cannonShootSound: SKAudioNode!
    
    
// /////////////////////////////////////////// CANNON CREATION /////////////////////////////////////////////////////
    
    init(position: CGPoint, zPosition: CGFloat)
    {
        super.init()
        cannonWheel = SKSpriteNode(imageNamed: "CannonWheel")
        cannonWheel.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        cannonWheel.position = CGPoint(x: position.x - 20, y: position.y - 10)
        cannonWheel.zPosition = zPosition + 2
        cannonWheel.setScale(0.2)
        
        
        cannon = SKSpriteNode(imageNamed: "Cannon1")
        cannon.anchorPoint = CGPoint(x: 0.4, y: 0.3)
        cannon.position = position
        cannon.zPosition = zPosition + 1
        cannon.zRotation = 1 * rad
        cannon.setScale(0.15)
        
            animateCannon()
        
        self.addChild(cannon)
        self.addChild(cannonWheel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init()
    }
    
// /////////////////////////////////////////// CANNON ROTATION ////////////////////////////////////////////////////////
    func setRawRotation(rawRotation: CGFloat)
    {
        rawRevolution = rawRotation/50
    }
    
/// rotates the cannon by rawRevolution and sets limits from 0-90 degrees in radians
    private func rotateCannon()
    {
        let max: CGFloat = 2 * rad
        let min: CGFloat = 0
        
        if (cannon.zRotation + rawRevolution) > max
        {
            cannon.zRotation = max
        }
        else if (cannon.zRotation + rawRevolution) < min
        {
            cannon.zRotation = min
        }
        else
        {
            cannon.zRotation += rawRevolution
        }
    }

    
// /////////////////////////////////////////////  CANNON FIRES  ////////////////////////////////////////////////////////
    
/// Cannon firing Animation
    private func animateCannon()
    {
        for i in 1...4 // Attach all the textures of the cannon to the array
        {
            cannonTextures.append(SKTexture(imageNamed: "Cannon\(i)"))
            if i == 4
            {
                var x = 4
                while x > 0
                {
                    cannonTextures.append(SKTexture(imageNamed: "Cannon\(i)"))
                    x -= 1
                }
            }
        }           //create a action animation with the
        cannonAnimation = SKAction.animate(with: cannonTextures, timePerFrame: 0.1, resize: true, restore: true)
    }
    
    
    
///vector for cannonBall
    private func newShootVector()-> CGVector
    {
        let cannonBallVector = cannon.zRotation
        let shootingForce = CGFloat(4000)
        let cannonBallShootingVector = CGVector(dx: shootingForce * cos(cannonBallVector), dy: shootingForce * sin(cannonBallVector))
        return cannonBallShootingVector
    }
    
///Shooting The CannonBalll
    func shoot()
    {
        let cannonBall = SKSpriteNode(imageNamed: "cannonBall")
        let cannonBallStartPosition = cannon.position
        cannon.run(cannonAnimation)
        cannonBall.position = cannonBallStartPosition
        cannonBall.zPosition = 5
        cannonBall.setScale(0.01)
        cannonBall.physicsBody = SKPhysicsBody(circleOfRadius: cannonBall.size.width/2)
        cannonBall.physicsBody?.isDynamic = true
        cannonBall.physicsBody?.affectedByGravity = true
        cannonBall.physicsBody?.categoryBitMask = Masks.cannonBallCatMask
        cannonBall.physicsBody?.collisionBitMask = Masks.birdCatMask
        cannonBall.physicsBody?.contactTestBitMask = Masks.birdCatMask
        cannonBall.physicsBody?.mass = 3
        cannonBall.name = "cannonBall"
        self.addChild(cannonBall)
        cannonBall.run(SKAction.playSoundFileNamed("CannonFire", waitForCompletion: false))
        cannonBall.physicsBody?.applyImpulse(newShootVector())
    }

}
//END OF CLASS
