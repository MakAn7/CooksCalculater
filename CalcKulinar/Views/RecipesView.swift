//
//  RecipietsView.swift
//  CalcKulinar
//
//  Created by Антон Макаров on 18.02.2022.
//

import UIKit
import SwiftUI

class RecipesView: UIView {
    var collectionView: UICollectionView!

    init() {
        super.init(frame: CGRect())

        collectionView = UICollectionView(frame: CGRect(), collectionViewLayout: createLayout())
        backgroundColor = .white
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.centerXAnchor.constraint(equalTo: centerXAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 90)
        ])
        
        collectionView.register(RecipesCell.self, forCellWithReuseIdentifier: RecipesCell.reuseId)
        
    }
    func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, _) -> NSCollectionLayoutSection in
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.65),
                                                  heightDimension: .fractionalHeight(0.96))
            
            let item = NSCollectionLayoutItem(layoutSize: itemSize )
            
            let gropuSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                   heightDimension: .fractionalWidth(0.5))
            
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: gropuSize,
                                                           subitem: item,
                                                           count: 2)

            group.interItemSpacing = .fixed(12)
            
            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = 0
            
            section.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
            return section
        }
        return layout
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
