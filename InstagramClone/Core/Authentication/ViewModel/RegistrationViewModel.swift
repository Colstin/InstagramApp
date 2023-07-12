//
//  RegistrationViewModel.swift
//  InstagramClone
//
//  Created by Colstin Donaldson on 7/11/23.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var username = ""
    
    func createUser() async throws {
       try await AuthService.shared.createUser(email: email, password: password, username: username)
        
        // resets the signup textFields so they are blank after signing up a user
        email = ""
        password = ""
        username = ""
        
    }
}


/*
 - RegistrationViewModel conatains all the propeties needed for sign up that get set througout the registration flow
 
 - Also responsible for calling createUser() function in AuthService

 - The auth sercice here is the same shared instance that the ContentView is using. When the userSession gets set from the registration flow, it will also update the ContentView
 
 */
