//
//  AuthService.swift
//  InstagramClone
//
//  Created by Colstin Donaldson on 7/11/23.
//

import Foundation
import FirebaseAuth


class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService() // anything using the authService will be shared
    
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
   
    @MainActor
    func createUser(email: String, password: String, username: String) async throws {
        //print("Email is \(email)")
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
        } catch {
            print("DEBUG: Failed to register user with error \(error.localizedDescription)")
        }
      
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
        } catch {
            print("DEBUG: Failed to Login with error \(error.localizedDescription)")
        }
    }
    
    func signout() {
        try? Auth.auth().signOut()
        self.userSession = nil
    }
    
    
    func loadUserData() async throws {
        
    }
}
