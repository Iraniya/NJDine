//
//  ChatView.swift
//  NJDine
//
//  Created by Iraniya Naynesh on 24/04/25.
//

import SwiftUI

struct Message: Decodable, Identifiable {
    let id: Int
    let from: String
    let text: String
}

struct ChatView: View {
    @State private var messages = [Message]()
    
    var body: some View {
        NavigationStack {
            List(messages) { message in
                VStack(alignment: .leading) {
                    Text(message.from)
                        .font(.headline)
                    Text(message.text)
                }
            }
            .navigationTitle("Inbox")
        }
        .task {
            do {
                let url = URL(string: "https://www.hackingwithswift.com/samples/messages.json")!
                let (data, _ ) = try await URLSession.shared.data(from: url)
                messages = try JSONDecoder().decode([Message].self, from: data)
                
            } catch {
                messages = []
            }
        }
    }
}

#Preview {
    ChatView()
}
