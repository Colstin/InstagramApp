//
//  SearchView.swift
//  InstagramClone
//
//  Created by Colstin Donaldson on 7/7/23.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    var body: some View {
        NavigationStack {
            ScrollView{
                LazyVStack(spacing: 12) {
                    ForEach(0 ... 15, id: \.self) { user in
                        HStack {
                            Image("colstin2")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 40, height: 40)
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading){
                                Text("Bigboy71")
                                    .fontWeight(.semibold)
                                
                                Text("Jay Calvin")
                            }
                            .font(.footnote)
                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.top, 8)
                .searchable(text: $searchText, prompt: "Search...")
            }
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
