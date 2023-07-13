//
//  SearchView.swift
//  InstagramClone
//
//  Created by Colstin Donaldson on 7/7/23.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @StateObject var viewModel = SearchViewModel()
    private let personCircleImage = Image(systemName: "person.circle")
    
    var body: some View {
        
        
        NavigationStack {
            ScrollView{
                LazyVStack(spacing: 12) {
                    ForEach(viewModel.users) { user in
                       
                        NavigationLink(value: user) {
                            HStack {
                                /*
                                 Image(systemName: "person.circle" ) //user.profileImageUrl ?? ""
                                     .resizable()
                                     .scaledToFill()
                                     .foregroundColor(.gray)
                                     .frame(width: 40, height: 40)
                                     .clipShape(Circle())
                                 */
                                CircularProfileImageView(user: user, size: .small)
                                
                                VStack(alignment: .leading){
                                    Text(user.username)
                                        .fontWeight(.semibold)
                                    
                                    if let fullname = user.fullname {
                                        Text(fullname)
                                    }
                                }
                                .font(.footnote)
                                Spacer()
                            }
                            .foregroundColor(.black)
                            .padding(.horizontal)
                        }
                    }
                }
                .padding(.top, 8)
                .searchable(text: $searchText, prompt: "Search...")
            }
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user: user)
                    .navigationBarBackButtonHidden()
            })
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
           
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
