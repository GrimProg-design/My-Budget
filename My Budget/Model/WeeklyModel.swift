//
//  WeeklyModel.swift
//  My Budget
//
//  Created by Вавилов Илья on 28/2/26.
//

import Foundation
import SwiftData

@Model
class WeeklyModel {
    var dayName: String
    var budget: Double
    var food: [FoodItem]
    
    init(dayName: String, budget: Double, food: [FoodItem] = []) {
        self.dayName = dayName
        self.budget = budget
        self.food = food
    }
}
