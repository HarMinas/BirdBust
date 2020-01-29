//
//  Menu Extension.swift
//  BirdBust
//
//  Created by Harutyun Minasyan on 12/1/17.
//  Copyright © 2017 Harutyun Minasyan. All rights reserved.
//

import Foundation
import UIKit

extension GameMenu {
    
    ///positions and Frames of the menu elements
    //playButton frame
    func playButtonFrame(scale: CGFloat)->CGRect
    {
        let x = boundWidth()/2
        let y = boundHeight() - boundHeight()/4
        let size = CGSize(width: scale, height: scale)
        let origin = CGPoint(x: x - scale/2, y: y - scale/2)
        let frame = CGRect(origin: origin, size: size)
        return frame
    }
    //saveButtonPosition -two positions are available given by the two rects that are outputted
    func saveButtonFrame(scale: CGFloat)->(CGRect,CGRect)
    {
        let x = boundWidth()/2
        let y = boundHeight() - boundHeight()/4
        let size = CGSize(width: scale, height: scale)
        let origin = CGPoint(x: x - scale/2, y: y - scale/2)
        let normalFrame = CGRect(origin: origin, size: size)
        let upFrame = CGRect(x: origin.x, y: origin.y - 150, width: size.width, height: size.height)
        return (normalFrame, upFrame)
    }
    //SettingsButton
    func settingsButtonFrame(scale: CGFloat)->CGRect
    {
        let x = boundWidth() - scale
        let y = boundHeight()/10
        let size = CGSize(width: scale, height: scale)
        let origin = CGPoint(x: x - scale/2, y: y - scale/2)
        let frame = CGRect(origin: origin, size: size)
        return frame
    }
    //BestScore Display frame
    func bestScoreFrame()->(CGRect,CGRect)
    {
        let x = boundWidth()/2
        let y = boundHeight()/3
        let size = CGSize(width: boundWidth()/3.7, height: boundHeight()/9)
        let position = CGPoint(x: x - size.width/2 , y: y - size.height/2)
        let backgroundRect = CGRect(origin: position, size: size)
        //Rect for the UIlabel- this one is smaller so the label texts fits nicely in the imageSpace without overflowing
        let labelSize = CGSize(width: size.width * 0.9, height: size.height)
        let labelOrigin = CGPoint(x: x - labelSize.width/2, y: y - labelSize.height/2)
        let labelRect = CGRect(origin: labelOrigin, size: labelSize)
        return (backgroundRect,labelRect)
    }
    //currentScore display frame
    func currentScoreFrame()->(CGRect,CGRect)
    {
        //Rect for the background image
        let x = boundWidth()/2
        let y = boundHeight()/2
        let size = CGSize(width: boundWidth()/3.7, height: boundHeight()/9)
        let position = CGPoint(x: x - size.width/2 , y: y - size.height/2)
        let backgroundRect = CGRect(origin: position, size: size)
        //Rect for the UIlabel- this one is smaller so the label texts fits nicely in the imageSpace without overflowing
        let labelSize = CGSize(width: size.width * 0.9, height: size.height)
        let labelOrigin = CGPoint(x: x - labelSize.width/2, y: y - labelSize.height/2)
        let labelRect = CGRect(origin: labelOrigin, size: labelSize)
        return (backgroundRect,labelRect)
    }
    //user name and last name frame
    func userNameFrame()->(CGRect,CGRect)
    {
        let x = 50 + boundWidth()/8
        let y = boundHeight()/10
        let size = CGSize(width: boundWidth()/3.7, height: boundHeight()/10)
        let position = CGPoint(x: x - size.width/2 , y: y - size.height/2)
        let backgroundRect = CGRect(origin: position, size: size)
        //Rect for the UIlabel- this one is smaller so the label texts fits nicely in the imageSpace without overflowing
        let labelSize = CGSize(width: size.width * 0.9, height: size.height)
        let labelOrigin = CGPoint(x: x - labelSize.width/2, y: y - labelSize.height/2)
        let labelRect = CGRect(origin: labelOrigin, size: labelSize)
        return (backgroundRect,labelRect)
    }
    //messageBoard frame
    func messageBoardframe()->(CGRect,CGRect)
    {
        let x = boundWidth() - boundWidth()/2
        let y = boundHeight() - boundHeight()/2
        let size = CGSize(width: boundWidth()/2, height: boundWidth()/10)
        let position = CGPoint(x: x - size.width/2 , y: y - size.height/2)
        let backgroundRect = CGRect(origin: position, size: size)
        //Rect for the UIlabel- this one is smaller so the label texts fits nicely in the imageSpace without overflowing
        let labelSize = CGSize(width: size.width * 0.9, height: size.height)
        let labelOrigin = CGPoint(x: x - labelSize.width/2, y: y - labelSize.height/2)
        let labelRect = CGRect(origin: labelOrigin, size: labelSize)
        return (backgroundRect,labelRect)
    }
    //text field frame
    func textFieldFrame()->(CGRect, CGRect)
    {
        //Rect for the background image
        let x = boundWidth()/2
        let y = boundHeight()/2
        let size = CGSize(width: boundWidth()/2.5, height: boundHeight()/7.5)
        let position = CGPoint(x: x - size.width/2 , y: y - size.height/2)
        let normalFrame = CGRect(origin: position, size: size)
        let upFrame = CGRect(x: position.x, y: position.y - 150, width: size.width, height: size.height)
        return (normalFrame, upFrame)
    }
/// Creates and positions the birdBundle image for the Menues
    func birdBundleFrame()->CGRect
    {
        let x = boundWidth()
        let y = boundHeight()
        let size = CGSize(width: boundWidth()/5, height: boundHeight()/1.5)
        let position = CGPoint(x: x - size.width, y: y - size.height)
        return CGRect(origin: position, size: size)
    }
/// Creates and positions the Cannon image for the Menues
    func menuCannonFrame()->CGRect
    {
        let x: CGFloat = 0
        let y = boundHeight()
        let size = CGSize(width: boundWidth()/5, height: boundHeight()/3)
        let position = CGPoint(x: x , y: y - size.height*0.7)
        return CGRect(origin: position, size: size)
    }
}

