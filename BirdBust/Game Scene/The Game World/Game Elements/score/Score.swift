
//  Score.swift
//  1stGame
//
//  Created by Harutyun Minasyan on 6/19/17.
//  Copyright © 2017 Harutyun Minasyan. All rights reserved.
//

import UIKit
import SpriteKit

class Score: SKNode
{
// /////////////////////////////////////////////////   INSTANCE VARIABLES  ////////////////////////////////////////////
    
    private var blueFeather: FeatherLabel!
    private var redFeather: FeatherLabel!
    private var yellowFeather: FeatherLabel!
    private var grayFeather: FeatherLabel!
    private var feathers: [FeatherLabel]!
    
    
// /////////////////////////////////////////////////// CREATING THE FEATHER DISPLAYS ///////////////////////////////////

    /// Creates a feather to display at a position
    func createFeatherDisplay(position: CGPoint)
    {
        blueFeather = FeatherLabel(type: .blue)
        redFeather = FeatherLabel(type: .red)
        yellowFeather = FeatherLabel(type: .yellow)
        grayFeather = FeatherLabel(type: .gray)
        
        feathers = [blueFeather, redFeather, yellowFeather, grayFeather]
        for feather in feathers
        {
            feather.zPosition = 12
            self.addChild(feather)
        }
        blueFeather.position = position
        layoutPositions()
    }
    
    
/// Positions the feathers
    func layoutPositions()
    {
        var nextPosition = CGPoint(x: 10, y: -(blueFeather.getFramesTop() + 15))
        redFeather.position = nextPosition
  
        nextPosition.y -= (blueFeather.getFramesTop() + 15)
        yellowFeather.position = nextPosition
        print(yellowFeather.frame)

        nextPosition.y -= (blueFeather.getFramesTop() + 15)
        grayFeather.position = nextPosition
    }
    

 
//  ///////////////////////////////////////////////////  SETTERS //////////////////////////////////////////////
/// Set The Count of the Feather and Animate It
    func addFeathers(amount: Int, type: FeatherType)
    {
        switch type
        {
        case .blue: blueFeather.setScore(by: amount) ; blueFeather.animateFeather()
        case .red: redFeather.setScore(by: amount) ; redFeather.animateFeather()
        case .yellow: yellowFeather.setScore(by: amount) ; yellowFeather.animateFeather()
        case .gray: grayFeather.setScore(by: amount) ; grayFeather.animateFeather()
        }
    }
  
//  ///////////////////////////////////////////////////  GETTERS ///////////////////////////////////////
/// Get the position of the feathers
    func featherPosition(type: FeatherType)->CGPoint
    {
        switch type
        {
        case .blue: return blueFeather.position
        case .yellow: return yellowFeather.position
        case .red: return redFeather.position
        case .gray: return grayFeather.position
        }
    }
    
/// Returns a dictionary of integers contatining the feather types and the amount
    func getFeatherCount()->[(FeatherType,Int)]
    {
        return [ (.blue, blueFeather.getFeatherCount()), (.gray, grayFeather.getFeatherCount()), (.yellow,yellowFeather.getFeatherCount()), (.red, redFeather.getFeatherCount())]
            
    }
    

   
}
//END OF CLASS
