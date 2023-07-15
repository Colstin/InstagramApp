//
//  PostService.swift
//  InstagramClone
//
//  Created by Colstin Donaldson on 7/14/23.
//

import Foundation
import Firebase

struct PostService {
    
    private static let postsCollecion = Firestore.firestore().collection("posts")
    
    static func fetchFeedPosts() async throws -> [Post] {
        let snapshot = try await postsCollecion.getDocuments()
        var posts = try snapshot.documents.compactMap({ try $0.data(as: Post.self) }) // list of documents and turn them into a post Object
        
        // This makes sure any updates to the user is displayed as we are fetching Post data up above
        // The post Collection on Firebase only has owner ID none of the user data so we have to create a pointer
        for i in 0 ..< posts.count {
            let post = posts[i]
            let ownerUid = post.ownerUid
            let postUser = try await UserService.fetchUser(withUid: ownerUid)
            posts[i].user = postUser
        }
        return posts
    }
    
    // Look at list of collection and filter based on the user ID and get all of their posts
    static func fetchUserPosts(uid: String) async throws -> [Post] {
        let snapshot = try await postsCollecion.whereField("ownerUid", isEqualTo: uid).getDocuments()
        return try snapshot.documents.compactMap({ try $0.data(as: Post.self) })
    }
}
