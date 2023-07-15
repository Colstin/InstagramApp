//
//  InputView.swift
//  InstagramClone
//
//  Created by Colstin Donaldson on 7/10/23.
//

import SwiftUI

struct InputView: View {
    let placeholder: String
    @Binding var text: String
    var isSecureField = false
    
    var body: some View {
        
        if isSecureField {
            SecureField(placeholder, text: $text)
                .modifier(IGTextFieldModifier())
                
        } else {
            TextField(placeholder, text: $text)
                .textInputAutocapitalization(.none)
                .modifier(IGTextFieldModifier())
        }
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView(placeholder: "placeholder", text: .constant(""))
    }
}
