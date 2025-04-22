//
//  ContentView.swift
//  NJDine
//
//  Created by Iraniya Naynesh on 21/04/25.
//

import SwiftUI

struct ContentView: View {
    //let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    
    var body: some View {
        Text("Sample")
//        NavigationStack {
//            List {
//                ForEach(menu) { section in
//                    Section(section.name) {
//                        ForEach(section.items) { item in
//                            NavigationLink(value: item) {
//                                ItemRow(item: item)
//                            }
//                            .navigationDestination(for: MenuItem.self) { item in
//                                ItemDetail(item: item)
//                            }
//                        }
//                    }
//                }
//            }
//            .navigationTitle("Menu")
//            .listStyle(.grouped)
//        }
    }
}

#Preview {
    ContentView()
}
