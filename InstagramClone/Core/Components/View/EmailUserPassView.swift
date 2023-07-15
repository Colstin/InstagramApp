//
//  EmailUserPassView.swift
//  InstagramClone
//
//  Created by Colstin Donaldson on 7/7/23.
//

import SwiftUI

struct EmailUserPassView: View {
    let title: String
    let subtitle: String
    let placeholder: String
    @Binding var text: String
    var isSecureField = false
   
    
    var body: some View {
        VStack {
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            
            Text(subtitle)
                .font(.footnote)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24)
            
            if isSecureField {
                SecureField(placeholder, text: $text)
                    .modifier(IGTextFieldModifier())
                    .padding(.top)
            } else {
                TextField(placeholder, text: $text)
                    .textInputAutocapitalization(.none)
                    .modifier(IGTextFieldModifier())
                    .padding(.top)
            }
        }
    }
}

struct EmailUserPassView_Previews: PreviewProvider {
    static var previews: some View {
        EmailUserPassView(title: " Title", subtitle: "What the title will do", placeholder: "placeholder", text: .constant(""))
    }
}
