//
//  GameMenu.swift
//  BirdBust
//
//  Created by Harutyun Minasyan on 12/1/17.
//  Copyright © 2017 Harutyun Minasyan. All rights reserved.
//

import UIKit


class GameMenu: UIView, UITextFieldDelegate {
    
// /////////////////////////////////////// Instance Variables /////////////////////////////////////////////////////////
    private var playButton: UIButton!
    private var saveNameButton: UIButton!
    private var settingsButton: UIButton!
    private var userTextField: UITextField!
    private var displays: MenuDisplays!
    private var birdImage: UIImageView!
    private var cannonImage: UIImageView!
    
   
// ////////////////////////////////////////DISPLAYS/LABELS//////////////////////////////////////////////////////////
//Add Displays to locations to their Screens-Passing true to the parameters tunrs on the appropriate displays
    func addDisplays(userName: Bool, bestScore: Bool, messageBoard: Bool, currentScore: Bool)
    {
        displays = MenuDisplays(frame: self.frame)
        displays.backgroundColor = .black
            if userName {displays.addUserName(backgroundFrame: userNameFrame().0, labelFrame: userNameFrame().1)}
            if bestScore {displays.addBestScore(backgroundFrame: bestScoreFrame().0, labelFrame: bestScoreFrame().1)}
            if messageBoard {displays.addMessage(labelFrame: messageBoardframe().1)}
            if currentScore {displays.addCurrentScore(backgroundFrame: currentScoreFrame().0, labelFrame: currentScoreFrame().1)}
        self.addSubview(displays)
    }
    

//Setters for interacting with the display's contents
///Best Score
    func setBestScore(best: Int)
    {
        displays.setBestScore(newScore: best)
    }
    //Current Score
    func setCurrentScore(new: Int)
    {
        displays.setCurrentScore(newScore: new)
    }
    //Changing the Message
    func changeMessage(newMessage: String)
    {
        displays.setMessage(newMessage: newMessage)
    }
    //Changing the Player's name
    func setUserName(name: String)
    {
        displays.setUserName(name: name)
    }
    
//getters display labels
///message
    func getMessage()-> String?
    {
        return displays.getMessage()
    }
///Best Score
    func getBestScore()-> Int
    {
        return displays.getBestScore()
    }
///Current Score
    func getCurrentScore()-> Int
    {
        return  displays.getCurrentScore()
    }
///username
    func getUserName()-> String?
    {
        return displays.getUserName()
    }
    
 
// ///////////////////////////////////////////BUTTONS////////////////////////////////////////////////////////////
    
///Add Buttons to Menu
///Play Button
    func addPlayButton()->UIButton
    {
        let buttonImage = UIImage(named: "playButtonPressed")
        let buttonPressed = UIImage(named: "playButton")
        playButton = UIButton(frame: playButtonFrame(scale: 75))
        playButton.setImage(buttonImage, for: .normal)
        playButton.setImage(buttonPressed, for: .highlighted)
        self.addSubview(playButton)
        return playButton
    }
/// UserNameSave Button
    func addSaveButton()->UIButton
    {
        let buttonImage = UIImage(named: "saveNameButton")
        saveNameButton = UIButton(frame: saveButtonFrame(scale: 75).0)
        saveNameButton.setImage(buttonImage, for: .normal)
        self.addSubview(saveNameButton)
        return saveNameButton
    }
/// Settings Button
    func addSettingsButton()->UIButton
    {
        let buttonImage = UIImage(named: "settingsButton")
        settingsButton = UIButton(frame: settingsButtonFrame(scale: 50))
        settingsButton.setImage(buttonImage, for: .normal)
        self.addSubview(settingsButton)
        return settingsButton
    }
    

// /////////////////////////////////////////////////////TEXTFIELDS///////////////////////////////////////////////////////////
    func  addTextField()
    {
        userTextField = UITextField(frame: textFieldFrame().0)
        userTextField.adjustsFontSizeToFitWidth = true
        userTextField.keyboardAppearance = .dark
        userTextField.keyboardType = .default
        userTextField.background = UIImage(named: "labelBackground")
        userTextField.placeholder = "Enter Your Name"
        userTextField.returnKeyType = .done
        userTextField.clearButtonMode = .whileEditing
        userTextField.textColor = .white
        userTextField.textAlignment = .center
        userTextField.delegate = self
        self.addSubview(userTextField)
    }

//Text Field Delegate methods
///Called when done button is pressed on the keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        userTextField.resignFirstResponder()
        return true
    }
///Checks the text of the textfield - this is where the max number of characters for the name is set
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let name = ((textField.text?.count)! + string.count)
        if name < 16 {
            return true
        } else {
            return false
        }
    }
///called when the text field begins editing- here the position of the textfield and the save button are shifted up for visibility
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        userTextField.frame = textFieldFrame().1
        saveNameButton.frame = saveButtonFrame(scale: 75).1
        return true
    }
///called when the text field ends editing- here the position of the textfield and the save button are positioned back to their original places
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        userTextField.frame = textFieldFrame().0
        saveNameButton.frame = saveButtonFrame(scale: 75).0
        return true
    }
    

// Getters for the menu elements
///userTextField
    func getUserTextField()-> UITextField
    {
        return userTextField
    }

    

// /////////////////////////////////////////////////////Menu Images///////////////////////////////////////////////////////////

    private func addBirdImage()
    {
        birdImage = UIImageView(frame: birdBundleFrame())
        birdImage.image = UIImage(named: "BirdComboImage")
        self.addSubview(birdImage)
    }
    
    private func addCannonImage()
    {
        cannonImage = UIImageView(frame: menuCannonFrame())
        cannonImage.image = UIImage(named: "angryCannonPic")
        self.addSubview(cannonImage)
    }
// /////////////////////////////////////////////////////MENU LIFECYCLE-CONFIGURATION//////////////////////////////////////////
    enum menuType
    {
        case normal
        case welcome
        case firstTime
        case firstTimeWelcome
    }
    //Normal Menu
    func showMenu(parent: UIView, type: menuType)
    {
        switch type {
        case .normal: //displays menu when user has already launched the application before- subsequent runs- has current score
            addDisplays(userName: true, bestScore: true, messageBoard: true, currentScore: true)
        case .welcome: //displays menu when the user has just launched the application but not for the first time ever
            addDisplays(userName: true, bestScore: true, messageBoard: true, currentScore: false)
        case .firstTime://first Time Ever launch- has a text field to enter the name
            addDisplays(userName: false, bestScore: false, messageBoard: false, currentScore: false)
        case .firstTimeWelcome: //presented only the first time ever Has only username, play and setting buttons, and a welcome message
            addDisplays(userName: true, bestScore: false, messageBoard: true, currentScore: false)
        }
        addBirdImage()
        addCannonImage()
        parent.addSubview(self)
    }
  
}
///END OF CLASS
