//
//  CalcView.swift
//  CalcKulinar
//
//  Created by Антон Макаров on 11.02.2022.
//

import UIKit

let screen = UIScreen.main.bounds

class CalcView: UIView {

    let bgImageView = UIImageView(image: UIImage(named: "bg"))
    let titleLabel = UILabel(text: "Калькулятор", font: .systemFont(ofSize: 25, weight: .bold), textColor: .systemOrange)

    let initialQuantityTF = UITextField(placeholder: "Количество...")
    let initialMeasureTF = UITextField(placeholder: "Начальная мера")

    let resultQuantityLabel = UILabel(text: "0.00", font: .systemFont(ofSize: 30, weight: .bold), textColor: .white)

    let resultMeasureTF = UITextField(placeholder: "Нужная мера")
    let ingredientTF = UITextField(placeholder: "Выберете ингредиент...")

    let solveButton = UIButton(title: "Посчитать",
                               font: .systemFont(ofSize: 18, weight: .bold),
                               textColor: .white,
                               bgColor: .systemGreen)
    let memoryButton = UIButton(title: "Запомнить",
                               font: .systemFont(ofSize: 18,weight: .bold),
                               textColor: .white,
                               bgColor: .systemMint)
    
    let tableView = UITableView()
    let measurePicker = UIPickerView()
    let ingridientPicker = UIPickerView()
    
    let addIngredientButton = UIButton (title: "",
                                        font: .systemFont(ofSize: 24, weight: .bold),
                                        textColor: .white,
                                        bgColor: .systemOrange)

    init() {
        super.init(frame: CGRect())
        backgroundColor = .systemBlue
        setViews()
        setConstraints()
    }

    private func setViews() {
 
        bgImageView.contentMode = .scaleAspectFill
        resultQuantityLabel.textAlignment = .center
        resultQuantityLabel.backgroundColor = UIColor(named: "blackAlfa")
        resultQuantityLabel.layer.cornerRadius = 12
        resultQuantityLabel.clipsToBounds = true
        
        tableView.backgroundColor = UIColor(named: "blackAlfa")
        tableView.layer.cornerRadius = 12

        tableView.register(IngredientCell.self, forCellReuseIdentifier: IngredientCell.reuseID)
        
        initialQuantityTF.keyboardType = .decimalPad
        
        initialMeasureTF.inputView = measurePicker
        resultMeasureTF.inputView = measurePicker
        ingredientTF.inputView = ingridientPicker
        
        addIngredientButton.layer.cornerRadius = 32
        
        addIngredientButton.setImage(UIImage(systemName: "plus"), for: .normal)
    }
    
    func setConstraints(){
        
        let initialStack = UIStackView(views: [initialQuantityTF, initialMeasureTF],
                                       axis: .horizontal,
                                       spacing: 8)
        
        let resultStack = UIStackView(views: [resultQuantityLabel, resultMeasureTF],
                                      axis: .horizontal,
                                      spacing: 8)
        
        let stack = UIStackView(views: [titleLabel,
                                        initialStack,
                                        resultStack,
                                        ingredientTF,
                                        solveButton,
                                        memoryButton,
                                        tableView],
                                axis: .vertical,
                                spacing: 12)
        
        
        addIngredientButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(bgImageView)
        addSubview(stack)
        addSubview(addIngredientButton)
        
        
        NSLayoutConstraint.activate([
            addIngredientButton.widthAnchor.constraint(equalToConstant: 64),
            addIngredientButton.heightAnchor.constraint(equalToConstant: 64),
            addIngredientButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            addIngredientButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -90)
        ])
        
        bgImageView.translatesAutoresizingMaskIntoConstraints = false
                
        for view in stack.arrangedSubviews {
            if view is UITextField || view is UIButton || view is UIStackView{
                view.heightAnchor.constraint(equalToConstant: 48).isActive = true
            }
        }
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        initialMeasureTF.widthAnchor.constraint(equalTo: resultMeasureTF.widthAnchor).isActive = true
        initialMeasureTF.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            stack.topAnchor.constraint(equalTo: topAnchor, constant: 54),
            stack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -160),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            stack.centerXAnchor.constraint(equalTo: centerXAnchor),

            bgImageView.topAnchor.constraint(equalTo: self.topAnchor),
            bgImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bgImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            bgImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
