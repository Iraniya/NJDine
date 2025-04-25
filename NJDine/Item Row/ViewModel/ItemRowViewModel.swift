//
//  ItemRowViewModel.swift
//  NJDine
//
//  Created by Iraniya Naynesh on 25/04/25.
//

import Foundation
import SwiftUI

class ItemRowViewModel: ObservableObject {
    @Published var item: MenuItem
    let colors: [String: Color] = ["D": .purple,
                                   "G": .black,
                                   "N": .red,
                                   "S": .blue,
                                   "V": .green]
    init(item: MenuItem) {
        self.item = item
    }
}
