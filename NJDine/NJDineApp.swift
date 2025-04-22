//
//  NJDineApp.swift
//  NJDine
//
//  Created by Iraniya Naynesh on 21/04/25.
//

import SwiftUI

@main
struct NJDineApp: App {
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
