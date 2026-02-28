//
//  TestingView.swift
//  My Budget
//
//  Created by Вавилов Илья on 27/2/26.
//

import SwiftUI
import SwiftData

struct TestingView: View {
    @Query var allFoods: [FoodItem]
    @Binding var selectedFood: [[FoodItem]]
    
    let columns = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15)
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(dailyFoodEngine()) {
                    FoodTaleView(food: $0)
                }
            }
        }
    }
    
//    57 вес
//    Белок - 1 г на кг
//    сахар - 25г вообще на день
//    Жиров - 0.5г на кг
//    Углеводов - 2г на кг
    
    
    func dailyFoodEngine() -> [FoodItem] {
        let weight = 57.0
        let proteinPerDay: Double = 1 * Double(weight)
        let carbsPerDay: Double = 2 * Double(weight)
        let fatPerDay: Double = 0.5 * Double(weight)
        let sugarPerDay = 25.0
        
        var protein: Double = 0.0
        var carbs: Double = 0.0
        var fat: Double = 0.0
        var sugar: Double = 0.0
        
        var daily: [FoodItem] = []
        
        for food in allFoods {
            protein += food.protein
            carbs += food.carbs
            fat += food.fat
            sugar += food.sugar
            
            if protein <= proteinPerDay && carbs <= carbsPerDay && fat <= fatPerDay && sugar <= sugarPerDay {
                daily.append(food)
            } else {
                break
            }
        }
        
        return daily
    }
}

//#Preview {
//    TestingView()
//}
