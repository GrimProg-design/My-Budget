//
//  HomeBodyView.swift
//  My Budget
//
//  Created by Вавилов Илья on 26/2/26.
//

import SwiftUI
import SwiftData

struct HomeBodyView: View {
    @Query var allFood: [FoodItem]
    
    let columns = [
        GridItem(.flexible(), spacing: 15),
        GridItem(.flexible(), spacing: 15)
    ]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(allFood) { food in
                    FoodTaleView(food: food)
                }
            }
            .padding()
        }
    }
}

#Preview {
    HomeBodyView()
}
