//
//  User.swift
//  hw1.2
//
//  Created by Misha on 19.12.2020.
//

import Foundation

struct User {
    let login: String
    let password: String
    
    static func getUserData() -> User {
        User(
            login: "artist",
            password: "creator"
        )
    }
}
