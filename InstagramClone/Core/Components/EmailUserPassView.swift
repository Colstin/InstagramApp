//
//  EmailUserPassView.swift
//  InstagramClone
//
//  Created by Colstin Donaldson on 7/7/23.
//

import SwiftUI

struct EmailUserPassView: View {
   // @State private var email = ""
    var title: String
    var subtitle: String
 
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 14){
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            
            Text(subtitle)
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            
            //extField("Email", text: $email)
                .textInputAutocapitalization(.none)
                .modifier(IGTextFieldModifier())
                .padding(.top)
            
            // Navigation Link to username
            NavigationLink {
                CreateUsernameView()
                    .navigationBarBackButtonHidden()
            } label: {
                Text("Next")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(width: 360, height: 44)
                    .background(Color(.systemBlue))
                    .cornerRadius(8)
            }
            .padding(.vertical)

            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss()
                    }
            }
        }
    }
}

struct EmailUserPassView_Previews: PreviewProvider {
    static var previews: some View {
        EmailUserPassView(title: "Email", subtitle: "You'll use this email to sign in to your account")
    }
}
