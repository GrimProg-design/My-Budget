//
//  CustomTabBar.swift
//  My Budget
//
//  Created by Вавилов Илья on 23/2/26.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case home, laboratory
    
    var title: String  {
        switch self {
        case .home:
            return "Главная"
        case .laboratory:
            return "Лаборатория"
        }
    }
    
    var icon: String {
        switch self {
        case .home:
            return "house"
        case .laboratory:
            return "flask"
        }
    }
}

struct CustomTabBar: View {
    @State private var selectedTab: Tab = .home
    @State private var check = true
    
    var body: some View {
        
        NavigationStack {
            switch selectedTab {
            case .home:
                HomeView()
            case .laboratory:
                Text("Hello")
            }
        }
        
        Text(check ? "Hello" : "Bye")
        Spacer()
        HStack {
            ForEach(Tab.allCases, id: \.self) { tab in
                Spacer()
                Button {
                    selectedTab = tab
                    check.toggle()
                } label: {
                    VStack {
                        Image(systemName: tab.icon)
                        Text(tab.title)
                    }
                    .frame(maxWidth: .infinity)
                    .contentShape(Rectangle())
                }
                Spacer()
                
                if tab != Tab.allCases.last {
                    Divider()
                        .frame(maxHeight: 20)
                        .background(.black)
                }
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
