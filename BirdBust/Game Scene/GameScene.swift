//
//  GameScene.swift
//  BirdBust
//
//  Created by Harutyun Minasyan on 11/27/17.
//  Copyright © 2017 Harutyun Minasyan. All rights reserved.
//

import SpriteKit


class GameScene: SKScene
{

// /////////////////////////////////////////////// INSTANCE VARIABLES ///////////////////////////////////////////
    
    private var cannon: Cannon!
    private var world: World!
    private var birds: Birds!
    private var score: Score!
    private var feather: Feathers!
    private var starLabel: StreakStars!
    private var cannonBallLabel: CannonBallDisplay!
    private var audio: GameAudio!
    

// ///////////////////////////////////////////////////  PHYSICS WORLD  ////////////////////////////////////////////
///Configuring the physics world of the gameScene and placing the boundries of the game for objects to interact with
    private func configureWorldPhysics()
    {
        physicsWorld.gravity = CGVector(dx: 0, dy: -4)
     
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        self.physicsBody?.categoryBitMask = Masks.worldCatMask
        self.physicsBody?.contactTestBitMask = Masks.cannonBallCatMask
        self.physicsBody?.node?.name = "worldBoundry"
    }
    
// ///////////////////////////////////////////////////  SCORE   ////////////////////////////////////////////////////
    
    private func addTheScore()
    {
        score = Score()
        score.position = scorePosition()
        score.createFeatherDisplay(position: CGPoint(x: 10, y: 10))
        self.addChild(score)
    }
    
    func getFeathers()->[(FeatherType, Int)]
    {
        return score.getFeatherCount()
    }

///Changing the count of the FeatherLabels
    func changeFeatherCount(type: FeatherType , amount: Int)
    {
        score.addFeathers(amount: amount, type: type)
    }
    


    
// ///////////////////////////////////////////////////  STAR STREAK   ////////////////////////////////////////////////////
    private func addStarsLabel()
    {
        starLabel = StreakStars(position: starLabelPosition())
        self.addChild(starLabel)
    }
    
    func addStar()
    {
        starLabel.addAStar()
    }
    
    func resetStars()
    {
        starLabel.refreshStars()
    }
// Indicates if the streak has been completed and adds CannonBalls
    func didCompleteStreak()
    {
        if starLabel.isStreakComplete() {
            cannonBallLabel.changeCannonBalls(amount: 20)
        }
    }
    
// //////////////////////////////////////////////  FEATHERS   ////////////////////////////////////////////////////
/// Adding Feathers
    func addFeather(type: FeatherType, origin: CGPoint)
    {
        let destination = convert(score.featherPosition(type: type), from: score)
        feather = Feathers()
        feather.addFeather(type: type, origin: origin, destination: destination)
        self.addChild(feather)
    }

    
// ///////////////////////////////////////////////////  WORLD  //////////////////////////////////////////////////////
///initializing and adding the world
    private func addTheWorld()
    {
        world = World(sunPosition: sunPosition(), platformPosition: platformPosition(), backgroundSize: backgroundSize())
        self.addChild(world)
    }
    
/// Adding Audio to the world
    private func addAudio()
    {
        audio = GameAudio()
        audio.backgroundMusicOn()
        self.addChild(audio)
    }
    
    
// ///////////////////////////////////////////////////  CANNON  /////////////////////////////////////////////////////
///Adding the cannon object to the scene
    private func addTheCannon()
    {
        cannon = Cannon(position: cannonPosition(), zPosition: 11)
        world.addChild(cannon)
    }
    
///Shoots the cannon and animates it
    func shootTheCannon()
    {
        cannon.shoot()
        cannonBallLabel.changeCannonBalls(amount: -1)
    }
    
///sets the rotation of the cannon
    func setCannonRotation(rawValue: CGFloat)
    {
        cannon.setRawRotation(rawRotation: rawValue)
    }
    
  
// //////////////////////////////////////////////// CannonBall Display  ////////////////////////////////////////////////////////

    func addCannonBallDisplay(numberOfCannonBalls: Int)
    {
        cannonBallLabel = CannonBallDisplay(numberOfCannonBalls: numberOfCannonBalls)
        cannonBallLabel.position = cannonBallLabelPosition(node: cannonBallLabel)
        cannonBallLabel.zPosition = ZPositions.cannonBallLabelZPos
        self.addChild(cannonBallLabel)
    }
    

    
// ///////////////////////////////////////////////////  BIRDS  ////////////////////////////////////////////////////////
    
    private func addTheBirds()
    {
        birds = Birds()
        birds.addBirds()
        self.addChild(birds)
    }

// ///////////////////////////////////////////////  LIFECYCLE ////////////////////////////////////////////////////
    
    override func sceneDidLoad()
    {
        super.sceneDidLoad()
        addTheWorld()
        configureWorldPhysics()
        addTheCannon()
        addTheScore()
        addTheBirds()
        addStarsLabel()
        addAudio()
    }

}
// /// End Of Class
