//
//  MainView.swift
//  NJDine
//
//  Created by Iraniya Naynesh on 22/04/25.
//

import SwiftUI

enum TabSection {
    case menulist
    case orderView
    case profileView
}

struct MainView: View {
    @State var selectedTab = TabSection.menulist
    
    var body: some View {
        TabView(selection: $selectedTab) {
            MenuListView()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
                .tag(0)
            OrderView()
                .tabItem {
                    Label("Order", systemImage: "square.and.pencil")
                }
                .tag(1)
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle")
                }
                .tag(2)
        }
    }
}

#Preview {
    MainView()
        .environmentObject(Order())
}
