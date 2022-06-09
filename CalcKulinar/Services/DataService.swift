//
//  DataService.swift
//  CalcKulinar
//
//  Created by Антон Макаров on 18.02.2022.
//

import Foundation

class DataService {
    static let shared = DataService()

    private let defaults = UserDefaults.standard
    
    var initialMeasures = [
        Measure(measureType: .weight, title: "КГ", coeff: 1),
        Measure(measureType: .weight, title: "Г", coeff: 1000),
        Measure(measureType: .weight, title: "МГ", coeff: 1_000_000),
        Measure(measureType: .weight, title: "Л", coeff: 1),
        Measure(measureType: .volume, title: "Куб.М", coeff: 0.001)
    ]

    private let measuresPath = "measures"
    
    private init() { }
    
    func measureToDics(_ measure: Measure) -> [String: Any] {
        var dict = [String: Any]()
        dict["title"] = measure.title
        dict["coeff"] = measure.coeff
        dict["measureTyoe"] = measure.measureType.rawValue
        return dict
    }
    
    func dictToMeasure(_ dict: [String: Any]) -> Measure? {

        guard let title = dict["title"] as? String,
              let measureTypeValue =  dict["measureTyoe"] as? String,
              let coeff =  dict["coeff"] as? Double else {
                  print("Error не удалось извлечь значение")
                  return nil
              }
        
        let measureType = MeasureType(measureTypeValue)
        let measure = Measure(measureType: measureType, title:title, coeff: coeff)
        
        return measure
    }
    
    
    func save(measures: [Measure]) {
        var allMeasures = [Any]()
        var newMeasures = [Any]()

        if let measuresDict = defaults.array(forKey: measuresPath), measuresDict.count > 0 {
            for measure in measures {
                let measureDict = measureToDics(measure)
                newMeasures.append(measureDict)
            }
            
            allMeasures = measuresDict + newMeasures
            
        } else {
            for measure in measures {
                let measureDict = measureToDics(measure)
                allMeasures.append(measureDict)
            }
        }
        defaults.setValue(allMeasures, forKey: measuresPath)
        
    }
    
    func getMeasures() -> [Measure] {
        var measures = [Measure]()

        if let measuresDict = defaults.array(forKey: measuresPath), measuresDict.count > 0 {
            for measDict in measuresDict {
                if let measure = dictToMeasure(measDict as! [String: Any]){
                    measures.append(measure)
                }
            }
            return measures
        } else {
            save(measures: initialMeasures)
            return initialMeasures
        }
    }
}


