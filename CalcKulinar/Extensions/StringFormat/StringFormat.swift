//
//  StringFormat.swift
//  CalcKulinar
//
//  Created by Антон Макаров on 18.02.2022.
//

import Foundation
import UIKit


extension UIViewController {
    
    func stringFormat(count: Double, measure: String) -> String {
      String(format: "%.2f", count) + " \(measure)"
   }
}
