//
//  ChatBubble.swift
//  Messenger
//
//  Created by Ramdhas on 2023-10-09.
//

import SwiftUI

struct ChatBubble: Shape {
    var isFromCurrentUser: Bool
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [
            .topRight,
            .topLeft,
            isFromCurrentUser ? .bottomLeft: .bottomRight], cornerRadii: CGSize(width: 16, height: 16))
        return Path(path.cgPath)
    }
}

#Preview {
    ChatBubble(isFromCurrentUser: true)
}
