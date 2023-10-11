//
//  AuthService.swift
//  Messenger
//
//  Created by Ramdhas on 2023-10-10.
//

import Foundation
import Firebase

class AuthService {
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    func login(email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
        } catch {
            print("Error in signin. Reason: \(error.localizedDescription)")
        }
    }
    
    func createUser(name: String, email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            print("Success with ", result.user.uid)
        } catch {
            print("Error: ", error.localizedDescription)
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.userSession = nil
        } catch {
            print("Error in Signout. Reason:\(error.localizedDescription)")
        }
    }
    
}
