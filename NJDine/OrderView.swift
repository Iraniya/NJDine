//
//  OrderView.swift
//  NJDine
//
//  Created by Iraniya Naynesh on 22/04/25.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(order.items) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }
                }//End of section
                
                Section {
                    NavigationLink("Place order") {
                        Text("Check Out")
                    }
                }
            }
            .navigationTitle("Order")
        }
    }
}

#Preview {
    OrderView()
        .environmentObject(Order())
}
