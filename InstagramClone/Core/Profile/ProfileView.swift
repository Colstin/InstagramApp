//
//  ProfileView.swift
//  InstagramClone
//
//  Created by Colstin Donaldson on 7/7/23.
//

// MARK: WE USE THIS for the SearchView

import SwiftUI

struct ProfileView: View {
    
    @Environment(\.dismiss) var dismiss
    
    let user: User
    
    var posts: [Post] {
        return Post.MOCK_POSTS.filter({ $0.user?.username == user.username})
    }
    
    var body: some View {
       
        ScrollView{
            // Header
            ProfileHeaderView(user: user)
            
            // Post Grid View
            PostGridView(posts: posts)
  
        } // MARK: These will be hidden in preview but will show since we access this screen in a Stack through the SearchView
        .navigationTitle(user.username)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss()
                    }
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button{
                    
                } label: {
                    Image(systemName: "ellipsis")
                        .foregroundColor(.black)
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User.MOCK_USERS[0])
    }
}



// ForEach(0 ... 15, id: \.self){ index in }
