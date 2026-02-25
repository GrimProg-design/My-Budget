//
//  HomeView.swift
//  My Budget
//
//  Created by Вавилов Илья on 23/2/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            
//            MARK: окно с деньгами
            HStack {
                Text("money")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                Text("per day")
                    .foregroundStyle(.gray)
                    
            }
            .padding(60)
            
            Spacer()
            
//            MARK: тело программы где будет расчет
            VStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(Weekdays.allCases, id: \.self) {day in
                            Button {
                                
                            } label: {
                                Text(day.daysInWeek)
                                    .font(.title2)
                                    .padding(8)
                                    .foregroundStyle(.black)
                            }
                            .background(.ultraThinMaterial)
                            .cornerRadius(20)
                            .padding()
                            .shadow(radius: 5)
                        }
                    }
                    Divider()
                }
                Spacer()
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
