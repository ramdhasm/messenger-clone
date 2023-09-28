//
//  LoginView.swift
//  Messenger
//
//  Created by Ramdhas on 2023-09-27.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack{
            Spacer()
            //logo icon
            Image("messengerIcon")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            
            //Textfields
            
            VStack{
                TextField("Enter your mail", text: $email)
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal, 24)
                TextField("Enter your password", text: $password)
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal, 24)
            }
            
            //forgot password
            Button {
                print("Forgot")
            } label: {
                Text("Forgot Password?")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .padding(.top)
                    .padding(.trailing, 20)
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            
            //login button
            Button {
                print("login")
            } label: {
                Text("Login")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 360, height: 44)
                    .background(Color(.systemBlue))
                    .cornerRadius(10)
            }
            .padding(.vertical)

            // Seperator
            HStack {
                Rectangle()
                    .frame(width: (UIScreen.main.bounds.width/2)-40, height: 0.5)
                Text("Or")
                    .font(.footnote)
                    .fontWeight(.semibold)
                Rectangle()
                    .frame(width: (UIScreen.main.bounds.width/2)-40, height: 0.5)
            }
            .foregroundColor(.gray)
            
            //facebook
            Button {
                print("Facebook")
            } label: {
                HStack{
                    Image("facebookIcon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                    Text("Continue with Facebook")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
            .padding(.top, 10)
            
            Spacer()
            Divider()
            
            //signup            
            NavigationLink {
                Text("Signup View")
            } label: {
                HStack {
                    Text("Don't have an account?")
                    Text("Signup")
                        .fontWeight(.semibold)
                }
                .font(.footnote)
            }
            .padding(.vertical)
            .foregroundColor(Color.blue)

        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
