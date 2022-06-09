//
//  eUITextField.swift
//  CalcKulinar
//
//  Created by Антон Макаров on 11.02.2022.
//

import Foundation
import UIKit


extension UITextField {
    
    convenience init(placeholder: String) {
        self.init()
        self.placeholder = placeholder
        self.layer.cornerRadius = 12
        self.backgroundColor = .white

        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 0))
        leftViewMode = .always
        
        
    }
}
