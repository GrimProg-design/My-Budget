//
//  FoodTaleView.swift
//  My Budget
//
//  Created by Вавилов Илья on 26/2/26.
//

import Foundation
import SwiftUI
import PhotosUI

struct FoodTaleView: View {
//    let photo: Data?
//    let name: String
//    let price: Int
    
    let food: FoodItem
    
    @State private var showingSheet = false
    
    var body: some View {
        Button {
            showingSheet.toggle()
        } label: {
            VStack(alignment: .leading, spacing: 0) {
                ZStack{
                    if let data = food.imageData, let uiImage = UIImage(data: data) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFill()
                    } else {
                        // Заглушка, если фото нет
                        Color.gray.opacity(0.2)
                        Image(systemName: "fork.knife")
                            .foregroundColor(.gray)
                    }
                }
                .frame(width: 150, height: 150)
                .clipped()
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(food.name)
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(.primary)
                        .lineLimit(1)
                    
                    Text("\(food.price) ₽")
                        .font(.system(size: 12))
                        .foregroundColor(.secondary)
                }
                .padding(10)
            }
            .frame(width: 150, height: 200)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
        }
        .buttonStyle(.plain)
        .sheet(isPresented: $showingSheet) {
            FoodDetailsSheetView(food: food)
        }
    }
}
