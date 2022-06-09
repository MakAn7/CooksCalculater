//
//  UIButton.swift
//  CalcKulinar
//
//  Created by Антон Макаров on 11.02.2022.
//

import Foundation
import UIKit

extension UIButton {
    
    convenience init(title: String,
                     font:UIFont,
                     textColor: UIColor,
                     bgColor: UIColor) {

        self.init(type: .system)
        setTitle(title, for: .normal)
        titleLabel?.font = font
        titleLabel?.textColor = textColor
        backgroundColor = bgColor
        layer.cornerRadius = 12
        tintColor = textColor
    }
}
