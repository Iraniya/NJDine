//
//  ItemDetail.swift
//  NJDine
//
//  Created by Iraniya Naynesh on 21/04/25.
//

import SwiftUI

class ItemDetailViewModel: ObservableObject {
    @Published var item: MenuItem
    
    init(item: MenuItem) {
        self.item = item
    }
}

struct ItemDetail: View {
    var item: MenuItem
    let colors: [String: Color] = ["D": .purple,
                                   "G": .black,
                                   "N": .red,
                                   "S": .blue,
                                   "V": .green]
    
    @State private var ingreidients = ["Egg", "Sausage", "Bacon", "Spam"]
    
    @EnvironmentObject var order: Order
    
    @State var isLoading = true
    
    var body: some View {
        VStack {
            detailView
            orderButton
            Spacer()
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                isLoading.toggle()
            }
        }
        .redacted(reason: isLoading ? .placeholder : .invalidated)
        .toolbar {
            Button("add to Favioute") {
               print("Favorites")
            }
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
        .environment(\.openURL, OpenURLAction(handler: handleURL))
    }
    
    var detailView: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(item.name)
                .font(.largeTitle)
                .foregroundColor(.red)
                .padding([.bottom, .leading], 10)
            
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                    .resizable()
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(.black)
                    .font(.caption)
                    .foregroundStyle(.white)
                    .offset(x: -5, y: -5)
            }
            
            Text(item.description)
                .lineSpacing(5)
                .padding(10)
                .textSelection(.enabled)
            
            Section(header: Text("Ingredients").font(.headline)) {
                Text(ingreidients, format: .list(type: .and))
                    .font(.subheadline)
            }
            .padding(.leading, 10)
            
            Section(header: Text("Price").font(.headline)) {
                
                HStack {
                    Text("~~$\(item.price + 10)~~")
                    //Text(verbatim: "~~$\(item.price + 10)~~")
                    Text(item.price, format: .currency(code: "USD"))
                        .font(.subheadline)
                }
            }
            .padding(.leading, 10)
            
            Section {
                Link("Website", destination: URL(string: "https://github.com/Iraniya/NJDine")!)
                Text("https://github.com/Iraniya/NJDine")
                    .tint(.indigo)
            }
            
            HStack {
                ForEach(item.restrictions, id: \.self) { restriction in
                    Text(restriction)
                        .font(.subheadline)
                        .fontWeight(.black)
                        .padding(5)
                        .background(colors[restriction, default: .black])
                        .clipShape(Circle())
                        .foregroundStyle(.white)
                }
            }
            .padding()
        } //VStack end here
    }
    
    var orderButton: some View {
        Button {
            order.add(item: item)
        } label: {
            Text("Order")
                .padding(.horizontal, 30)
                .padding(.vertical, 10)
                .background(.red)
                .font(.title)
                .cornerRadius(8)
                .foregroundColor(.white)
        }
    }
    
    func handleURL(_ url: URL) -> OpenURLAction.Result {
        print("Handle \(url) here")
        return .handled
        
    }
}

#Preview {
    NavigationStack {
        ItemDetail(item: MenuItem.example)
            .environmentObject(Order())
    }
}
