//
//  SampleView.swift
//  NJDine
//
//  Created by Iraniya Naynesh on 23/04/25.
//

import SwiftUI

struct SampleView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<10) { i in
                    Text("Item \(i)")
                        .foregroundStyle(.white)
                        .containerRelativeFrame(.horizontal, count: 5, span: 2, spacing: 10)
                        .background(.blue)
                }
            }
        }
    }
    
    func blurAmount(for proxy: GeometryProxy) -> Double {
        let scrollViewHeight = proxy.bounds(of: .scrollView)?.height ?? 100
        let ourCenter = proxy.frame(in: .scrollView).minY
        let distanceFromCenter = abs(scrollViewHeight / 2 - ourCenter)
        return Double(distanceFromCenter) / 100
    }
}

#Preview {
    SampleView()
}
