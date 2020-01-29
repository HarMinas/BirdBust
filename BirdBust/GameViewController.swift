//
//  ViewController.swift
//  BirdBust
//
//  Created by Harutyun Minasyan on 11/27/17.
//  Copyright © 2017 Harutyun Minasyan. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController, SKPhysicsContactDelegate, UITextFieldDelegate{

// /////////////////////////////////////////////////////INSTANCE-VARIABLES/////////////////////////////////////////////////////////////////
    
    private var rootView: SKView! //Adds an SKView as the View of the controller- This view is going to present and display everything
    private var player: Player! //The Model of the game - this objects contains all the elements pertaining to the player of the game
    private var gameScene: GameScene! // The scene where the game is played
    private var gameControls: GameControls! //The controls of the game that the player can use once inside the gameScene object
    private var defaults: UserDefaults! //The object that stores data persistantly
    private var gameMenu: GameMenu! //Game menu objet that contains all the menues in this game
    private var settingsMenu: SettingsMenu! //The settings object that deals with settings of the game
    private var scoreScene: ScoreScene!
    private var featherScores: [(FeatherType, Int)]!

// ////////////////////////////////////////////////////////GAMESCENE-SETUP///////////////////////////////////////////////////////////////
    
    
///Segue to Game Scene - configure and display the game scene
    @objc func showGameScene()
    {
        gameMenu.removeFromSuperview()
        gameScene = GameScene(size: CGSize(width: rootView.bounds.width, height: rootView.bounds.height))
        addGameControls()
        gameScene.addCannonBallDisplay(numberOfCannonBalls: player.getNumberOfCannonBalls())
        rootView.presentScene(gameScene)
        rootView.addSubview(gameControls)
        gameScene.physicsWorld.contactDelegate = self
    }
/// Wiring up the controls that control in-Game elements such as the cannon
    private func addGameControls()
    {
        //Create a pan gesture for the cannon rotator
        let pan = UIPanGestureRecognizer(target: self, action: #selector(GameViewController.pan))
        gameControls = GameControls(frame: rootView.frame)
        gameControls.getCannonRotator().addGestureRecognizer(pan)
        gameControls.getShootingButton().addTarget(self, action: #selector(GameViewController.shoot), for: .touchUpInside)
    }
  

// //////////////////////////////////////////////////   Cannon Logic ////////////////////////////////////////
///Shooting the Cannon
    @objc func shoot()                                                          //Func shoot()
    {
        gameScene.shootTheCannon()
        player.reduceCannonBalls(by: 1)
        print("num of CannonBalls \(player.getNumberOfCannonBalls())")
        disableCannon(time: 0.25)
    }
///Disables the Cannon shooting button for "time" amount of time
    private func disableCannon(time: TimeInterval)                              //Func disableCannon(time: TimeInterval)
    {
      gameControls.getShootingButton().isEnabled = false
        Timer.scheduledTimer(timeInterval: time,target: self,
                             selector: #selector(GameViewController.enableCannon), userInfo: nil, repeats: false)
    }
///Enable the Cannon
    @objc func enableCannon()                                                   //Func enableCannon()
    {
        gameControls.getShootingButton().isEnabled = true
    }
    

    
///Setting up the pannable view to change cannon rotation
    @objc func pan(pan: UIPanGestureRecognizer)                                 //Func pan(pan: UIPanGestureRecognizer)
    {
        switch pan.state
        {
       // case .began: //gameControls.getCannonRotator().alpha = 1
        case .changed: gameScene.setCannonRotation(rawValue: -(pan.translation(in: gameControls.getCannonRotator()).y))
            pan.setTranslation(CGPoint(x: 0, y: 0), in: gameControls.getCannonRotator()) //reset the value of pan view
       //case .ended: gameControls.getCannonRotator().alpha = 0.5
        default: break
        }
    }
    
// //////////////////////////////////////////////////   Game Logic //////////////////////////////////////////////////////////////
///Chech for Game Over and end the game if the game is over
    private func checkForGameOver()                                            // Func checkForGameOver()
    {
        if !player.hasMoreCannonBalls()
        {
            gameOver()
        }
    }
///Check if the user has reached a bird Kill streak of 3 and add more cannonBals
    private func checkStreak()                                                 // Func checkStreak()
    {
        if player.getStreak() == 3
        {
            player.addCannonBalls(by: 20)
            player.setStreak(to: 0)
            Timer.scheduledTimer(timeInterval: 0.6, target: self, selector: #selector(GameViewController.resetStars), userInfo: nil, repeats: false)
        }
    }
///Quits the GameScene and transitions into the Game Over Scene
    private func gameOver()                                                     //Func GameOver()
    {
        featherScores = gameScene.getFeathers()
        gameControls.removeFromSuperview()
        rootView.presentScene(nil)
        showScoreScene(featherScores: featherScores!)
        player.setNumberOfCannonBalls(amount: 25)
    }
///Resets the star Label to 0 stars
    @objc func resetStars()
    {
        gameScene.resetStars()
    }
    

// //////////////////////////////////////////////////////Score-Scene/////////////////////////////////////////////////////////////////////

   func showScoreScene(featherScores: [(FeatherType, Int)])
    {
        gameMenu.removeFromSuperview()
        scoreScene = ScoreScene(size: rootView.frame.size)
        scoreScene.scaleMode = .resizeFill
        scoreScene.addTheFeathers(featherScores: featherScores)
        rootView.presentScene(scoreScene)
        player.setCurrentScore(score: scoreScene.getTotalScore())
        Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(GameViewController.showNormalMenu), userInfo: self, repeats: false)

    }
// ///////////////////////////////////////////////////////MENU-SETUP//////////////////////////////////////////////////////////////////////
    
///Display A Menu with a specified menu type
    func showMenu(type: GameMenu.menuType)
    {
        gameMenu = GameMenu(frame: rootView.frame)
        gameMenu.showMenu(parent: rootView, type: type)
        rootView.presentScene(nil)
        if type == GameMenu.menuType.firstTime {
            gameMenu.addSaveButton().addTarget(self, action: #selector(GameViewController.saveTheUserName), for: .touchUpInside)
            gameMenu.addTextField()
        } else {
            gameMenu.setUserName(name: player.getPlayerName()!)
            gameMenu.addPlayButton().addTarget(self, action: #selector(GameViewController.showGameScene), for: .touchUpInside)
            gameMenu.addSettingsButton().addTarget(self, action: #selector(GameViewController.showSettings), for: .touchUpInside)
        }
    }
    
/// Dislay the normal Menu
    @objc func showNormalMenu()
    {
        showMenu(type: .normal)
        gameMenu.setCurrentScore(new: player.getCurrentScore())
        if player.getBestScore() < player.getCurrentScore()
        {
            defaults.set(player.getCurrentScore(), forKey: "BestScore")
            player.setBestScore(to: player.getCurrentScore())
            gameMenu.setBestScore(best: player.getBestScore())
        }
        else
        {
            gameMenu.setBestScore(best: player.getBestScore())
        }
    }
    
// ///////////////////////////////////////////// Settings Page ////////////////////////////////////////////////////////////////////////////
///Saves the userName and transitions to a view
    @objc func saveTheUserName()
    {
        let name  = gameMenu.getUserTextField().text
        if  name != "" {
            player.setPlayerName(name: name)
            defaults.set(name, forKey: "playerName")
            gameMenu.getUserTextField().resignFirstResponder()
            gameMenu.removeFromSuperview()
            showMenu(type: .firstTimeWelcome)
            gameMenu.setUserName(name: player.getPlayerName()!)
        } else {
            gameMenu.getUserTextField().resignFirstResponder()
            gameMenu.getUserTextField().placeholder = "Please Enter A Name"
        }
    }

/// Shows the settings Menu
    @objc func showSettings ()
    {
        gameMenu.removeFromSuperview()
        settingsMenu = SettingsMenu(frame: rootView.frame)
        rootView.addSubview(settingsMenu)
    }
    
// ///////////////////////////////////////////////////////LAUNCH-SEQUENCE//////////////////////////////////////////////////////////////////
    
///The function that is called at the ViewDiDLoad- This function checks to see user's current state to decide which menu to display
    func launchSequence()
    {
        //initiate the defaults object AND the player object
        defaults = UserDefaults.standard
        player = Player(bestScore: defaults.integer(forKey: "BestScore"),
                        numberOfCannonBalls: 10,
                        playerName: defaults.string(forKey: "playerName"))

        //present the Game Menu - if this is th first login ever present the first Time login menu.
        if (!defaults.bool(forKey: "NotFirstTime") || player.getPlayerName() == nil)
        {
            showMenu(type: .firstTime)
            defaults.set(true, forKey: "NotFirstTime")
        } else if player.getBestScore() == 0 {
            showMenu(type: .firstTimeWelcome)
        } else {
            showMenu(type: .welcome)
            gameMenu.setBestScore(best: player.getBestScore())
        }
    }
    

// //////////////////////////////////////////////////// Contact Handling /////////////////////////////////////////////////////////////////
    ///Method called when there is a contact between two physics bodies
    func didBegin(_ contact: SKPhysicsContact) {
        
        let  bodyA = contact.bodyA.node?.name
        let  bodyB = contact.bodyB.node?.name
        
        if (bodyA == "blueBird" && bodyB == "cannonBall") || (bodyA == "cannonBall" && bodyB == "blueBird") // blue and CannonBall
        {
            contact.bodyA.node?.removeFromParent()
            contact.bodyB.node?.removeFromParent()
            gameScene.addExplosion(position: contact.contactPoint)
            gameScene.addFeather(type: .blue, origin: contact.contactPoint)
            gameScene.addStar()
            player.addStreak(by: 1)
            gameScene.didCompleteStreak()
//            gameScene.
            checkStreak()
        }
        if (bodyA == "redBird" && bodyB == "cannonBall") || (bodyA == "cannonBall" && bodyB == "redBird") //red and CannonBall
        {
            contact.bodyA.node?.removeFromParent()
            contact.bodyB.node?.removeFromParent()
            gameScene.addExplosion(position: contact.contactPoint)
            gameScene.addFeather(type: .red, origin: contact.contactPoint)
            gameScene.addStar()
            player.addStreak(by: 1)
            gameScene.didCompleteStreak()
            checkStreak()
        }
        if (bodyA == "yellowBird" && bodyB == "cannonBall") || (bodyA == "cannonBall" && bodyB == "yellowBird") //yellow and Cannonball
        {
            contact.bodyA.node?.removeFromParent()
            contact.bodyB.node?.removeFromParent()
            gameScene.addExplosion(position: contact.contactPoint)
            gameScene.addFeather(type: .yellow, origin: contact.contactPoint)
            gameScene.addStar()
            player.addStreak(by: 1)
            gameScene.didCompleteStreak()
            checkStreak()
        }
        if (bodyA == "grayBird" && bodyB == "cannonBall") || (bodyA == "cannonBall" && bodyB == "grayBird") //gray and CannonBall
        {
            contact.bodyA.node?.removeFromParent()
            contact.bodyB.node?.removeFromParent()
            gameScene.addExplosion(position: contact.contactPoint)
            gameScene.addFeather(type: .gray, origin: contact.contactPoint)
            gameScene.addStar()
            player.addStreak(by: 1)
            gameScene.didCompleteStreak()
            checkStreak()
        }
        if (bodyA == "blueFeather" && bodyB == "blueFeatherLabel") // bluefeather and BlueFeatherLabel
        {
            contact.bodyA.node?.removeFromParent()
            gameScene.changeFeatherCount(type: .blue, amount: 1)
            checkForGameOver()
        }
        else if (bodyA == "blueFeatherLabel" && bodyB == "blueFeather")
        {
            contact.bodyB.node?.removeFromParent()
            gameScene.changeFeatherCount(type: .blue, amount: 1)
            checkForGameOver()
        }
        if (bodyA == "redFeather" && bodyB == "redFeatherLabel") //redFeather and redFeatherLabel
        {
            contact.bodyA.node?.removeFromParent()
            gameScene.changeFeatherCount(type: .red, amount: 1)
            checkForGameOver()
        }
        else if (bodyA == "redFeatherLabel" && bodyB == "redFeather")
        {
            contact.bodyB.node?.removeFromParent()
            gameScene.changeFeatherCount(type: .red, amount: 1)
            checkForGameOver()
        }
        if (bodyA == "yellowFeather" && bodyB == "yellowFeatherLabel") //yellowFeather and yellowFeatherLabel
        {
            contact.bodyA.node?.removeFromParent()
            gameScene.changeFeatherCount(type: .yellow, amount: 1)
            checkForGameOver()
        }
        else if (bodyA == "yellowFeatherLabel" && bodyB == "yellowFeather")
        {
            contact.bodyB.node?.removeFromParent()
            gameScene.changeFeatherCount(type: .yellow, amount: 1)
            checkForGameOver()
        }
        if (bodyA == "grayFeather" && bodyB == "grayFeatherLabel") //grayfeather and grayFeatherLabel
        {
            contact.bodyA.node?.removeFromParent()
            gameScene.changeFeatherCount(type: .gray, amount: 1)
            checkForGameOver()
        }
        else if (bodyA == "grayFeatherLabel" && bodyB == "grayFeather")
        {
            contact.bodyB.node?.removeFromParent()
            gameScene.changeFeatherCount(type: .gray, amount: 1)
            checkForGameOver()
        }
        
        if (bodyA == "worldBoundry" && bodyB == "cannonBall")  // WorldBoundry and Cannonball
        {
            contact.bodyB.node?.removeFromParent()
            player.setStreak(to: 0)
            gameScene.resetStars()
            checkForGameOver()
        }
        else if (bodyA == "cannonBall" && bodyB == "worldBoundry")
        {
            contact.bodyA.node?.removeFromParent()
            player.setStreak(to: 0)
            gameScene.resetStars()
            checkForGameOver()
        }
    }
    
// ///////////////////////////////////////////////////LIFECYCLE-METHODS///////////////////////////////////////////////////////////////////
    
    /// LOAD VIEW - root View Initialization, set the view to skView. set the frame of the skView to the frame of the View. Ignore Sibling order(renderer optimization)
    override func loadView()
    {
        super.loadView()
        rootView = SKView()
        rootView.frame = view.frame
        rootView.ignoresSiblingOrder = false
        view = rootView
        
    }
    
    ///VIEW DID LOAD- initializing gameScene, player and setting the game controls
    override func viewDidLoad()
    {
        super.viewDidLoad()
        launchSequence()

    }
    

    
}
//END OF CLASS
