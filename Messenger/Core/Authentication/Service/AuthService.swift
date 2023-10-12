//
//  AuthService.swift
//  Messenger
//
//  Created by Ramdhas on 2023-10-10.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class AuthService {
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
        Task { try await UserService.shared.fetchCurrentUser() }
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
            try await uploadUserData(name: name, email: email, id: result.user.uid)
            print("Success with ", result.user.uid)
            self.userSession = result.user
        } catch {
            print("Error: ", error.localizedDescription)
        }
    }
    
    func uploadUserData(name: String, email: String, id: String) async throws{
        let user = User(fullName: name, email: email)
        guard let encodedUser = try? Firestore.Encoder().encode(user) else {return}
        try await Firestore.firestore().collection("users").document(id).setData(encodedUser)
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
