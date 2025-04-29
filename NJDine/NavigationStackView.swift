//
//  NavigationStackView.swift
//  NJDine
//
//  Created by Iraniya Naynesh on 29/04/25.
//

import Foundation
import SwiftUI

class PathStore: ObservableObject {
    @Published var path = NavigationPath() {
        didSet {
            save()
        }
    }
    
    private let savePath = URL.documentsDirectory.appending(path: "SavedPathStore")
    
    init() {
        if let data  = try? Data(contentsOf: savePath) {
            if let decoded = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data) {
                path = NavigationPath(decoded)
                return
            }
        }
    }
    
    func save() {
        guard let represntation = path.codable else { return }
        
        do {
            let data = try JSONEncoder().encode(represntation)
            try data.write(to: savePath)
        } catch {
            print("failed to save the path")
        }
    }
}

struct DetailView: View {
    var id: Int
    
    var body: some View {
        VStack {
            Text("Value \(id)")
                .font(.largeTitle)
            NavigationLink("Jump to random", value: Int.random(in: 1...100))
        }
    }
}

struct SampleNavigationPathStoreView: View {
    @StateObject private var pathStore = PathStore()
    
    var body: some View {
        NavigationStack(path: $pathStore.path) {
            DetailView(id: 0)
                .navigationDestination(for: Int.self, destination: DetailView.init)
                .navigationTitle("Navigation")
        }
    }
}
