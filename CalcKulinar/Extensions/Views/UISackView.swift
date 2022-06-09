//
// UISackView.swift
//  CalcKulinar
//
//  Created by Антон Макаров on 11.02.2022.
//

import Foundation
import UIKit

extension UIStackView {
    
    convenience init(views: [UIView],
                     axis: NSLayoutConstraint.Axis,
                     spacing:CGFloat) {
        
    
        self.init(arrangedSubviews:views) 
        self.axis = axis
        self.spacing = spacing
        
    }
}
