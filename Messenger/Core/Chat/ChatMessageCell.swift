//
//  ChatMessageView.swift
//  Messenger
//
//  Created by Ramdhas on 2023-10-09.
//

import SwiftUI

struct ChatMessageCell: View {
    @State var isFromCurrentUser: Bool
    
    var body: some View {
        HStack{
            if isFromCurrentUser {
                Spacer()
                Text("Test Message by me")
                    .font(.subheadline)
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
                    .clipShape(ChatBubble(isFromCurrentUser: true))
                    .frame(maxWidth: UIScreen.main.bounds.width/1.5, alignment: .trailing)
            } else {
                HStack(alignment: .bottom){
                    CircleProfileImageView(user: User.MOCK_USER, size: .xxSmall)
                    Text("Test Message by opponentTest Message by opponent")
                        .font(.subheadline)
                        .padding()
                        .background(Color(.systemGray5))
                        .foregroundColor(.black)
                        .clipShape(ChatBubble(isFromCurrentUser: false))
                        .frame(maxWidth: UIScreen.main.bounds.width/1.5, alignment: .leading)
                    Spacer()
                }
            }
        }
        .padding(.horizontal, 8)
    }
}

#Preview {
    ChatMessageCell(isFromCurrentUser: true)
}
