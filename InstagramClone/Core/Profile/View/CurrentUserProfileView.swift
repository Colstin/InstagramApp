//
//  CurrentUserProfileView.swift
//  InstagramClone
//
//  Created by Colstin Donaldson on 7/10/23.

// MARK: WE USE THIS for the MainTabView

import SwiftUI

struct CurrentUserProfileView: View {
    
    let user: User
    
    var body: some View {
         NavigationStack {
             ScrollView{
                 
                 // Header
                 ProfileHeaderView(user: user)
                 
                 // Post Grid View
                 PostGridView(user: user)

             }
             .navigationTitle("Profile")
             .navigationBarTitleDisplayMode(.inline)
             .toolbar {
                 ToolbarItem(placement: .navigationBarTrailing) {
                     Button{
                         AuthService.shared.signout()
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
