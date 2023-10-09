//
//  ChatView.swift
//  Messenger
//
//  Created by Ramdhas on 2023-10-09.
//

import SwiftUI

struct ChatView: View {
    @State var message = ""
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    CircleProfileImageView(user: User.MOCK_USER, size: .large)
                    VStack(spacing: 4) {
                        Text("Ramdhas")
                            .font(.title3)
                        .fontWeight(.semibold)
                        Text("iOS")
                            .font(.footnote)
                            .foregroundStyle(.gray)
                    }
                    
                    ForEach(0...20, id: \.self){_ in 
                        ChatMessageCell(isFromCurrentUser: Bool.random())
                    }
                }
            }
            
            Spacer()
            
            ZStack(alignment: .trailing) {
                TextField("Your Message", text: $message, axis: .vertical)
                        .font(.headline)
                        .padding(16)
                        .padding(.trailing, 48)
                        .background(Color(.systemGroupedBackground))
                        .clipShape(Capsule())
                    Button(action: {
                        print("Test")
                    }, label: {
                        Text("Send")
                            .fontWeight(.semibold)
                    })
                    .padding(.horizontal)
            }
            .padding()
        }
    }
}

#Preview {
    ChatView()
}
