//
//  LaboratoryView.swift
//  My Budget
//
//  Created by Вавилов Илья on 24/2/26.
//

import SwiftUI
import SwiftData

struct LaboratoryView: View {
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        Text("Hello, this is laboratory view")
        Button("delete db") {
            deleteFunc()
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
            try context.save()
            print("База очищена")
        } catch {
            print("Ошибка при удалении \(error)")
        }
    }
}

#Preview {
    LaboratoryView()
}
