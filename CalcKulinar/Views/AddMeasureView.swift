//
//  AddMeasureViewView.swift
//  CalcKulinar
//
//  Created by Антон Макаров on 16.02.2022.
//

import UIKit
import SwiftUI

class AddMeasureView: UIView {
    let bgImageView = UIImageView(image: UIImage(named: "bg3"))

    let titleLabel = UILabel(text: "Добавить меру", font: .systemFont(ofSize: 25, weight: .bold), textColor: .white)

    let titleTF = UITextField(placeholder: "Название меры...")
    let koeffTF = UITextField(placeholder: "Сколько в 1 кг ?")
    
    let measureTypeSC = UISegmentedControl()
     
    let saveButton = UIButton(title: "Сохранить",
                              font: .systemFont(ofSize: 18, weight: .bold),
                              textColor: .systemMint,
                              bgColor: .white)

      init () {
        super.init(frame: CGRect())
        backgroundColor = .white
          setViews()
          setConstraints()
    }

    private func setViews () {
        measureTypeSC.insertSegment(withTitle: "Вес", at: 0, animated: false)
        measureTypeSC.insertSegment(withTitle: "Объем", at: 1, animated: false)
        measureTypeSC.backgroundColor = UIColor(named: "blackAlpha")
        measureTypeSC.selectedSegmentIndex = 0
        measureTypeSC.selectedSegmentTintColor = .systemYellow

        let action = UIAction { _ in
            if self.measureTypeSC.selectedSegmentIndex == 0 {
                self.koeffTF.placeholder = "Сколько в 1 кг ?"
            } else {
                self.koeffTF.placeholder = "Сколько в 1 литре ?"
            }
        }
        measureTypeSC.addAction(action, for: .valueChanged)
    }

   private func setConstraints() {
        let stack = UIStackView(views: [titleTF, koeffTF, measureTypeSC, saveButton],
                                axis: .vertical,
                                spacing: 15)
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        bgImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(bgImageView)
        addSubview(stack)
        addSubview(titleLabel)

    NSLayoutConstraint.activate([
        bgImageView.topAnchor.constraint(equalTo: self.topAnchor),
        bgImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        bgImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
        bgImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),

        stack.centerXAnchor.constraint(equalTo: centerXAnchor),
        stack.topAnchor.constraint(equalTo: topAnchor, constant:  60),
        stack.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 24),

        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
        titleLabel.bottomAnchor.constraint(equalTo: stack.topAnchor, constant: -10)
    ])
        bgImageView.contentMode = .scaleAspectFill
        for view in stack.arrangedSubviews {
            view.heightAnchor.constraint(equalToConstant: 48).isActive = true
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
