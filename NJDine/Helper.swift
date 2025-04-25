//
//  Helper.swift
//  NJDine
//
//  Created by Iraniya Naynesh on 21/04/25.
//

import UIKit
import SwiftUI

extension Bundle {
    func decode<T: Decodable>(_ type: T.Type, from file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }

        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }

        let decoder = JSONDecoder()

        
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }

        return loaded
    }
}

extension Binding {
    
    @MainActor
    func onChange(_ handler: @escaping (Value) -> Void) -> Binding<Value> {
        Binding(
            get: {self.wrappedValue },
            set: { newValue in
                self.wrappedValue = newValue
                handler(newValue)
            }
        )
    }
}

struct SampleBinding: View {
    @State private var name = ""
    
    var body: some View {
        TextField("Enter your name", text: $name.onChange(nameChange))
            .textFieldStyle(.roundedBorder)
        
    }
    
    func nameChange(to value: String) {
        print("Name change to \(name)")
    }
    
}
