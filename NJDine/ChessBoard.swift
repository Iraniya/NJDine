//
//  ChessBoard.swift
//  NJDine
//
//  Created by Iraniya Naynesh on 23/04/25.
//

import SwiftUI

struct ChessBoard: View {
    var body: some View {
        VStack {
            Text("Chess Board")
            Grid(horizontalSpacing: 0, verticalSpacing: 0) {
                ForEach(0..<8){ row in
                    GridRow {
                        ForEach(0..<8) { col in
                            if (row + col).isMultiple(of: 2) {
                                Rectangle()
                                    .fill(.black)
                            } else {
                                Rectangle()
                                    .fill(.white)
                            }
                        }
                    }
                }
            }//Grid end here
            .aspectRatio(1, contentMode: .fit)
            .border(.black, width: 1)
        }
        .padding()
    }
}

#Preview {
    ChessBoard()
}
