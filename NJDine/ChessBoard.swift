//
//  ChessBoard.swift
//  NJDine
//
//  Created by Iraniya Naynesh on 23/04/25.
//

import SwiftUI

struct ChessBoard: View {
    
    let data = (1...100).map { "Item \($0)" }
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
                 
    ]
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(data, id: \.self) { item in
                    Text(item)
                }
            }
            .padding(.vertical)
        }
        .frame(maxWidth: 300, maxHeight: 300)
        .scrollIndicatorsFlash(onAppear: true)
        
        //        VStack {
        //            Text("Chess Board")
        //            Grid(horizontalSpacing: 0, verticalSpacing: 0) {
        //                ForEach(0..<8){ row in
        //                    GridRow {
        //                        ForEach(0..<8) { col in
        //                            if (row + col).isMultiple(of: 2) {
        //                                Rectangle()
        //                                    .fill(.black)
        //                            } else {
        //                                Rectangle()
        //                                    .fill(.white)
        //                            }
        //                        }
        //                    }
        //                }
        //            }//Grid end here
        //            .aspectRatio(1, contentMode: .fit)
        //            .border(.black, width: 1)
        //        }
        //        .padding()
        
        
        .toolbar {
            ControlGroup {
                Button("First") { }
                Button("Second") { }
                Button("Third") { }
            }
        }
    }
}

#Preview {
    ChessBoard()
}
