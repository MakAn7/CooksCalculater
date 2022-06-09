//
//  AppIngredientViewController.swift
//  CalcKulinar
//
//  Created by Антон Макаров on 16.02.2022.
//

import UIKit

class AddIngredientController: UIViewController {
    
let mainView = AddIngredientView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      view = mainView
        addTargets()
    }
    
    func addTargets() {
        
        let addIngredient = UIAction  { _ in
            
            guard let title = self.mainView.titleIngredientTF.text, title.count > 2 else {
                return self.infoAlert(message: "Имя ингедиента должно быть более 2 текстовых символов")
            }
            
            guard let densityStr = self.mainView.densytiIngredientTF.text else {return}
            
            guard let density = Double(densityStr) else {
                return self.infoAlert(message: "Укажите плотность в формате целого числа или 0.0 ")
            }
            let ingredient = Ingredient(title: title , density: density)
            
            
            if !ingredients.contains(ingredient){
                ingredients.append(ingredient)
                self.dismiss(animated: true)
            }
        }
        
        mainView.saveButton.addAction(addIngredient, for: .touchUpInside)
    }
    
    
//    func tapSaveButton(button: UIButton) {
//        if button == mainView.saveButton {
//
//            guard let text = mainView.densytiIngredientTF.text else {return}
//            guard let _ = Double(text) else {
//                print("Значение \(mainView.densytiIngredientTF) не является числом ")
//                return
//            }
//            print("Плотность - \(mainView.densytiIngredientTF) ")
//        }
//
//    }
}


// MARK: -  CANVAS

import SwiftUI

struct Providerrr: PreviewProvider {
    static var previews: some View {
        ContainerrrView().edgesIgnoringSafeArea(.all).previewInterfaceOrientation(.portrait)
    }
    
    struct ContainerrrView: UIViewControllerRepresentable {
        func makeUIViewController(context: UIViewControllerRepresentableContext<Providerrr.ContainerrrView>) -> AddIngredientController {
            return AddIngredientController()
        }
        func updateUIViewController(_ uiViewController: Providerrr.ContainerrrView.UIViewControllerType, context: UIViewControllerRepresentableContext<Providerrr.ContainerrrView>) {
            
        }
    }
}

