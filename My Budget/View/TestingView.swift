//
//  TestingView.swift
//  My Budget
//
//  Created by Вавилов Илья on 27/2/26.
//

import SwiftUI
import SwiftData

struct TestingView: View {
    
    let foods: [FoodItem]
    
    
    let columns = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15)
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 15) {
                ForEach(foods) { food in
                    FoodTaleView(food: food)
                }
            }
            .padding()
        }
    }
    
    //    57 вес
    //    Белок - 1 г на кг
    //    сахар - 25г вообще на день
    //    Жиров - 0.5г на кг
    //    Углеводов - 2г на кг
    
    func generateWeeklyPlan(allFoods: [FoodItem], dailyBudget: Double) -> [DayPlan] {
        let days = ["monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"]
        var weeklyPlan: [DayPlan] = []
        
        for dayName in days {
            var currentDayFoods: [FoodItem] = []
            var spent: Double = 0
            
            // Перемешиваем еду, чтобы каждый день был разным
            let shuffledFoods = allFoods.shuffled()
            
            for food in shuffledFoods {
                if spent + Double(food.price) <= dailyBudget {
                    currentDayFoods.append(food)
                    spent += Double(food.price)
                }
            }
            
            let dayPlan = DayPlan(dayName: dayName, foods: currentDayFoods)
            weeklyPlan.append(dayPlan)
        }
        
        return weeklyPlan
    }
    
    
    //    func dailyFoodEngine() -> [FoodItem] {
    //        let weight = 57.0
    //        let proteinPerDay: Double = 1 * Double(weight)
    //        let carbsPerDay: Double = 2 * Double(weight)
    //        let fatPerDay: Double = 0.5 * Double(weight)
    //        let sugarPerDay = 25.0
    //
    //        var protein: Double = 0.0
    //        var carbs: Double = 0.0
    //        var fat: Double = 0.0
    //        var sugar: Double = 0.0
    //
    //        var daily: [FoodItem] = []
    //
    //        for food in foods {
    //
    //            
    //            protein += food.protein
    //            carbs += food.carbs
    //            fat += food.fat
    //            sugar += food.sugar
    //
    //            if protein <= proteinPerDay && carbs <= carbsPerDay && fat <= fatPerDay && sugar <= sugarPerDay {
    //                daily.append(food)
    //            } else {
    //                break
    //            }
    //        }
    //
    //        return daily
    //    }
}

//#Preview {
//    TestingView()
//}
