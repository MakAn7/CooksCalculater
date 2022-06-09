//
//  IngredientView.swift
//  CalcKulinar
//
//  Created by Антон Макаров on 16.02.2022.
//

import UIKit

class AddIngredientView: UIView {
    let bgImageViewIngredients = UIImageView(image: UIImage(named: "bgIngredients"))
    let titleLabel = UILabel(text: "Добавить ингредиент", font: .systemFont(ofSize: 25, weight: .bold), textColor: .white)

    let titleIngredientTF = UITextField(placeholder: "Название ингредиента...")
    let densytiIngredientTF = UITextField(placeholder: "Плотность ингредиента...")

    let saveButton = UIButton(title: "Сохранить",
                              font: .systemFont(ofSize: 18, weight: .bold),
                              textColor: .systemMint,
                              bgColor: .white)
    
    init() {
        super.init(frame: CGRect())
        setViews()
        setConstraints()
    }
    
    private func setViews() {
        bgImageViewIngredients.contentMode = .scaleAspectFill
        titleLabel.textAlignment = .center
        saveButton.titleLabel?.textAlignment = .center
        densytiIngredientTF.keyboardType = .decimalPad
        
        
    }
    
    private func setConstraints() {
        
        addSubview(bgImageViewIngredients)
        bgImageViewIngredients.translatesAutoresizingMaskIntoConstraints = false
        
        let textFieldStack = UIStackView(views: [titleIngredientTF,densytiIngredientTF],
                                         axis: .vertical,
                                         spacing: 20)
        
        let allStack = UIStackView(views: [titleLabel,textFieldStack, saveButton],
                                   axis: .vertical,
                                   spacing: 100)
        
        addSubview(allStack)
        allStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            allStack.topAnchor.constraint(equalTo: topAnchor, constant: 60),
            allStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            allStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            
        ])
        
        for field in textFieldStack.arrangedSubviews {
            field.heightAnchor.constraint(equalToConstant: 48).isActive = true
        }
        saveButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        NSLayoutConstraint.activate([
            bgImageViewIngredients.topAnchor.constraint(equalTo: self.topAnchor),
            bgImageViewIngredients.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            bgImageViewIngredients.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            bgImageViewIngredients.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
