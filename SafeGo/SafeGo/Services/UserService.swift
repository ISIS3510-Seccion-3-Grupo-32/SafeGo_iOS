//
//  UserService.swift
//  SafeGo
//
//  Created by Juan Martin Santos Ayala on 1/10/23.
//

import Foundation

class AuthStateManager: ObservableObject {
    private let userDefaults = UserDefaults.standard
    private let isLoggedInKey = "isLoggedIn"

    @Published var isLoggedIn: Bool {
        didSet {
            userDefaults.set(isLoggedIn, forKey: isLoggedInKey)
        }
    }

    init() {
        self.isLoggedIn = userDefaults.bool(forKey: isLoggedInKey)
    }

    func setLoggedIn(_ loggedIn: Bool) {
        isLoggedIn = loggedIn
    }
}

