//
//  UserService.swift
//  Messenger
//
//  Created by Ramdhas on 2023-10-12.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class UserService {

    @Published var currentUser: User?
    static let shared = UserService()
    
    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        self.currentUser = user
    }
}
