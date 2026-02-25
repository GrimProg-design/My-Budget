//
//  CustomTabBar.swift
//  My Budget
//
//  Created by Вавилов Илья on 23/2/26.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case home, create, laboratory
    
    var title: String  {
        switch self {
        case .home:
            return "Главная"
        case .create:
            return " "
        case .laboratory:
            return "Лаборатория"
        }
    }
    
    var icon: String {
        switch self {
        case .home:
            return "house"
        case .create:
            return "plus"
        case .laboratory:
            return "flask"
        }
    }
}

struct CustomTabBar: View {
    @State private var selectedTab: Tab = .home
    
    var body: some View {
        
        NavigationStack {
            switch selectedTab {
            case .home:
                HomeView()
            case .create:
                Text("Create")
            case .laboratory:
                LaboratoryView()
            }
        }
        
        Spacer()
        HStack {
            ForEach(Tab.allCases, id: \.self) { tab in
                Spacer()
                Button {
                    selectedTab = tab
                } label: {
                    VStack {
                        if tab == Tab.allCases[1] {
                            Image(systemName: tab.icon)
                                .frame(width: 50, height: 50)
                                .background(.white)
                                .cornerRadius(30)
                                .shadow(radius: 5)
                        } else {
                            Image(systemName: tab.icon)
                            Text(tab.title)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .contentShape(Rectangle())
                }
                Spacer()
                
//                if tab != Tab.allCases.last {
//                    Divider()
//                        .frame(maxHeight: 20)
//                        .background(.black)
//                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(.ultraThinMaterial)
    }
}

#Preview {
    CustomTabBar()
}
