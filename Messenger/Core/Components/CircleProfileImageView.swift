//
//  CircleProfileImageView.swift
//  Messenger
//
//  Created by Ramdhas on 2023-10-08.
//

import SwiftUI

enum ProfileImageSize{
    case xxSmall
    case xSmall
    case small
    case medium
    case large
    case xLarge
    
    var dimension: CGFloat {
        switch self {
        case .xxSmall :
            return 28
        case .xSmall:
            return 32
        case .small:
            return 40
        case .medium:
            return 56
        case .large:
            return 64
        case .xLarge:
            return 80
        }
    }
    
}

struct CircleProfileImageView: View {
    var user: User?
    let size: ProfileImageSize
    
    var body: some View {
        if let profileImageURL = user?.profileImageURL {
            Image(profileImageURL)
                .resizable()
                .frame(width:size.dimension , height: size.dimension)
                .scaledToFill()
                .clipShape(Circle())
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width:size.dimension , height: size.dimension)
                .foregroundColor(Color(.systemGray4))
        }
    }
}

#Preview {
    CircleProfileImageView(user: User.MOCK_USER, size: .large)
}
