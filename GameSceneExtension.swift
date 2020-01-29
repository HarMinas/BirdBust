//
//  Extension.swift
//  BirdBust
//
//  Created by Harutyun Minasyan on 11/28/17.
//  Copyright © 2017 Harutyun Minasyan. All rights reserved.
//



import Foundation
import SpriteKit



extension GameScene {
    
/// Adds Exposions
    func addExplosion(position: CGPoint)
    {
        let explosions = SKEmitterNode(fileNamed: "explosions")
        let createExplosion = SKAction.run {
            () in
            explosions?.position = position
            explosions?.zPosition = 5
            explosions?.setScale(1)
            self.addChild(explosions!)
        }
        let delay = SKAction.wait(forDuration: 2)
        let removeParticle = SKAction.run {
            () in explosions?.removeFromParent()
        }
        
        let exlosionLifeCycle = SKAction.sequence([createExplosion, delay, removeParticle])
        self.run(exlosionLifeCycle)
    }
    
/// adds a particle
    func createParticle(particle: SKEmitterNode?, atPosition: CGPoint, scale: CGFloat, toParent: Any?)
    {
        particle!.position = atPosition
        particle!.setScale(scale)
        if let parent = toParent as? SKNode{
            parent.addChild(particle!)
        }
    }
            

// /////////////////////// VALUE CONVERSION AND RANGE SETTERS ///////////////////////////////////////
///converts radiansToDegrees
    func convertToDegrees(radians: CGFloat)->CGFloat
    {
        var degrees = CGFloat()
        if radians > 0 {
            degrees = radians * CGFloat((180/Double.pi))
        } else if radians < 0 {
            
        }
        return degrees
    }
    
///convert degreesToRadians
    static func convertToRadians(degrees: CGFloat)->CGFloat
    {
        var radians = CGFloat()
        if degrees > 0 {
            radians = degrees * CGFloat((Double.pi/180))
        } else if degrees < 0 {
            
        }
        return radians
    }
/// Range Setter
    static func minValue(num1: CGFloat, num2: CGFloat) -> CGFloat
    {
        
        var minNum = CGFloat(0)
        if num1 > num2 {
            minNum = num2
            
        } else if num1 < num2 {
            
            minNum = num1
        }
        return minNum
    }
    

    
// ///////////////////////////////////////////////POSITION - SIZES OF GAME SCENE OBJECTS/////////////////////////////////////////////
    
//Position of the objects in GamesScene
///Position for the sun
    func sunPosition()->CGPoint
    {
        let x = selfWidth() - selfWidth()/6
        let y = selfHeight() - selfHeight()/6
        return CGPoint(x: x, y: y)
    }
///Position for the platform
     func platformPosition()->CGPoint
    {
        let x = selfWidth()/15
        let y = CGFloat(0)
        return CGPoint(x: x, y: y)
    }
///Position for the Score Label
   func scorePosition()->CGPoint
    {
        let x = CGFloat(0)
        let y = selfHeight() - selfHeight()/8
        return CGPoint(x: x, y: y)
    }
///Position for the Cannon
     func cannonPosition()->CGPoint
    {
        let x = platformPosition().x + 60
        let y = platformPosition().y + 45
        return CGPoint(x: x, y: y)
    }
///Position of the StarLabel
    func starLabelPosition()->CGPoint
    {
        let x = selfWidth()/2
        let y = selfHeight() - selfHeight()/8
        return CGPoint(x: x, y: y)
    }
///Position of CannonBallLabel
    func cannonBallLabelPosition(node: SKNode)->CGPoint
    {
        let x = selfWidth() / 2
        let y = selfHeight()/10
        print(CGPoint(x: x, y: y))
        return CGPoint(x: x, y: y)
    }
    
//Sizes of Objects
///Score Display Size
    func scoreDisplaySize()-> CGSize
    {
        let width = selfWidth()
        let height = selfHeight()/8
        return CGSize(width: width, height: height)
    }
///Background Size
    func backgroundSize()-> CGSize
    {
        return CGSize(width: selfWidth(), height: selfHeight())
    }
    
}
//End of Extension
    
// ///////////////////////////////////////////////////   COLLISION MASKS ////////////////////////////////////

    struct Masks
    {
        static let birdCatMask: UInt32 = 0x1 << 1
        static let cannonBallCatMask: UInt32 = 0x1 << 2
        static let featherCatMask: UInt32 = 0x1 << 3
        static let featherLabelCatMask: UInt32 = 0x1 << 4
        static let worldCatMask: UInt32 = 0x1 << 5
    }


/// Z position of the game elements
    struct ZPositions
    {
//background layers - 0-10
        static let backgroundZPos1: CGFloat = 0
        static let backgroundZPos2: CGFloat = 3
        static let backgroundZPos3: CGFloat = 5
//Clouds 0-10
        static let cloudZPos1: CGFloat = 2
        static let cloudZPos2: CGFloat = 4
        static let cloudZPos3: CGFloat = 6
//Sun and Sunfire 0 - 10
        static let sunZPos: CGFloat = 1
        static let sunFireZPos: CGFloat = 1
//Birds 10 - 15
        static let birdZPos: CGFloat = 11
// Platform
        static let platformZPos: CGFloat = 12
//CannonBall and CannonBalls 15 - 20
        static let cannonZPos: CGFloat = 16
        static let cannonWheelZPos: CGFloat = 17
        static let cannonBallZPos: CGFloat = 15
// Feather Label 20 - 30
        static let featherLabelZPos: CGFloat = 20
//Feathers
        static let feathersZPos: CGFloat = 20
//Stars
        static let starsZPos: CGFloat = 20
//CannonBallLabel
        static let cannonBallLabelZPos: CGFloat = 20
    }










