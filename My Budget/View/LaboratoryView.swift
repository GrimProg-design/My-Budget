//
//  LaboratoryView.swift
//  My Budget
//
//  Created by Вавилов Илья on 24/2/26.
//

import SwiftUI
import SwiftData
import Combine

struct LaboratoryView: View {
    @Environment(\.modelContext) private var modelContext
    @EnvironmentObject var budget: Budget
    @Query var moneyItem: [MoneyItem]
    
    var body: some View {
        Form {
            Section {
                TextField("Введите сумму", text: Binding(
                    get: { String(budget.money) },
                    set: { newValue in
                    if let value = Int(newValue) {
                        budget.money = value
                    }
                }))
                Button("Сохранить бюджет") {
                    saveBudget()
                }
            }
            
            Section {
                Button("delete db") {
                    deleteFunc()
                }
            }
        }
        
    }
    
    func deleteFunc() {
        let context = modelContext
        do {
            // Delete all DayPlan
            let plans = try context.fetch(FetchDescriptor<DayPlan>())
            for plan in plans {
                context.delete(plan)
            }
            // Delete all FoodItem
            let foods = try context.fetch(FetchDescriptor<FoodItem>())
            for food in foods {
                context.delete(food)
            }
            
            let money = try context.fetch(FetchDescriptor<MoneyItem>())
            for moneys in money {
                context.delete(moneys)
            }
            try context.save()
            print("База очищена")
        } catch {
            print("Ошибка при удалении \(error)")
        }
    }
    
    func saveBudget() {
        if let existing = moneyItem.first {
            existing.money = budget.money
        } else {
            let money = MoneyItem(money: budget.money)
            modelContext.insert(money)
        }
    }
}

#Preview {
    LaboratoryView()
}
