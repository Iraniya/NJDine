//
//  ItemDetail.swift
//  NJDine
//
//  Created by Iraniya Naynesh on 21/04/25.
//

import SwiftUI

struct ItemDetail: View {
    var item: MenuItem
    @EnvironmentObject var order: Order
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(.black)
                    .font(.caption)
                    .foregroundStyle(.white)
                    .offset(x: -5, y: -5)
            }
            Text(item.description)
                .padding()
            Button {
                order.add(item: item)
            } label: {
                Text("Order")
                    .padding(.horizontal, 30)
                    .padding(.vertical, 10)
                    .font(.title)
                    .background(.red)
                    .cornerRadius(8)
                    .foregroundColor(.white)
            }
            Spacer()
        }
        .toolbar {
            Button("add to Favioute") {
               print("Favorites")
            }
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        ItemDetail(item: MenuItem.example)
            .environmentObject(Order())
    }
}
