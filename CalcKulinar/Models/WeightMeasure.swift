//
//  WeightMeasure.swift
//  CalcKulinar
//
//  Created by Антон Макаров on 11.02.2022.
//

import Foundation

enum MeasureType: String {
    case weight = "Все"
    case volume = "Объем"
    
    init(_ value: String) {
        switch value {
        case "Вес" :
            self = .weight
        default:
            self = .volume
        }
    }
}

struct Measure{
    let measureType: MeasureType
    let title: String
    let coeff: Double
}


