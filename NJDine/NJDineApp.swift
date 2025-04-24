//
//  NJDineApp.swift
//  NJDine
//
//  Created by Iraniya Naynesh on 21/04/25.
//

import SwiftUI

@main
struct NJDineApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject var order = Order()
    
    init() {
        UserDefaults.standard.register(defaults: [
            "name": "Iraniya Naynesh",
        ])
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("Your code here")
        return true
    }
}
