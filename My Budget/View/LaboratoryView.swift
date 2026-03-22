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
                HStack {
                    Spacer()
                    Button("Сохранить бюджет") {
                        saveBudget()
                    }
                    .foregroundStyle(.green)
                    Spacer()
                }
            }
            
            Section {
                HStack {
                    Spacer()
                    Button("delete db") {
                        deleteFunc()
                    }
                    .foregroundStyle(.red)
                    Spacer()
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
            
//            Delete all MoneyItem
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
//            Бро это лютый кастыль его лучше не трогать (мне просто лень переписывать все заново), но отвечает оно за то чтобы бюджет был одинаковым и на главном эране и в меню лаборатории
            budget.money = existing.money
        } else {
            let money = MoneyItem(money: budget.money)
//            Это тот же самый лютый костыль описанный выше
            budget.money = money.money
//            ______________________
            modelContext.insert(money)
        }
    }
}

#Preview {
    LaboratoryView()
}
