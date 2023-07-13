//
//  User.swift
//  InstagramClone
//
//  Created by Colstin Donaldson on 7/10/23.
//

import Foundation
import Firebase

struct User: Identifiable, Hashable, Codable {
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullname: String?
    var bio: String?
    var email: String
    
    var isCurrentUser: Bool {
        guard let currentUid = Auth.auth().currentUser?.uid else { return false }
        return currentUid == id
    }
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(id: NSUUID().uuidString, username: "colstin", profileImageUrl: "colstin1", fullname: "Colstin Donaldson", bio: "A guy from seattle", email: "colstin50@gmail.com"),
        .init(id: NSUUID().uuidString, username: "glasses101", profileImageUrl: "glasses", fullname: "glasses guy", bio: "A guy has glasses", email: "glasses@gmail.com"),
        .init(id: NSUUID().uuidString, username: "pooltrading", profileImageUrl: "pool", fullname: nil, bio: "A guy from pool", email: "pool@gmail.com"),
        .init(id: NSUUID().uuidString, username: "beachvibes", profileImageUrl: "beach", fullname: "Beach Girl", bio: "A guy from beach", email: "beach@gmail.com"),
        .init(id: NSUUID().uuidString, username: "mark", profileImageUrl: "facebook_logo", fullname: "Mark Zuck", bio: "A guy who owns facebook", email: "mark@gmail.com")
    ]
}
