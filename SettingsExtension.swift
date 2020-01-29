//
//  SettingsExtension.swift
//  BirdBust
//
//  Created by Harutyun Minasyan on 12/7/17.
//  Copyright © 2017 Harutyun Minasyan. All rights reserved.
//

import UIKit


extension SettingsMenu {
    
    //SettingsButton
    func changeUserName(scale: CGFloat)->CGRect
    {
        let x = boundWidth() - scale
        let y = boundHeight()/10
        let size = CGSize(width: scale, height: scale)
        let origin = CGPoint(x: x - scale/2, y: y - scale/2)
        let frame = CGRect(origin: origin, size: size)
        return frame
    }
}
