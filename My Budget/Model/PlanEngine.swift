//
//  PlanEngine.swift
//  My Budget
//
//  Created by Вавилов Илья on 28/2/26.
//

import Foundation

struct PlanEngine {
    static func generate(allFoods: [FoodItem], budget: Double) -> [FoodItem] {
        let limits = (p: 57.0, c: 114.0, f: 28.5, s: 25.0) 
        var current = (p: 0.0, c: 0.0, f: 0.0, s: 0.0, cost: 0.0)
        var result: [FoodItem] = []
        
        let shuffled = allFoods.shuffled()
        
        for food in shuffled {
            let canAdd = (current.p + food.protein <= limits.p) &&
                         (current.c + food.carbs <= limits.c) &&
                         (current.f + food.fat <= limits.f) &&
                         (current.s + food.sugar <= limits.s) &&
                         (current.cost + Double(food.price) <= budget)
            
            if canAdd {
                result.append(food)
                current.p += food.protein
                current.c += food.carbs
                current.f += food.fat
                current.s += food.sugar
                current.cost += Double(food.price)
            }
        }
        return result
    }
}
