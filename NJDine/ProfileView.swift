//
//  Profile.swift
//  NJDine
//
//  Created by Iraniya Naynesh on 22/04/25.
//

import SwiftUI
import PhotosUI

enum Gender: String {
    case male = "Male"
    case female = "Female"
    case other = "Other"
}

struct ProfileView: View {
    
    enum FocusedField {
        case firstName
        case lastName
    }
    @AppStorage("name") var name = "First Name"
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    @State private var firstName = ""
    @State private var lastName = ""
    @FocusState private var focusedField: FocusedField?
    
    @State private var avatarItem: PhotosPickerItem?
    @State private var avatarImage: Image?
    
    @State private var selectedGender: Gender = .male
    
    @State private var birthDate: Date = .now
    
    @State private var bioText = "Enter your bio"
    
    let genderType: [Gender] = [.male, .female, .other]
    
    var formView: some View {
        Form {
            TextField(name, text: $firstName)
                .focused($focusedField, equals: .firstName)
            
            TextField("Last Name", text: $lastName)
                .focused($focusedField, equals: .lastName)
        }
    }
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
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
                
                formView
                genderView
                //birthDateView
                bioTextView
                Spacer()
                
                .navigationTitle("Profile")
                .toolbar {
                    ToolbarItemGroup(placement: .primaryAction) {
                        Button("About") {
                            print("About tapped")
                        }
                        
                        Button("Help") {
                            print("Help tapped")
                        }
                    }
                    
                    ToolbarItemGroup(placement: .secondaryAction) {
                        Button("settings"){
                            print("settings taped")
                        }
                        Button("Email me") {
                            print("email tapped")
                        }
                    }
                }
                .buttonStyle(.plain)
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
            .onAppear {
                focusedField = .firstName
            }
        }
    }
    
    var genderView: some View {
        Picker("Select your gender", selection: $selectedGender) {
            ForEach(genderType, id: \.self) {
                Text("\($0.rawValue)")
            }
        }
        .pickerStyle(.segmented)
    }
    
    var birthDateView: some View {
        DatePicker("Entet your birthday", selection: $birthDate, in: ...Date.now, displayedComponents: .date)
            .datePickerStyle(GraphicalDatePickerStyle())
            .frame(maxHeight: 300)
    }
    
    var relavtiveScrollView: some View {
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
        .frame(height: 50)
    }
    
    var bioTextView: some View {
        TextEditor(text: $bioText)
            .foregroundStyle(.blue)
            .padding(.horizontal)
            .background(.red)
    }
}

#Preview {
    ProfileView()
}
