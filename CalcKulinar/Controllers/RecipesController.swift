//
//  RecipietsController.swift
//  CalcKulinar
//
//  Created by Антон Макаров on 18.02.2022.
//

import UIKit

class RecipesController: UIViewController {

    let mainView = RecipesView()
    
    let titles = ["Борщ", "ffggd", "fgdgdf", "vcbbc", "dfsfgsd"]
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        view.backgroundColor = .systemBlue
        
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
    }
    


}

extension RecipesController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(titles[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        titles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecipesCell.reuseId, for: indexPath) as! RecipesCell
        
        cell.layer.cornerRadius = 16
        cell.label.text = titles[indexPath.item]
        
        return cell
        
    }
    
    
}
