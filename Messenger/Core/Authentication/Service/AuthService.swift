//
//  AuthService.swift
//  Messenger
//
//  Created by Ramdhas on 2023-10-10.
//

import Foundation
import Firebase

class AuthService {
    func login(email: String, password: String) async throws {
        print("email", email)
        print("password", password )
    }
    
    func createUser(name: String, email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            print("Success with ", result.user.uid)
        } catch {
            print("Error: ", error.localizedDescription)
        }
    }
    
}
