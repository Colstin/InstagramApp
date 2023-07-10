//
//  ProfileView.swift
//  InstagramClone
//
//  Created by Colstin Donaldson on 7/7/23.
//

import SwiftUI

struct ProfileView: View {
    
    @Environment(\.dismiss) var dismiss
    
    let user: User
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    private let imageDimension: CGFloat = (UIScreen.main.bounds.width / 3) - 1
    
    var posts: [Post] {
        return Post.MOCK_POSTS.filter({ $0.user?.username == user.username})
    }
    
    var body: some View {
       
        ScrollView{
            // header
            VStack(spacing: 10){
                // Profile pic and followers
                HStack{
                    Image(user.profileImageUrl ?? "")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 80, height: 80)
                        .clipShape(Circle())
                    
                    Spacer()
                    
                    HStack{
                        UserStatView(value: 3, title: "Posts")
                        
                        UserStatView(value: 12, title: "Followers")
                        
                        UserStatView(value: 24, title: "Following")
                    }
                }
                .padding(.horizontal)
                
                
                // Name and Bio
                VStack (alignment: .leading, spacing: 4){
                    if let fullname = user.fullname {
                        Text(fullname)
                            .font(.footnote)
                            .fontWeight(.semibold)
                    }
                    
                    if let bio = user.bio {
                        Text(bio)
                            .font(.footnote)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
               
                
                // Edit profile Button
                Button {
                    
                } label: {
                    Text("Edit Profile")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 360, height: 32)
                        .foregroundColor(.black)
                        .overlay {
                            RoundedRectangle(cornerRadius: 6).stroke(Color.gray, lineWidth: 1)
                        }
                }
                
                Divider()
            }
            
            // pictures grid view
            LazyVGrid(columns: gridItems, spacing: 1) {
                ForEach(posts){ post in
                    Image(post.imageUrl)
                        .resizable()
                        .scaledToFill()
                        .frame(width: imageDimension, height: imageDimension)
                        .clipped()
                }
            }
          
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
