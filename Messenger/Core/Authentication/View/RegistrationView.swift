//
//  RegistrationView.swift
//  Messenger
//
//  Created by Ramdhas on 2023-09-29.
//

import SwiftUI

struct RegistrationView: View {
    
    @StateObject var registrationVM = RegistrationViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            Spacer()

            Image("messengerIcon")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .padding(30)

            VStack(spacing: 12) {
                TextField("Enter your email", text: $registrationVM.email)
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal, 24)
                TextField("Enter your fullname", text: $registrationVM.fullname)
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal, 24)
                SecureField("Enter your password", text: $registrationVM.password)
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal, 24)
            }

                Button {
                    Task {
                        try await registrationVM.createUser()
                    }
                } label: {
                    Text("Sign Up")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 360, height: 44)
                        .background(Color(.systemBlue))
                        .cornerRadius(10)
                }
                .padding(.vertical)

                Spacer()

                Divider()
                
                
                Button {
                    dismiss()
                } label: {
                    HStack {
                        Text("Already have an account?")
                        Text("Sign In")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                }
                .padding(.vertical)
                .foregroundColor(Color.blue)
        }
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
