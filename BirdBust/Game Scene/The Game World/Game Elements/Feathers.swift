//
//  Feathers.swift
//  BirdBust
//
//  Created by Harutyun Minasyan on 12/14/17.
//  Copyright © 2017 Harutyun Minasyan. All rights reserved.
//

import Foundation
import SpriteKit


class Feathers: SKSpriteNode
{
    private var feather: SKSpriteNode!
    
    
    
// //////////////////////////////////////////////////     Creating The Feathers //////////////////////////////////////////
/// Creates feathers and sends them to the feather labels
    private  func createFeather(type: FeatherType, origin: CGPoint, destination: CGPoint)
    {
        let name: String!
        switch type
        {
            case .blue: name = "blueFeather"
            case .red: name = "redFeather"
            case .yellow: name = "yellowFeather"
            case .gray: name = "grayFeather"
        }
        
        feather = SKSpriteNode(imageNamed: name)
        feather.name = name
        feather.position = origin
        feather.zPosition = 15
        feather.setScale(0.2)
        self.addChild(feather)
        createPhysics()
        moveFeathers(destination: destination)
    }


// //////////////////////////////////////////////////     PHYSICS FOR THE FEATHERS ///////////////////////////////////////////
///Adds a physics body to the feather that is created
    private func createPhysics()
    {
        feather.physicsBody = SKPhysicsBody(rectangleOf: feather.size)
        feather.physicsBody?.isDynamic = true
        feather.physicsBody?.affectedByGravity = false
        feather.physicsBody?.categoryBitMask = Masks.featherCatMask
        feather.physicsBody?.contactTestBitMask = Masks.featherLabelCatMask
        feather.physicsBody?.collisionBitMask = Masks.featherLabelCatMask
    }

// //////////////////////////////////////////////////    MOVEMENTS FOR THE FEATHERS ///////////////////////////////////////////

///rotates the feathers and send them to their destination
    private func moveFeathers(destination: CGPoint)
    {
        let rotateFeather = SKAction.rotate(byAngle: 360, duration: Double(randomFeatherRotation()))
        let featherMovement = SKAction.move(to: destination, duration: 2.5)
        let scaleDown = SKAction.scale(by: 0.75, duration: 1)
        let featherAction = SKAction.group([featherMovement, rotateFeather, scaleDown])
        feather.run(featherAction)
    }

    
    
    
// ////////////////////////////////////////////////   ADDING FEATHERS API ////////////////////////////////////////
/// adds a bunch of feathers
    func addFeather(type: FeatherType, origin: CGPoint, destination: CGPoint)
    {
        let addingFeathers = SKAction.run {
            () in
            weak var weakSelf = self
            weakSelf!.createFeather(type: type, origin: origin, destination: destination)
        }
        let waitDuration = SKAction.wait(forDuration: 0.1)
        var featherArray = [SKAction]()
        
        for _ in 1...(1+Int(arc4random_uniform(UInt32(3))))
        {
            featherArray.append(addingFeathers)
            featherArray.append(waitDuration)
        }
        
        let featherMovement = SKAction.sequence(featherArray)
        self.run(featherMovement)
    }

}
//END OF CLASS


///ENUM CONTAINING THE FEATHER TYPES
enum FeatherType
{
    case blue, red, yellow, gray
}


