//
//  MainView.swift
//  NJDine
//
//  Created by Iraniya Naynesh on 22/04/25.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
            OrderView()
                .tabItem {
                    Label("Order", systemImage: "square.and.pencil")
                }
        }
    }
}

#Preview {
    MainView()
        .environmentObject(Order())
}
