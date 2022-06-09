//
//  ViewController.swift
//  CalcKulinar
//
//  Created by Антон Макаров on 11.02.2022.
//

import UIKit

class CalcController: UIViewController{
    var positions = [Position]() {
        didSet {
            mainView.tableView.reloadData()
        }
    }
    
    var measures = [Measure]()
    //  свойства начальный вес
    var initialMeasure = Measure(measureType: .weight, title: "КГ", coeff: 1) {
        didSet{
            self.mainView.initialMeasureTF.text = initialMeasure.title
        }
    }
    
    // результат измерения
    var resultMeasure = Measure(measureType: .weight, title: "КГ", coeff: 1) {
        didSet {
            self.mainView.resultMeasureTF.text = resultMeasure.title
        }
    }
    
    
    // ингредиент
    var ingredient = ingredients[0] {
        didSet{
            mainView.ingredientTF.text = ingredient.title
        }
    }
    
    var isInit = true
    
    // переменная для подсчета перевода
    var result = 0.0
    
    let mainView = CalcView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = mainView
        addDelegate()
        addTagrets()
        self.measures = DataService.shared.getMeasures()
    }
    
    func memory() {
        
        let ingredient = ingredient.title
        let measure = resultMeasure
        
        guard let countStr = self.mainView.resultQuantityLabel.text else { return }
        
        guard let count = Double(countStr) else {
            return  }
        
        let position = Position(title: ingredient, count: count, measure: measure.title)
        self.positions.append(position)
    }
    
    
    func calculate() {
        
        guard let initNumberStr = mainView.initialQuantityTF.text else {return}
        
        guard let initNumber = Double(initNumberStr) else {
            return infoAlert(message: "Не верное значение для подсчета")
        }
        
        // обработать типы мер
        
        let initType = initialMeasure.measureType
        let resultType = resultMeasure.measureType
        
        var result = 0.0
        switch(initType, resultType) {
            
        case(.weight, . weight),(.volume, . volume) :
            result = initNumber * resultMeasure.coeff / initialMeasure.coeff
        case (.weight, .volume):
            result = (initNumber * resultMeasure.coeff / initialMeasure.coeff) / self.ingredient.density
        case (.volume, .weight):
            result = (initNumber * resultMeasure.coeff / initialMeasure.coeff) * self.ingredient.density
            
        }
        mainView.resultQuantityLabel.text = "\(result)"
    }
    
    func addTagrets() {
        let calcTap = UIAction {_ in
            self.calculate()
        }
        
        let memoryTap = UIAction { _ in
            self.memory()
        }
        mainView.solveButton.addAction(calcTap, for: .touchUpInside)
        mainView.memoryButton.addAction(memoryTap, for: .touchUpInside)
        
        let action = UIAction{ _ in
            let actionSheets = UIAlertController(title: nil,
                                                 message: "Чего хотите добавить?",
                                                 preferredStyle: .actionSheet)
            
            let ingredientAction = UIAlertAction(title: "Ингредиент",
                                                 style: .default) { _ in
                
                let vc = AddIngredientController()
                self.present(vc, animated: true)
            }
            
            let measureAction = UIAlertAction(title: "Величину измерения", style: .default) { _ in
                let vc = AddMeasureController()
                vc.delegate = self
                self.present(vc, animated: true)
            }
            
            let cancelAction = UIAlertAction(title: "Не хочу добавлять ⛔️!", style: .cancel, handler: nil)
            actionSheets.addAction(ingredientAction)
            actionSheets.addAction(measureAction)
            actionSheets.addAction(cancelAction)
            self.present(actionSheets,animated: true)
            
        }
        mainView.addIngredientButton.addAction(action, for: .touchUpInside)
    }
    
    func addDelegate(){
        
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.measurePicker.delegate = self
        mainView.measurePicker.dataSource = self
        mainView.ingridientPicker.delegate = self
        mainView.ingridientPicker.dataSource = self
        mainView.resultMeasureTF.delegate = self
        mainView.initialMeasureTF.delegate = self
    }
}

extension CalcController: AddSomethingDelegate {
    func reloadData() {
        
        self.measures = DataService.shared.getMeasures()
    }
}
// MARK: - UITextFieldDelegate
extension  CalcController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == mainView.initialMeasureTF {
            isInit = true
            textField.text = measures.first?.title ?? ""
        } else if textField == mainView.resultMeasureTF{
            isInit = false
            textField.text = measures.first?.title ?? ""
        }
    }
}

// MARK: - UIPickerViewDelegate, UIPickerViewDataSource
extension CalcController : UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == mainView.measurePicker {
            return measures.count
        } else {
            return ingredients.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == mainView.measurePicker {
            return measures[row].title
        } else {
            return ingredients[row].title
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == mainView.measurePicker {
            if isInit {
                self.initialMeasure = measures[row]
            } else {
                self.resultMeasure = measures[row]
            }
        } else {
            self.ingredient = ingredients[row]
            view.endEditing(true)
        }
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension CalcController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        positions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: IngredientCell.reuseID, for: indexPath) as! IngredientCell
        
        cell.ingredientLabel.text = positions[indexPath.row].title
        cell.countLabel.text = stringFormat(count: positions[indexPath.row].count, measure: positions[indexPath.row].measure)
        cell.backgroundColor = .clear
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive,
                                              title: "Удалить") { _, _, completion in
            self.positions.remove(at: indexPath.row)
        }
        let config = UISwipeActionsConfiguration(actions: [deleteAction])
        return config
    }
}

// MARK: -  CANVAS
import SwiftUI

struct Providerr: PreviewProvider {
    static var previews: some View {
        ContainerrView().edgesIgnoringSafeArea(.all).previewInterfaceOrientation(.portrait)
    }
    
    struct ContainerrView: UIViewControllerRepresentable {
        func makeUIViewController(context: UIViewControllerRepresentableContext<Providerr.ContainerrView>) -> CalcController {
            return CalcController()
        }
        func updateUIViewController(_ uiViewController: Providerr.ContainerrView.UIViewControllerType, context: UIViewControllerRepresentableContext<Providerr.ContainerrView>) {
            
        }
    }
}



