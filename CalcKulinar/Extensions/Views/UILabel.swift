//
//  UILabel.swift
//  CalcKulinar
//
//  Created by Антон Макаров on 11.02.2022.
//

import Foundation
import UIKit

extension UILabel {
    
    convenience init(text: String,
                     font:UIFont,
                     textColor: UIColor,
                     bgColor: UIColor = .clear) {
       
        self.init()
        
        self.text = text
        self.textColor = textColor
        self.font = font
        self.backgroundColor = bgColor
        
        
    }
}
