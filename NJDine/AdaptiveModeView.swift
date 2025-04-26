//
//  AdaptiveModeView.swift
//  NJDine
//
//  Created by Iraniya Naynesh on 25/04/25.
//

import SwiftUI

struct AdaptiveModeView<T: View, U: View>: View {
    @Environment(\.colorScheme) var colorScheme
    
    let light: T?
    let dark: U?
    
    init(light: T, dark: U) {
        self.light = light
        self.dark = dark
    }
    
    init(light: () -> T, dark: () -> U) {
        self.light = light()
        self.dark = dark()
    }
    
    @ViewBuilder var body: some View {
        if colorScheme == .light {
            light
        } else {
            dark
        }
    }
}

struct SampleAdaptiveModeView: View {
    var body: some View {
        VStack {
            AdaptiveModeView {
                VStack {
                    Text("Light mode")
                    Image(systemName: "sun.max")
                }
            } dark: {
                HStack {
                    Text("Dark Mode")
                    Image(systemName: "moon")
                }
            }
        }
    }
}
