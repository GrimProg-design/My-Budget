//
//  ContentView.swift
//  My Budget
//
//  Created by Вавилов Илья on 23/2/26.
//

import SwiftUI
import Combine

class Budget: ObservableObject {
    @Published var money: Int = 160
}

struct ContentView: View {
    @StateObject var budget = Budget()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            CustomTabBar()
                .environmentObject(budget)
        }
    }
}

#Preview {
    ContentView()
}
