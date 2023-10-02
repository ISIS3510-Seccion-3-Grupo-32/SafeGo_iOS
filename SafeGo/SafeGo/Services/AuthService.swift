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

    init(networkService: NetworkService) {
        self.networkService = networkService
    }

    func login(email: String, password: String, completion: @escaping (AuthResponse?) -> Void) {
        let parameters = ["email": email, "password": password]

        networkService.request(endpoint: loginEndpoint, method: "POST", parameters: parameters) { result in
            switch result {
            case .success(let data):
                do {
                    let authResponse = try JSONDecoder().decode(AuthResponse.self, from: data)
                    completion(authResponse)
                } catch {
                    completion(nil)
                }
            case .failure:
                completion(nil)
            }
        }
    }
}

