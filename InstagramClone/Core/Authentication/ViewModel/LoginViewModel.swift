//
//  LoginViewModel.swift
//  InstagramClone
//
//  Created by Colstin Donaldson on 7/11/23.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    
    func signIn() async throws {
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
