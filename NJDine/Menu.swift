//
//  Menu.swift
//  NJDine
//
//  Created by Iraniya Naynesh on 21/04/25.
//

import SwiftUI

struct MenuSection: Codable, Identifiable {
    var id: UUID
    var name: String
    var items: [MenuItem]
}

struct MenuItem: Codable, Hashable, Identifiable {
    var id: UUID
    var name: String
    var photoCredit: String
    var price: Int
    var restrictions: [String]
    var description: String
    var isFavourite: Bool? = false
    var quantity: Int? = 1

    var mainImage: String {
        name.replacingOccurrences(of: " ", with: "-").lowercased()
    }

    var thumbnailImage: String {
        "\(mainImage)-thumb"
    }
    
    var attributedDescription: AttributedString {
        var result = AttributedString(description)
        result.font = .largeTitle
        result.foregroundColor = .white
        result.backgroundColor = .black
        return result
    }
    
    var dancingMessage: AttributedString {
        let string = description
        var restult = AttributedString()
        
        for (index, letter) in string.enumerated() {
            var letterString = AttributedString(String(letter))
            letterString.baselineOffset = sin(Double(index)) * 5
            restult += letterString
        }
        
        restult.font = .largeTitle
        return restult
    }

    #if DEBUG
    static let example = MenuItem(id: UUID(), name: "Maple French Toast", photoCredit: "Joseph Gonzalez", price: 6, restrictions: ["G", "V"], description: "Sweet, fluffy, and served piping hot, our French toast is flown in fresh every day from Maple City, Canada, which is where all maple syrup in the world comes from. And if you believe that, we have some land to sell you…")
    #endif
}

class FavoriteMenuItems: ObservableObject{
    @Published var menuitems: [MenuItem] = []
}
