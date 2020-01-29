//
//  Clouds.swift
//  BirdBust
//
//  Created by Harutyun Minasyan on 11/27/17.
//  Copyright © 2017 Harutyun Minasyan. All rights reserved.
//

import UIKit
import SpriteKit

class Clouds: SKNode {
    
    private var cloud1: SKSpriteNode!
    private var cloud2: SKSpriteNode!
    
    

    
///Randomized cloud scale factor generator ranging from 0.1 - 0.2 scale factor for the clouds
    func randomCloudScales()->CGFloat
    {
        var rawScale = CGFloat(arc4random_uniform(UInt32(10)))
        rawScale += 10
        rawScale = rawScale/10
        return rawScale
    }
    
    
///   Creates clouds and moves them back
    private func createClouds()
    {
        let cloud1 = SKSpriteNode(imageNamed: "B1Cloud1")
        cloud1.position = CGPoint(x: 800, y: 200)
        cloud1.zPosition = 2
        cloud1.setScale(randomCloudScales())
        parent?.addChild(cloud1)
        
        //moves clouds back
        let moveBack1 = SKAction.move(by: CGVector(dx: -1000, dy: 0), duration: 150)
        let removeTheCloud1 = SKAction.removeFromParent()
        let cloudLifeCycle1 = SKAction.sequence([moveBack1, removeTheCloud1])
        cloud1.run(cloudLifeCycle1)
        
        let cloud2 = SKSpriteNode(imageNamed: "B1Cloud2")
        cloud2.position = CGPoint(x: 800, y: 230)
        cloud2.zPosition = 4
        cloud2.setScale(randomCloudScales())
        parent?.addChild(cloud2)
        
        //moves clouds back
        let moveBack2 = SKAction.move(by: CGVector(dx: -1300, dy: 0), duration: 150)
        let removeTheCloud2 = SKAction.removeFromParent()
        let cloudLifeCycle2 = SKAction.sequence([moveBack2, removeTheCloud2])
        cloud2.run(cloudLifeCycle2)
    }
    
    
    
//// Adds the created clouds to the parent - infinit creating of clouds
    func addClouds()
    {
        let addCloud = SKAction.run
        {
            () in
            weak var weakSelf = self
            weakSelf!.createClouds()
        }
        let addCloudDelay = SKAction.wait(forDuration: 60, withRange:7)
        let addCloudSeq = SKAction.sequence([addCloud,addCloudDelay])
        let addCloudsForever = SKAction.repeatForever(addCloudSeq)
        self.run(addCloudsForever)
    }
    
    
    

}

