//
//  AlertForError.swift
//  CalcKulinar
//
//  Created by Антон Макаров on 18.02.2022.
//

import Foundation
import UIKit

extension UIViewController {
    
    func infoAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true,completion: nil)
    }
}
