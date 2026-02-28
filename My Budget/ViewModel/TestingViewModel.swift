//
//  TestingViewModel.swift
//  My Budget
//
//  Created by Вавилов Илья on 27/2/26.
//

import Foundation
import Combine

class TestingViewModel: ObservableObject {
    @Published private var dailyFood = DailyFoodModel()
    let allFoods: [FoodItem]
    
    init(allFoods: [FoodItem]) {
        self.allFoods = allFoods
    }
    
    func dailyFoodEngine() {
        
    }
}
