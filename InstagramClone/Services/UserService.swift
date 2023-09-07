//
//  UserService.swift
//  InstagramClone
//
//  Created by Colstin Donaldson on 7/12/23.
//

import Foundation
import Firebase

struct UserService {
    
    //Will fetch any user in our app if we pass in their I.D
    static func fetchUser(withUid uid: String) async throws -> User {
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        //print("DEBUG: Snapshot data is \(snapshot.data())")
        return try snapshot.data(as: User.self) // This Decodes data using User Data Model
    }
    
    static func fetchAllUsers() async throws -> [User] {
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
        return snapshot.documents.compactMap({ try? $0.data(as: User.self) })
    }
}






/* This is the traditional way that would work, (build an array and return an array)
 var users = [User]()

 let documents = snapshot.documents
 
 for doc in documents {
     //print(doc.data())
     guard let user = try? doc.data(as: User.self) else { return users }
     users.append(user)
 }
 return users
 */
