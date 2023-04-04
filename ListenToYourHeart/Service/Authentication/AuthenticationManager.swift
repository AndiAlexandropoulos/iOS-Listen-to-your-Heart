//
//  AuthenticationManager.swift
//  ListenToYourHeart
//
//  Created by andi a on 02.04.23.
//

import Foundation
import FirebaseAuth

struct AuthDataResultModel {
    let uid: String
    let email: String?
    let photoUrl: String?
    
    init(user: User) {
        self .uid = user.uid
        self.email = user.email
        self.photoUrl = user.photoURL?.absoluteString
    }
}

final class AuthenticationManager {
    
    static let shared = AuthenticationManager()  // Singleton Methode nicht gut?
    private init() { }
    
    func createUser(email: String, password: String) async throws {
            let authdataResult = try await Auth.auth().createUser(withEmail: email, password: password)
        let result = AuthDataResultModel(user: authdataResult.user)
    }
}
