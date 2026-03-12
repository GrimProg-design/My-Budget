//
//  WeeklyModel.swift
//  My Budget
//
//  Created by Вавилов Илья on 28/2/26.
//

import Foundation
import SwiftData

@Model
class DayPlan {
    var date: Date
    var dayName: String
    @Relationship(deleteRule: .nullify) var foods: [FoodItem]
    
    init(dayName: String, foods: [FoodItem] = []) {
        self.date = Date()
        self.dayName = dayName
        self.foods = foods
    }
}
