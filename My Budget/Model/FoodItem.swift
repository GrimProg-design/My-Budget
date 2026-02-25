//
//  FoodModel.swift
//  My Budget
//
//  Created by Вавилов Илья on 25/2/26.
//

import Foundation
import SwiftData

@Model
class FoodItem {
//    Описание
    var name: String
    var details: String
    var price: Int
    var ingridiets: [String]
    
//    Оценка полезности
    var protein: Double
    var fat: Double
    var carbs: Double
    var sugar: Double
    
//    Картинка
    @Attribute(.externalStorage) var imageData: Data?
    
    init(name: String,
         details: String,
         price: Int,
         ingridients: [String],
         sugar: Double = 0,
         carbs: Double = 0,
         protein: Double = 0,
         fat: Double = 0,
         imageData: Data? = nil)
    {
        self.name = name
        self.details = details
        self.price = price
        self.ingridiets = ingridients
        self.sugar = sugar
        self.carbs = carbs
        self.protein = protein
        self.fat = fat
        self.imageData = imageData
    }
    
//    логика оценки блюда
    var healthStatus: FoodStatus {
            if sugar < 5 && protein > 10 {
                return .superfood
            }
            if sugar > 20 {
                return .junk
            }
            return .neutral
        }
}

enum FoodStatus: String {
    case superfood = "Зеленый"
    case neutral = "Желтый"
    case junk = "Красный"
}
