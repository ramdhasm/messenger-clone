//
//  UserModel.swift
//  Messenger
//
//  Created by Ramdhas on 2023-10-08.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Codable, Identifiable, Hashable {
    @DocumentID var id: String?
//    var id: String {
//        return uid ?? NSUUID().uuidString
//    }
    let fullName: String
    let email: String
    var profileImageURL: String?
}

extension User {
    static let MOCK_USER = User(fullName: "Ramdhas M", email: "ramdhas", profileImageURL: "ramdhas")
}


