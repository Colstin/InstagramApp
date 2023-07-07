//
//  FeedCell.swift
//  InstagramClone
//
//  Created by Colstin Donaldson on 7/7/23.
//

import SwiftUI

struct FeedCell: View {
    var body: some View {
        VStack{
            // Image + Username
            HStack{
                Image("pool")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                
                Text("Pool")
                    .font(.footnote)
                    .fontWeight(.semibold)
                
                Spacer()
            }
            .padding(.leading, 8)
            
            // Post image
            Image("pool")
                .resizable()
                .scaledToFill()
                .frame(height: 400)
                .clipShape(Rectangle())
             
                
            
            // Action Buttons
            HStack(spacing: 16) {
                Button {
                    print("like post")
                } label: {
                    Image(systemName: "heart")
                        .imageScale(.large)
                }
                
                Button {
                    print("Comment on post")
                } label: {
                    Image(systemName: "bubble.right")
                        .imageScale(.large)
                }
                
                Button {
                    print("Share post")
                } label: {
                    Image(systemName: "paperplane")
                        .imageScale(.large)
                }

                Spacer()
            }
            .padding(.leading, 8)
            .padding(.top, 4)
            .foregroundColor(.black)
            
            // likes label
            Text("23 Likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
            
            // caption label
            HStack {
                Text("Cameron ").fontWeight(.semibold) +
                Text("This is some test caption for now")
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.footnote)
            .padding(.leading, 10)
            .padding(.top, 1)
            
            Text("6h ago")
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 1)
                .foregroundColor(.gray)
        }
    }
}

struct FeedCell_Previews: PreviewProvider {
    static var previews: some View {
        FeedCell()
    }
}
