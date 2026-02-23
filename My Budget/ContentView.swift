//
//  ContentView.swift
//  My Budget
//
//  Created by Вавилов Илья on 23/2/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            Rectangle()
                .ignoresSafeArea()
            CustomTabBar()
        }
    }
}

#Preview {
    ContentView()
}
