//
//  Ingredient.swift
//  CalcKulinar
//
//  Created by Антон Макаров on 11.02.2022.
//


struct Ingredient: Equatable {
    
    let title: String
    let density: Double
}

var ingredients = [
    Ingredient(title: "Крупа гречневая", density: 0.8),
    Ingredient(title: "Крупа овсяная", density: 0.68),
    Ingredient(title: "Крупа манная", density: 0.8),
    Ingredient(title: "Крупа рисовая", density: 0.91),
    Ingredient(title: "Сахарный песок", density: 0.8),
    Ingredient(title: "Вода", density: 1)
]
