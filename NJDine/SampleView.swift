//
//  SampleView.swift
//  NJDine
//
//  Created by Iraniya Naynesh on 23/04/25.
//

import SwiftUI

struct EmailList: Identifiable {
    var id: String
    var isSubscribed = false
}

struct SampleView: View {
    
    @State var lists = [
        EmailList(id: "Monthly Updates", isSubscribed: true),
        EmailList(id: "News Flashes", isSubscribed: true),
        EmailList(id: "Special Offers", isSubscribed: true)
    ]
    
    var body: some View {
        Form {
            Section {
                ForEach($lists) { $list in
                    Toggle(list.id, isOn: $list.isSubscribed)
                }
            }
            
            Section {
                Toggle("Subscribe to all", sources: $lists, isOn: \.isSubscribed)
            }
        }
    }
    
    
    //    var body: some View {
    //        ScrollView(.horizontal, showsIndicators: false) {
    //            HStack {
    //                ForEach(1..<20) { num in
    //                    VStack {
    //                        GeometryReader { geo in
    //                            Text("Item \(num)")
    //                                .font(.largeTitle)
    //                                .padding()
    //                                .background(.red)
    //                                .foregroundStyle(.white)
    //                                .rotation3DEffect(.degrees(-Double(geo.frame(in: .global).minX) / 8), axis: (x: 0, y: 1, z: 0))
    //                                .frame(height: 200)
    //                                //.containerRelativeFrame(.horizontal, count: 3, span: 1, spacing: 0)
    //                        }
    //                        .frame(width: 200, height: 200)
    //                    }
    //                }
    //            }
    //        }
    //    }
    
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
