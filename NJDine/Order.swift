//
//  Order.swift
//  NJDine
//
//  Created by Iraniya Naynesh on 21/04/25.
//

import Foundation

class Order: ObservableObject {
    @Published var items = [MenuItem]()
    
    var total: Int {
        if items.count > 0 {
            return items.reduce(0) { $0 + ($1.price * ($1.quantity ?? 1)) }
        } else {
            return 0
        }
    }
    
    func add(item: MenuItem) {
        items.append(item)
    }
    
    func remove(item: MenuItem) {
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
    }
}
