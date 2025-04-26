//
//  ContentView.swift
//  NJDine
//
//  Created by Iraniya Naynesh on 21/04/25.
//


import SwiftUI

struct ContentView: View {
    @State var menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    @State private var searchText: String = ""
    @State private var searchIsActive = false
    
    var body: some View {
        NavigationStack {
            ScrollViewReader { value in
                List {
                    listView(menu: menu)
                }
                .listStyle(.insetGrouped)
                .refreshable {
                    print("Do your refresh here...")
                }
                                
                scrollToTop(value: value)
            }
            .navigationDestination(for: MenuItem.self) { item in
                ItemDetail(item: item)
            }
            .navigationTitle("Menu")
            .listStyle(.grouped)
            .searchable(text: $searchText, isPresented: $searchIsActive, prompt: "Search menu")
            
        }
    }
    
    func scrollToTop(value: ScrollViewProxy) -> some View {
        Group {
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
            
            Button("Scroll to top") {
                withAnimation {
                    value.scrollTo(0, anchor: .top)
                }
            }
        }
    }
    
    func listView(menu: [MenuSection]) -> some View {
        ForEach(menu) { section in
            Section(section.name) {
                ForEach(section.items) { item in
                    NavigationLink(value: item) {
                        ItemRow(viewModel: ItemRowViewModel(item: item))
                    }
                    .id(item.name)
                    .swipeActions(edge: .leading, allowsFullSwipe: false) {
                        Button("Open") {
                            openDetailScreen()
                        }
                        .tint(.green)
                    }
                    .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                        Button("Order") {
                            orderItem(item)
                        }
                        .tint(.red)
                    }
                }
            }
            .id(section.name)
            .headerProminence(.increased)
            .id(0)
        }
    }
    
    var searchResult: [MenuItem] {
        if searchText.isEmpty {
            return menu.first?.items ?? []
        } else {
            return menu.first?.items.filter { $0.name.contains(searchText) } ?? []
        }
    }
    
    func openDetailScreen() {
        print("Open details screen from here")
        
    }
    
    func orderItem(_ item: MenuItem) {
        print("Order \(item.name)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
