//
//  RecipesCell.swift
//  CalcKulinar
//
//  Created by Антон Макаров on 18.02.2022.
//

import UIKit

class RecipesCell: UICollectionViewCell {
    static let reuseId = "RecipesCell"
    
    let imageView =  UIImageView(image: UIImage(named: "bg"))
    
    let label = UILabel(text: "HELLO", font: .systemFont(ofSize: 18), textColor: .white, bgColor: .brown)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
        setViews()
        setConstraints()
    }
    
    private func setViews() {
        clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        label.textAlignment = .center
    }
    
    private func setConstraints() {
        addSubview(imageView)
        addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            label.heightAnchor.constraint(equalToConstant: 30),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor,constant: 0)
            
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
