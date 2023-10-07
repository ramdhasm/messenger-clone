//
//  ProfileView.swift
//  Messenger
//
//  Created by Ramdhas on 2023-10-07.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack{
            // Header
            VStack{
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundColor(Color(.systemGray4))
                Text("Ramdhas Munirathinam")
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            
            //List
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
                        print("Logout")
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
    ProfileView()
}
