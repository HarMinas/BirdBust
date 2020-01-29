//
//  userNameTextField.swift
//  BirdBust
//
//  Created by Harutyun Minasyan on 12/5/17.
//  Copyright © 2017 Harutyun Minasyan. All rights reserved.
//

import UIKit


struct textFieldConfig {
    
    func createTextField(textField: UITextField)
    {
        textField.adjustsFontSizeToFitWidth = true
        textField.keyboardAppearance = .dark
        textField.keyboardType = .default
        textField.background = UIImage(named: "labelBackground")
        textField.placeholder = "Enter Your Name"
        textField.returnKeyType = .done
        textField.clearButtonMode = .whileEditing
        textField.textColor = .white
        
    }
}
