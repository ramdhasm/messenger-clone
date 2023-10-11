//
//  ProfileView.swift
//  Messenger
//
//  Created by Ramdhas on 2023-10-07.
//

import SwiftUI
import PhotosUI

struct ProfileView: View {
    
    @StateObject var profileVM = ProfileViewModel()
    var user: User
    
    var body: some View {
        VStack{
            VStack{
                PhotosPicker(selection: $profileVM.selectedItem) {
                    if let profileImage = profileVM.profileImage {
                        profileImage
                            .resizable()
                            .frame(width: 80, height: 80)
                            .scaledToFill()
                            .clipShape(Circle())
                        
                    } else {
                        CircleProfileImageView(user: user, size: .large)
                    }
                }
                Text(user.fullName)
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            
            List{
                Section {
                    ForEach(SettingOptionsViewModel.allCases, id: \.self) { option in
                        HStack{
                            Image(systemName: option.image)
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(option.imageBgColor)
                            Text(option.title)
                                .font(.subheadline)
                        }
                    }
                }
                
                Section {
                    Button(action: {
                        AuthService.shared.signOut()
                    }, label: {
                        Text("Logout")
                    })
                    
                    Button(action: {
                        print("Delete Account")
                    }, label: {
                        Text("Delete Account")
                    })
                }
                .foregroundStyle(.red)
            }
        }
    }
}

#Preview {
    ProfileView(user: User.MOCK_USER)
}
