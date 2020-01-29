//
//  SKScene Extension.swift
//  BirdBust
//
//  Created by Harutyun Minasyan on 11/29/17.
//  Copyright © 2017 Harutyun Minasyan. All rights reserved.
//

import Foundation
import SpriteKit

///Extension to the SKScene
extension SKNode
{
    ///Returns the height of the frame of the scene
    func selfHeight()->CGFloat
    {
        return self.frame.size.height
    }
    
    ///Returns the width of the frame of the scene
    func selfWidth()->CGFloat
    {
        return self.frame.size.width
    }
}


///Extension to the UIView
extension UIView
{
    
    ///Returns the height of the bounding rectangle
    func boundHeight()->CGFloat
    {
        return self.bounds.size.height
    }
    
    ///Returns the width of the bounding rectangle
    func boundWidth()->CGFloat
    {
        return self.bounds.size.width
    }
}
