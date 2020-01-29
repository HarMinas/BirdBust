//
//  Birds.swift
//  1stGame
//
//  Created by Harutyun Minasyan on 6/18/17.
//  Copyright © 2017 Harutyun Minasyan. All rights reserved.
//

import UIKit
import SpriteKit

class Birds: SKNode {
    
/////////////////////////////////////////////// INSTANCE VARIABLES  ////////////////////////////////////////////////////////////

    private var birdFlightAnimation: SKAction!
    private var bird: SKSpriteNode!
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
   
 
    
    
// ////////////////////////////////////////////// Creating  Birds //////////////////////////////////////////////////////////////
    

///creates an initialized "flying" bird object and returns it - 4 different bird objects can be created
    private func createBirds(type: BirdType)
    {
        var imageName: String!
        var birdTextures: [SKTexture] = []
        
        switch type
        {
        case .blue: bird = SKSpriteNode(imageNamed: "blueBird1") ;  imageName = "blueBird"
        case .red: bird = SKSpriteNode(imageNamed: "redBird1") ; imageName = "redBird"
        case .yellow: bird = SKSpriteNode(imageNamed: "yellowBird1") ;  imageName = "yellowBird"
        case .gray: bird = SKSpriteNode(imageNamed: "grayBird1") ; imageName = "grayBird"
        }
        
        for i in 1...4
        {
            birdTextures.append(SKTexture(imageNamed: imageName + "\(i)"))
        }
        birdFlightAnimation = SKAction.animate(with: birdTextures, timePerFrame: 0.1)
        bird.run(SKAction.repeatForever(birdFlightAnimation))
        bird.name = imageName

    }
    

    
    ///creates a bird of random type - odds of Blue:Gray:Yellow:Red = 10:4:3:2
    private func randomBird()->BirdType
    {
        let randomNumber = Int(arc4random_uniform(UInt32(20)))
        switch randomNumber
        {
        case 0...10: return .blue
        case 10...15: return .gray
        case 15...18: return .yellow
        case 18...20: return .red
        default: return .blue
        }
    }

    
    ///bird position - creates a point,the y coordinate of which is randomly placed in upper half of the scene and x is at 700
    private func birdPos()-> CGPoint
    {
        var y: CGFloat! = 0
        var x: CGFloat! = 0
        if let parentHeight = self.parent?.frame.height
        {
            let lowerLimit = parentHeight/2 - parentHeight/6
            let upperLimit = parentHeight/2
            y = lowerLimit + CGFloat(arc4random_uniform(UInt32(upperLimit)))
            x = (self.parent?.frame.width)! + 50
        }
        return CGPoint(x: x, y: y)
    }
// /////////////////////////////////////////////////  ADDING THE BIRDS ////////////////////////////////////////////
    func addBirds()
    {
        weak var weakSelf = self
        let addBirds = SKAction.run
            {
                () in
                weakSelf!.addABird(type: weakSelf!.randomBird())
            }
        let addBirdsDelay = SKAction.wait(forDuration: 2, withRange: 1)
    
        let addBirdsSeq = SKAction.sequence([addBirds,addBirdsDelay])
        let addBirdsForever = SKAction.repeatForever(addBirdsSeq)
        self.run(addBirdsForever)
    }
    
// /////////////////////////////////////////////////  BIRD MOVEMENTS ////////////////////////////////////////////

    private func birdFlightMovement() -> SKAction
    {
        let delay = SKAction.wait(forDuration: 0.1)
        let jumpUpVector = SKAction.applyImpulse(CGVector(dx: 0, dy: 15), duration: 0.1)
        let jumpDowmVector = SKAction.applyImpulse(CGVector(dx: 0, dy: -15), duration: 0.1)
        let jumpSequence = SKAction.sequence([jumpUpVector, delay, jumpDowmVector])
        let repeatActons = SKAction.repeatForever(jumpSequence)
        return repeatActons
    }
/// Creates the bird Movement vector to be used in an impulse applied to the bird
    private func birdMovementVector(speed: CGFloat)-> CGVector
    {
        var dy: CGFloat! = 0
        let dx = speed + CGFloat(arc4random_uniform(10))
        let y = birdPos().y
        if y > (parent?.frame.height)!/2 {
            dy = -CGFloat(arc4random_uniform(UInt32(5)))
        } else if y < (parent?.frame.height)!/2 {
            dy = CGFloat(arc4random_uniform(UInt32(5)))
        }
        return CGVector(dx: -dx, dy: dy)
    }
// /////////////////////////////////////////////////  BIRD PHYSICS ////////////////////////////////////////////
///Attaching the physicsBody to the birds
    private func attachPhysics()
    {
        bird.physicsBody = SKPhysicsBody(circleOfRadius: bird.size.width/2)
        bird.physicsBody?.affectedByGravity = false
        bird.physicsBody?.isDynamic = true
        bird.physicsBody?.categoryBitMask = Masks.birdCatMask
        bird.physicsBody?.collisionBitMask = Masks.cannonBallCatMask
        bird.physicsBody?.contactTestBitMask = Masks.cannonBallCatMask
        bird.physicsBody?.mass = 0.1
    }
    
 
    //creates birds
    private func addABird(type: BirdType)
    {
        let audio = GameAudio()
        createBirds(type: type)
        attachPhysics()

        bird.position = birdPos()
        bird.setScale(0.08)
        bird.zPosition = 5
    
    
        self.addChild(bird)
        bird.run(SKAction.repeatForever(birdFlightAnimation))
    
        switch type
        {
        case .blue: bird.physicsBody?.applyImpulse(birdMovementVector(speed: 10))
        case .gray: bird.physicsBody?.applyImpulse(birdMovementVector(speed: 15))
        case .yellow: bird.physicsBody?.applyImpulse(birdMovementVector(speed: 20))
        case .red: bird.physicsBody?.applyImpulse(birdMovementVector(speed: 30))
        }
        
        bird.run(birdFlightMovement())

        let removeDelay = SKAction.wait(forDuration: 20)
        let removeBird = SKAction.removeFromParent()
        let removeSeqence = SKAction.sequence([removeDelay, removeBird])
        
        bird.run(removeSeqence)
        bird.addChild(audio)
    }
}
// END OF CLASS


enum BirdType: Int {
    case blue, red, yellow, gray
}
