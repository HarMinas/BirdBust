//
//  MenuDisplays.swift
//  BirdBust
//
//  Created by Harutyun Minasyan on 12/1/17.
//  Copyright © 2017 Harutyun Minasyan. All rights reserved.
//

import UIKit

class MenuDisplays: UIView{
// //////////////////////////////////////// Instance Variables /////////////////////////////////////////////////////////
    private var bestScore: UILabel!
    private var currentScore: UILabel!
    private var userName: UILabel!
    private var message: UILabel!
    private var userTextField: UITextField!
    
    

// /////////////////////////////////////// Adding Display Elements /////////////////////////////////////////////////////////
///Best Score Display
    func addBestScore(backgroundFrame: CGRect, labelFrame: CGRect)
    {
        let imageView = UIImageView(frame: backgroundFrame)
        let image = UIImage(named: "labelBackground")
        imageView.image = image
        bestScore = UILabel(frame: labelFrame)
        configureLabel(label: bestScore, fontSize: 20)
        self.addSubview(imageView)
        self.addSubview(bestScore)
    }
///Current Score Display
    func addCurrentScore(backgroundFrame: CGRect, labelFrame: CGRect)
    {
        let imageView = UIImageView(frame: backgroundFrame)
        let image = UIImage(named: "labelBackground")
        imageView.image = image
        currentScore = UILabel(frame: labelFrame)
        configureLabel(label: currentScore, fontSize: 20)
        self.addSubview(imageView)
        self.addSubview(currentScore)
    }
///user name Diplay
    func addUserName(backgroundFrame: CGRect, labelFrame: CGRect)
    {
        let imageView = UIImageView(frame: backgroundFrame)
        let image = UIImage(named: "userNameBackground")
        imageView.image = image
        userName = UILabel(frame: labelFrame)
        configureLabel(label: userName, fontSize: 25)
        self.addSubview(imageView)
        self.addSubview(userName)
    }
///Message Display
    func addMessage(labelFrame: CGRect)
    {
        message = UILabel(frame: labelFrame)
        configureLabel(label: message, fontSize: 30)
        self.addSubview(message)
    }
    
    
//removes the display from the superview
    func deleteDisplay(display: UILabel)
    {
        display.removeFromSuperview()
    }
    
    
    
// /////////////////////////////////////// Setters /////////////////////////////////////////////////////////
///message Modifier
    func setMessage(newMessage: String)
    {
        message.text = newMessage
    }
///Best Score Modifier
    func setBestScore(newScore: Int)
    {
        bestScore.text = "Best Score: \(newScore)"
    }
///Current Score Modifier
    func setCurrentScore(newScore: Int)
    {
        currentScore.text = "Your Score is \(newScore)"
    }
///username Modifier
    func setUserName(name: String)
    {
        userName.text = name
    }
    
// /////////////////////////////////////// Getters /////////////////////////////////////////////////////////
///get message text
    func getMessage()-> String?
    {
        return message.text
    }
///Best Score Modifier
    func getBestScore()-> Int
    {
        return Int(bestScore.text!)!
      
    }
///Current Score Modifier
    func getCurrentScore()-> Int
    {
      return  Int(currentScore.text!)!
    }
///username Modifier
    func getUserName()-> String?
    {
        return userName.text
    }
    
// /////////////////////////////////////// Helper Functions /////////////////////////////////////////////////////////
///function that configures rhe settting o the UILabel and the text within it
    private func configureLabel(label: UILabel, fontSize: CGFloat)
    {
        label.textColor = UIColor(red: 0.4, green: 0.4, blue: 0.3, alpha: 1)
        label.textAlignment = .center
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: fontSize)
        label.adjustsFontSizeToFitWidth = true
        
    }

}

//End Of Class
