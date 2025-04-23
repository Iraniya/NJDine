//
//  Profile.swift
//  NJDine
//
//  Created by Iraniya Naynesh on 22/04/25.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    @State private var avatarItem: PhotosPickerItem?
    @State private var avatarImage: Image?
    
    var body: some View {
        VStack(alignment: .leading) {
            
            PhotosPicker("Edit Avatar", selection: $avatarItem, matching: .images)
                .frame(minWidth: 0, maxWidth: 200, minHeight: 0, maxHeight: 200)
                .font(.largeTitle)
            
            avatarImage?
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200)
                .clipShape(Circle())
            
            GeometryReader { geometry in
                HStack(spacing: 0) {
                    Text("Left")
                        .font(.largeTitle)
                        .foregroundStyle(.black)
                        .frame(width: geometry.size.width * 0.5)
                        .background(.yellow)
                    
                    Text("Right")
                        .font(.largeTitle)
                        .foregroundStyle(.black)
                        .frame(width: geometry.size.width * 0.5)
                        .background(.orange)
                }
            }
            .frame(height: 50)
            
            let layout = horizontalSizeClass == .regular ? AnyLayout(HStackLayout()) : AnyLayout(VStackLayout())
            
            layout {
                Text("This is a short string.")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.red)

                Text("This is a This is a This is a")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.green)
            }
            .fixedSize(horizontal: true, vertical: false)
            .frame(maxWidth: 400)
            .background(.blue)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 0) {
                    Text("Post")
                        .frame(maxWidth: .infinity)
                        .frame(height: 100)
                        //.background(.blue)
                        .containerRelativeFrame(.horizontal, count: 5, span: 2, spacing: 0)
                    Divider()
                        .frame(width:2,height: 50)
                        .background(.black)
                    Text("followers")
                        .frame(maxWidth: .infinity)
                        .frame(height: 100)
                        //.background(.green)
                        .containerRelativeFrame(.horizontal, count: 5, span: 2, spacing: 0)
                    Divider()
                    Text("Following")
                        .frame(maxWidth: .infinity)
                        .frame(height: 100)
                        //.background(.red)
                        .containerRelativeFrame(.horizontal, count: 5, span: 2, spacing: 0)
                    Divider()
                    Text("Following")
                        .frame(maxWidth: .infinity)
                        .frame(height: 100)
                        .background(.red)
                        .containerRelativeFrame(.horizontal, count: 5, span: 2, spacing: 0)
                }
//                .fixedSize(horizontal: false, vertical: true)
            }
            .frame(height: 100)
            
            
            Spacer()
        }
        .onChange(of: avatarItem) {
            Task {
                if let loaded = try? await avatarItem?.loadTransferable(type: Image.self) {
                    avatarImage = loaded
                } else {
                    print("Failed")
                }
            }
        }
        .padding()
    }
}

#Preview {
    ProfileView()
}
