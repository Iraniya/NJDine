//
//  ContentView.swift
//  NJDine
//
//  Created by Iraniya Naynesh on 21/04/25.
//


import SwiftUI

struct ContentView: View {
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")

    var body: some View {
        NavigationStack {
            ScrollViewReader { value in
                Button("scroll to Strawberry") {
                    //value.scrollTo("Strawberry Surprise", anchor: .top)
                    withAnimation {
                        value.scrollTo("Strawberry Surprise", anchor: .top)
                    }
                   
                }
                Button("scroll to Drinks") {
                    print(value)
                    withAnimation {
                        value.scrollTo("Drinks", anchor: .top)
                    }
                }
                
                Button("scroll to Breakfast") {
                    withAnimation {
                        value.scrollTo("Breakfast", anchor: .top)
                    }
                }
                List {
                    ForEach(menu) { section in
                        Section(section.name) {
                            ForEach(section.items) { item in
                                NavigationLink(value: item) {
                                    ItemRow(viewModel: ItemRowViewModel(item: item))
                                }
                                .id(item.name)
                            }
                        }
                        .id(section.name)
                    }
                }
            }
            .navigationDestination(for: MenuItem.self) { item in
                ItemDetail(item: item)
            }
            .navigationTitle("Menu")
            .listStyle(.grouped)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

