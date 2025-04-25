//
//  ItemRow.swift
//  NJDine
//
//  Created by Iraniya Naynesh on 21/04/25.
//

import SwiftUI

struct ItemRow: View {
    @StateObject var viewModel: ItemRowViewModel
    
    var body: some View {
        HStack(alignment: .center) {
            Image(viewModel.item.thumbnailImage)
                .clipShape(Circle())
                .overlay(Circle().stroke(.gray, lineWidth: 2))
            VStack(alignment: .leading) {
                Text(viewModel.item.name)
                    .font(.headline)
                Text("$\(viewModel.item.price)")
            }
            
            Spacer()
            
            ForEach(viewModel.item.restrictions, id: \.self) { restriction in
                Text(restriction)
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(5)
                    .background(viewModel.colors[restriction, default: .black])
                    .clipShape(Circle())
                    .foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    let item = MenuItem.example
    let viewModel = ItemRowViewModel(item: item)
    ItemRow(viewModel: viewModel)
}
