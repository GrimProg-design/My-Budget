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
            try context.delete(model: DayPlan.self)
            
            try context.save()
        } catch {
            print("Ошибка при удалении \(error)")
        }
    }
}

#Preview {
    LaboratoryView()
}
