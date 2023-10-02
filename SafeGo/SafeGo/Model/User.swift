//
//  User.swift
//  SafeGo
//
//  Created by Juan Martin Santos Ayala on 21/09/23.
//

import Foundation

struct User {
    let email: String
    // Add other user-related properties as needed
}

struct AuthResponse: Decodable {
    let token: String

    private enum CodingKeys: String, CodingKey {
        case token
    }
}

