//
//  InboxRowView.swift
//  Messenger
//
//  Created by Ramdhas on 2023-10-05.
//

import SwiftUI

struct InboxRowView: View {
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            CircleProfileImageView(user: User.MOCK_USER, size: .large)
            VStack(alignment: .leading, spacing: 4) {
                Text("Jos Butler")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text("Internataional cricket player, representing England")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(2)
            }
            HStack{
                Text("Today")
                Image(systemName: "chevron.right")
            }
            .font(.footnote)
            .foregroundColor(.gray)
        }
        .frame(height: 72)
    }
}

struct InboxRowView_Previews: PreviewProvider {
    static var previews: some View {
        InboxRowView()
    }
}
