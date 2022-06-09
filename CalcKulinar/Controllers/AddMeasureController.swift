//
//  AddMeasureViewController.swift
//  CalcKulinar
//
//  Created by Антон Макаров on 16.02.2022.
//

import UIKit

protocol AddSomethingDelegate {
    func reloadData ()
}

class AddMeasureController: UIViewController {
    var delegate: AddSomethingDelegate?
    let mainView = AddMeasureView()
    override func viewDidLoad() {
        super.viewDidLoad()
      view = mainView
        addActions()
    }
    
    
    func addActions () {
        let saveMeasureAction = UIAction { _ in
            guard let title = self.mainView.titleTF.text, title.count > 2 else {
                return self.infoAlert(message: "Имя ингедиента должно быть более 2 текстовых символов")
            }
            
            guard let koeffDouble = self.mainView.koeffTF.text else {return}
            
            guard let koeff = Double(koeffDouble) else {
                return self.infoAlert(message: "Укажите коэффициент в формате целого числа или 0.0 ")
                
            }
            
            let type: MeasureType = self.mainView.measureTypeSC.selectedSegmentIndex == 0 ?.weight : .volume
            
            let measure = Measure(measureType: type, title: title, coeff: koeff)
            
            DataService.shared.save(measures: [measure])
            self.delegate?.reloadData()
            self.dismiss(animated: true)
        }
        self.mainView.saveButton.addAction(saveMeasureAction, for: .touchUpInside)
    }
}

// MARK: -  CANVAS

import SwiftUI

struct Providerrrr: PreviewProvider {
    static var previews: some View {
        ContainerrrrView().edgesIgnoringSafeArea(.all).previewInterfaceOrientation(.portrait)
    }
    
    struct ContainerrrrView: UIViewControllerRepresentable {
        func makeUIViewController(context: UIViewControllerRepresentableContext<Providerrrr.ContainerrrrView>) -> AddMeasureController {
            return AddMeasureController()
        }
        func updateUIViewController(_ uiViewController: Providerrrr.ContainerrrrView.UIViewControllerType, context: UIViewControllerRepresentableContext<Providerrrr.ContainerrrrView>) {
            
        }
    }
}
