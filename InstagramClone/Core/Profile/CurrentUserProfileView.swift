//
//  CurrentUserProfileView.swift
//  InstagramClone
//
//  Created by Colstin Donaldson on 7/10/23.
//

import SwiftUI

struct CurrentUserProfileView: View {
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    
    var body: some View {
         NavigationStack {
             ScrollView{
                 // header
                 VStack(spacing: 10){
                     // Profile pic and followers
                     HStack{
                         Image("colstin1")
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
                         Text("Colstin Donaldson")
                             .font(.footnote)
                             .fontWeight(.semibold)
                         
                         Text("From Seattle Just moved to vegas")
                             .font(.footnote)

                         
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
                     ForEach(0 ... 15, id: \.self){ index in
                         Image("colstin1")
                             .resizable()
                             .scaledToFit()
                     }
                 }
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
        CurrentUserProfileView()
    }
}
