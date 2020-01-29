//
//  File.swift
//  BirdBust
//
//  Created by Harutyun Minasyan on 11/27/17.
//  Copyright © 2017 Harutyun Minasyan. All rights reserved.
//


import UIKit

class GameControls: UIView {
    
///Instance Variables
    //var cannonRotator: CannonRotator!
    private var playerDisplay: UILabel!
    private var shootingButton: UIButton!
    private var cannonRotator: UIView!
    
    
///Setting the Cannon Rotator and adding to the superView

  private func drawCannonRotator()
    {
        cannonRotator = UIView()
        let position = CGPoint(x: self.bounds.minX, y:  self.bounds.minY + self.bounds.size.height * 0.1)
        let size = CGSize(width: self.bounds.width * 0.6, height: self.bounds.height * 0.9)
        cannonRotator.frame = CGRect(origin: position, size: size)
        cannonRotator.alpha = 0.2
        cannonRotator.backgroundColor = UIColor.clear
        
        self.addSubview(cannonRotator)
    }
    
// getting the cannon rotator
    func getCannonRotator()-> UIView
    {
        return cannonRotator
    }
 
///Setting the Shooting cannon and adding to the superView
      private func drawShootingButton()
    {
        let buttonImage = UIImage(named: "ShootingButton")
        let buttonImageDisabled = UIImage(named: "DisabledShootingButton")
        let shootingButtonSize = CGSize(width: 70, height: 70)
        let position = CGPoint(x: self.bounds.maxX - shootingButtonSize.width, y: self.bounds.maxY - (shootingButtonSize.height))

        shootingButton = UIButton(frame: CGRect(origin: position, size: shootingButtonSize))
        shootingButton.setImage(buttonImage, for: .normal)
        shootingButton.setImage(buttonImageDisabled, for: .disabled)
        
        self.addSubview(shootingButton)
    }
    
    func getShootingButton()-> UIButton
    {
        return shootingButton
    }
    
///Setting the PlayerDisplay
    private func drawPlayerDisplay()
    {
        playerDisplay = UILabel()
        //setting the player Display
        playerDisplay.adjustsFontSizeToFitWidth = true
        playerDisplay.frame = CGRect(origin: CGPoint(x: 200, y: 300), size: CGSize(width: 300, height: 100))
        playerDisplay.text = "hello"
        playerDisplay.font.withSize(10)
        
        self.addSubview(playerDisplay)
    }
    
    
    
////////////////////////////////////////////////////// LIFECYCLE //////////////////////////////////////////////////////////
    override init(frame: CGRect) {
        super.init(frame: frame)
        drawShootingButton()
        drawCannonRotator()

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
