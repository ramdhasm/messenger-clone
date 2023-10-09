//
//  UserModel.swift
//  Messenger
//
//  Created by Ramdhas on 2023-10-08.
//

import Foundation

struct User: Codable, Identifiable, Hashable {
    var id = NSUUID().uuidString
    let fullName: String
    let email: String
    var profileImageURL: String?
}

extension User {
    static let MOCK_USER = User(fullName: "Ramdhas", email: "ramdhas", profileImageURL: "ramdhas")
}


