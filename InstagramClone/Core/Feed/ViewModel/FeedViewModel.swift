//
//  FeedViewModel.swift
//  InstagramClone
//
//  Created by Colstin Donaldson on 7/14/23.
//

import Foundation
import Firebase

class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    init() {
        Task { try await fetchPosts() }
    }
    
    // This Fetches the posts document data from Firebase from the data when we post a photo
    @MainActor
    func fetchPosts() async throws{
        let snapshot = try await Firestore.firestore().collection("posts").getDocuments()
        self.posts = try snapshot.documents.compactMap({ try $0.data(as: Post.self) }) // list of documents and turn them into a post Object
        
        // This makes sure any updates to the user is displayed as we are fetching Post data up above
        // The post Collection on Firebase only has owner ID none of the user data so we have to create a pointer
        for i in 0 ..< posts.count {
            let post = posts[i]
            let ownerUid = post.ownerUid
            let postUser = try await UserService.fetchUser(withUid: ownerUid)
            self.posts[i].user = postUser
        }
    }
}

/* Same thing as the way up above but above is just better code
 self.posts = try snapshot.documents.compactMap({ document in  // list of documents and turn them into a post
     let post = try document.data(as: Post.self)
     return post
 })
 */
