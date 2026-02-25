//
//  My_BudgetApp.swift
//  My Budget
//
//  Created by Вавилов Илья on 23/2/26.
//

import SwiftUI
import SwiftData

@main
struct My_BudgetApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: FoodItem.self)
    }
}
