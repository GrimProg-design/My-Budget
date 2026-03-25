//
//  HomeView.swift
//  My Budget
//
//  Created by Вавилов Илья on 23/2/26.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @Environment(\.modelContext) private var modelContext
    
    @Query var savedPlans: [DayPlan]
    @Query var allFoods: [FoodItem]
    @Query private var myBudget: [MoneyItem]
    
    //    @State var foodThisWeek: [[FoodItem]] = Array(repeating: [], count: 7)
    @State private var currentDay = ""
    @State private var choosenDay = ""
    @EnvironmentObject var budget: Budget
    
    var body: some View {
        VStack {
            
            //            MARK: окно с деньгами
            HStack {
                ForEach(myBudget) {bgt in
                    Text(String(bgt.money))
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                    Text("per day")
                        .foregroundStyle(.gray)
                }
            }
            .padding(60)
            
            Spacer()
            
            //            MARK: тело программы где будет расчет
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(Weekdays.allCases, id: \.self) {day in
                            Button {
                                currentDay = day.rawValue
                            } label: {
                                Text(day.daysInWeek)
                                    .font(.title2)
                                    .padding(8)
                                    .foregroundStyle(.black)
                            }
                            .background (
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .fill(.ultraThinMaterial)
                                    
                                    if currentDay == day.rawValue {
                                        Color.blue.opacity(0.3)
                                    }
                                }
                            )
                            .cornerRadius(20)
                            .padding()
                            .shadow(radius: 5)
                        }
                    }
                    
                    Divider()
                }
                .onAppear {
                    currentDay = Date().formatted(.dateTime.weekday(.wide)).lowercased()
                }
                Spacer()
                
                let dayPlan = savedPlans.first(where: { $0.dayName == currentDay })
                
                if let plan = dayPlan {
                    TestingView(foods: plan.foods)
                } else {
                    VStack {
                        Text("План еще не создан")
                            .foregroundStyle(.gray)
                        Button("Рассчитать меню на неделю") {
                            generateWeeklyPlan()
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    .padding(.bottom, 70)
                    
                    Spacer()
                }
                
                
            }
            .frame(maxWidth: .infinity, maxHeight: 600)
            .background(.white)
            .clipShape(
                UnevenRoundedRectangle(topLeadingRadius: 30, topTrailingRadius: 30
                                      )
            )
            .ignoresSafeArea()
        }
        .background(LinearGradient(colors: [Color("AncientGreen"), .white], startPoint: .top, endPoint: .bottom))
    }
    
    
    //    MARK: алгоритм прграммы
    func generateWeeklyPlan() {
        for plan in savedPlans {
            modelContext.delete(plan)
        }
        try? modelContext.save()
        
        for day in Weekdays.allCases {
            var currentDayBudget = Int(budget.money)
            var foodsForDay: [FoodItem] = []
            let shuffledFoods = allFoods.shuffled()
            
            for item in shuffledFoods {
                if item.price <= currentDayBudget {
                    let foodCopy = FoodItem(
                        name: item.name,
                        details: item.details,
                        price: item.price,
                        ingridients: item.ingridiets,
                        sugar: item.sugar,
                        carbs: item.carbs,
                        protein: item.protein,
                        fat: item.fat
                    )
                    
                    foodsForDay.append(foodCopy)
                    currentDayBudget -= item.price
                }
            }
            
            let newDayPlan = DayPlan(dayName: day.rawValue, foods: foodsForDay)
            modelContext.insert(newDayPlan)
        }
        
        try? modelContext.save()
        printDatabaseContents()
    }
    
    func printDatabaseContents() {
        let order: [String] = ["monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"]
        
        let sortedPlans = savedPlans.sorted { a, b in
            guard let aIndex = order.firstIndex(of: a.dayName),
                  let bIndex = order.firstIndex(of: b.dayName) else { return false }
            return aIndex < bIndex
        }
        
        print("В базе данных \(sortedPlans.count) планов.")
        for plan in sortedPlans {
            print("День: \(plan.dayName) | Еда: \(plan.foods.map { $0.name }.joined(separator: ", "))")
        }
    }
}

enum Weekdays: String, CaseIterable {
    case monday, tuesday, wednesday, thursday, friday, saturday, sunday
    
    var daysInWeek: String {
        switch self {
        case .monday:
        "Понедельник"
        case .tuesday:
            "Вторник"
        case .wednesday:
            "Среда"
        case .thursday:
            "Четверг"
        case .friday:
            "Пятница"
        case .saturday:
            "Суббота"
        case .sunday:
            "Воскресенье"
        }
    }
}

#Preview {
    HomeView()
}
