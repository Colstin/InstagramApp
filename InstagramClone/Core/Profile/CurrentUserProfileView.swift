//
//  CurrentUserProfileView.swift
//  InstagramClone
//
//  Created by Colstin Donaldson on 7/10/23.

// MARK: WE USE THIS for the MainTabView

import SwiftUI

struct CurrentUserProfileView: View {
    
    let user: User
    
    var posts: [Post] {
        return Post.MOCK_POSTS.filter({ $0.user?.username == user.username})
    }
    
    var body: some View {
         NavigationStack {
             ScrollView{
                 
                 // Header
                 ProfileHeaderView(user: user)
                 
                 // Post Grid View
                 PostGridView(posts: posts)

             }
             .navigationTitle("Profile")
             .navigationBarTitleDisplayMode(.inline)
             .toolbar {
                 ToolbarItem(placement: .navigationBarTrailing) {
                     Button{
                         
                     } label: {
                         Image(systemName: "line.3.horizontal")
                             .foregroundColor(.black)
                     }
                 }
             }
        }
    }
}

struct CurrentUserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentUserProfileView(user: User.MOCK_USERS[0])
    }
}
