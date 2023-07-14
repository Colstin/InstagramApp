//
//  AuthService.swift
//  InstagramClone
//
//  Created by Colstin Donaldson on 7/11/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestoreSwift
import Firebase

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    static let shared = AuthService() // anything using the authService will be shared
    
    
    init() {
        Task { try await loadUserData() }
    }
    
   
    @MainActor
    func createUser(email: String, password: String, username: String) async throws {
        //print("Email is \(email)")
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            //print("DEBUG: Did create user..")
            await uploadUserData(uid: result.user.uid, email: email, username: username)
            //print("DEBUG: Did upload user data..")
        } catch {
            print("DEBUG: Failed to register user with error \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await loadUserData() //Important in order to load new user in
        } catch {
            print("DEBUG: Failed to Login with error \(error.localizedDescription)")
        }
    }
    
    func signout() {
        try? Auth.auth().signOut()
        self.userSession = nil
        self.currentUser = nil
    }
    
    @MainActor
    func loadUserData() async throws {
        self.userSession = Auth.auth().currentUser
        guard let currentUid = self.userSession?.uid else { return }
        self.currentUser = try await UserService.fetchUser(withUid: currentUid)
        
    }
    
    private func uploadUserData(uid: String, email: String, username: String) async {
        let user = User(id: uid, username: username, email: email)
        self.currentUser = user
        guard let encodedUser = try? Firestore.Encoder().encode(user) else { return } //This Encoded data using User Data model
        
        try? await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
    }
}
