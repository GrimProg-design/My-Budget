//
//  FoodDetailsSheetView.swift
//  My Budget
//
//  Created by Вавилов Илья on 26/2/26.
//

import SwiftUI
import SwiftData

struct FoodDetailsSheetView: View {
    let food: FoodItem
    
    var body: some View {
        VStack(spacing: 20) {
            if let data = food.imageData, let uiImage = UIImage(data: data) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 250)
                    .cornerRadius(20)
            }
            
            HStack(alignment: .firstTextBaseline) {
                Text(food.name)
                    .font(.largeTitle)
                    .bold()
                
                Text("\(food.price) ₽")
                    .font(.title2)
                    .foregroundColor(.secondary)
                Spacer()
            }
            Divider()
            
            Text("Описание блюда:")
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(Color.black.opacity(0.5))
            Text(food.details)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Divider()
            
            VStack {
                Text("Ингридиенты:")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundStyle(Color.black.opacity(0.5))
                ForEach(food.ingridiets, id: \.self) {
                    Text("- \($0)")
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            
            Divider()
            
            Text("Составляющие:")
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundStyle(Color.black.opacity(0.5))
            VStack {
                Text("Содержание сахара: \(food.sugar)")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Содержание углеводов: \(food.carbs)")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Содержание белка: \(food.protein)")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Содержание жиров: \(food.fat)")
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            Spacer()
        }
        .padding(30)
    }
}

#Preview {
    FoodDetailsSheetView(food: .init(
        name: "Rise",
        details: "Some details about dish Some details about dish Some details about dish Some details about dish Some details about dish Some details about dish Some details about dish",
        price: 230,
        ingridients: ["Rise", "Oil"],
        sugar: 2,
        carbs: 3,
        protein: 4,
        fat: 5,
        imageData: nil,
    ))
}
