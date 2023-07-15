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
        self.posts = try await PostService.fetchFeedPosts()
    }
}

/* Same thing as the way up above but above is just better code
 self.posts = try snapshot.documents.compactMap({ document in  // list of documents and turn them into a post
     let post = try document.data(as: Post.self)
     return post
 })
 */
