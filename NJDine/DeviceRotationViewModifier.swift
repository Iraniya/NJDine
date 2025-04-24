//
//  DeviceRotationViewModifier.swift
//  NJDine
//
//  Created by Iraniya Naynesh on 24/04/25.
//

import SwiftUI

struct DeviceRotationViewModifier: ViewModifier {
    let action: (UIDeviceOrientation) -> Void
    
    func body(content: Content) -> some View {
        content
            .onAppear()
            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                action(UIDevice.current.orientation)
            }
    }
}

extension View {
    func onRotate(perform action: @escaping (UIDeviceOrientation) -> Void) -> some View {
        self.modifier(DeviceRotationViewModifier(action: action))
    }
}
struct SampleDeviceView: View {
    @State private var orientation = UIDeviceOrientation.unknown
    
    var body: some View {
        VStack {
            Text("Sample Text")
        }
        .onRotate { newOrientation in
            orientation = newOrientation
        }
        .onAppear()
        .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
            orientation = UIDevice.current.orientation
        }
    }
}
