//
//  LoginViewModel.swift
//  Messenger
//
//  Created by Ramdhas on 2023-10-10.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func login() async throws {
        try await AuthService.shared.login(email: email, password: password)
    }
    
}
