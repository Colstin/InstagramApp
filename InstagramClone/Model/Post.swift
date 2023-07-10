//
//  Post.swift
//  InstagramClone
//
//  Created by Colstin Donaldson on 7/10/23.
//

import Foundation

struct Post: Identifiable, Hashable, Codable {
    let id: String
    let ownerUid: String
    let caption: String
    var likes: Int
    let imageUrl: String
    let timeStamp: Date
    var user: User?
}

extension Post {
    static var MOCK_POSTS: [Post] = [
        .init(
            id: NSUUID().uuidString,
              ownerUid: NSUUID().uuidString,
              caption: "Selfie",
              likes: 12,
              imageUrl: "colstin1",
              timeStamp: Date(),
              user: User.MOCK_USERS[0]
        ),
        
        .init(
            id: NSUUID().uuidString,
              ownerUid: NSUUID().uuidString,
              caption: "Cool glasses",
              likes: 120,
              imageUrl: "glasses",
              timeStamp: Date(),
              user: User.MOCK_USERS[1]
        ),
        
        .init(
            id: NSUUID().uuidString,
              ownerUid: NSUUID().uuidString,
              caption: "Chillin by the pool",
              likes: 1200,
              imageUrl: "pool",
              timeStamp: Date(),
              user: User.MOCK_USERS[2]
        ),
        
        .init(
            id: NSUUID().uuidString,
              ownerUid: NSUUID().uuidString,
              caption: "Beautiful View",
              likes: 400,
              imageUrl: "beach",
              timeStamp: Date(),
              user: User.MOCK_USERS[3]
        ),
        
        .init(
            id: NSUUID().uuidString,
              ownerUid: NSUUID().uuidString,
              caption: "The Owner",
              likes: 2000000,
              imageUrl: "facebook_logo",
              timeStamp: Date(),
              user: User.MOCK_USERS[4]
        )
    ]
}




// Identifiable - so we can display things in a SwiftUI list
// Hashable - Makes things Navagatable such as through the NavigationLink's destination + the value
// Codeable - upload and download to and from server/ DB
