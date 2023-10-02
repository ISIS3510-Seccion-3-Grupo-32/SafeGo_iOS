//
//  AuthService.swift
//  SafeGo
//
//  Created by Juan Martin Santos Ayala on 1/10/23.
//

import Foundation

class AuthService {
    private let networkService: NetworkService
    private let loginEndpoint = "http://34.160.111.171/api/login/"
    private let authStateManager: AuthStateManager

    init(networkService: NetworkService, authStateManager: AuthStateManager) {
        self.networkService = networkService
        self.authStateManager = authStateManager
    }

    func login(email: String, password: String, completion: @escaping (HTTPURLResponse?) -> Void) {
        let parameters = ["email": email, "password": password]

        networkService.request(endpoint: loginEndpoint, method: "POST", parameters: parameters) { response in
            completion(response)
        }
        authStateManager.setLoggedIn(true)
    }

    func logout(completion: @escaping (Bool) -> Void) {
        let logoutEndpoint = "http://34.160.111.171/api/logout/"

        networkService.request(endpoint: logoutEndpoint, method: "POST", parameters: nil) { response in
            let success = response?.statusCode == 200
            completion(success)
        }
        authStateManager.setLoggedIn(false)
    }
}



