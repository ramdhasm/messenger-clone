//
//  RegistrationViewModel.swift
//  Messenger
//
//  Created by Ramdhas on 2023-10-10.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var fullname = ""
    @Published var email = ""
    @Published var password = ""
    
    func createUser() async throws {
        try await AuthService().createUser(name: fullname, email: email, password: password)
    }
}
