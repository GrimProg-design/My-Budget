//
//  CreateView.swift
//  My Budget
//
//  Created by Вавилов Илья on 25/2/26.
//

import SwiftUI
import SwiftData
import PhotosUI

struct CreateView: View {
    @Environment(\.modelContext) private var modelContext
    
    @State private var name = ""
    @State private var details = ""
    @State private var price = ""
    
    @State private var ingridient = ""
    @State private var ingridiets: [String] = []
    
    @State private var protein = ""
    @State private var fat = ""
    @State private var carbs = ""
    @State private var sugar = ""
    
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var imageData: Data? = nil
    
    var body: some View {
        Form {
            Section(header: Text("Главное о блюде")) {
                TextField("Название блюда", text: $name)
                TextField("Описание блюда", text: $details)
                TextField("Цена блюда", text: $price)
                HStack {
                    TextField("Ингридиент", text: $ingridient)
                    Button {
                        ingridiets.append(ingridient)
                        ingridient = ""
                    } label: {
                        Image(systemName: "plus")
                            .font(.title2)
                    }
                    .buttonStyle(.borderless)
                }
                ForEach(ingridiets, id: \.self) {ingred in
                    Text("- \(ingred)")
                        .listRowSeparator(.hidden)
                }
            }
            
            Section(header: Text("Элементы блюда")) {
                TextField("Белок", text: $protein)
                TextField("Жиры", text: $fat)
                TextField("Углеводы", text: $carbs)
                TextField("Сахар", text: $sugar)
            }
            
            Section(header: Text("Фотография")) {
                PhotosPicker(selection: $selectedItem, matching: .images) {
                    if let imageData, let uiImage = UIImage(data: imageData) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFill()
                            .frame(height: 200)
                            .cornerRadius(12)
                    } else {
                        Label("Выбрать изображение", systemImage: "photo.badge.plus")
                    }
                }
                .onChange(of: selectedItem) { oldItem, newItem in
                    Task {
                        if let data = try? await newItem?.loadTransferable(type: Data.self) {
                            imageData = data
                        }
                    }
                }
            }
            
            Section {
                HStack {
                    Spacer()
                    
                    Button {
                        saveFood()
                    } label: {
                        Label("Сохранить блюдо", systemImage: "square.and.arrow.down")
                    }
                    .foregroundStyle(.black)
                    
                    Spacer()
                }
                .listRowBackground(Color.green)
            }
        }
        .padding(.bottom, 70)
    }
    
    func saveFood() {
        let newItem = FoodItem(
            name: name,
            details: details,
            price: Int(price) ?? 0,
            ingridients: ingridiets,
            sugar: Double(sugar) ?? 0.0,
            carbs: Double(carbs) ?? 0.0,
            protein: Double(protein) ?? 0.0,
            fat: Double(fat) ?? 0.0,
            imageData: imageData
        )
        modelContext.insert(newItem)
    }
}

#Preview {
    CreateView()
}
