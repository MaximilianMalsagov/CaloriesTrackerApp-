//
//  User.swift
//  ToDoFire
//
//  Created by Maximilian on 12.01.2023.
//


import Foundation
import Firebase

struct AppUser {
    
    let uid: String
    let email: String
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email!
    }
}
