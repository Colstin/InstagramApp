//
//  IGTextFieldModifier.swift
//  InstagramClone
//
//  Created by Colstin Donaldson on 7/7/23.
//

import SwiftUI

//MARK: This is a Custom Modifyer we can call
// Useful if we dont need to create an entire object just using the same mods 

struct IGTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal, 24)
    }
}
