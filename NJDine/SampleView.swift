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
                ForEach(1..<20) { num in
                    VStack {
                        GeometryReader { geo in
                            Text("Item \(num)")
                                .font(.largeTitle)
                                .padding()
                                .background(.red)
                                .foregroundStyle(.white)
                                .rotation3DEffect(.degrees(-Double(geo.frame(in: .global).minX) / 8), axis: (x: 0, y: 1, z: 0))
                                .frame(height: 200)
                                //.containerRelativeFrame(.horizontal, count: 3, span: 1, spacing: 0)
                        }
                        .frame(width: 200, height: 200)
                    }
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
