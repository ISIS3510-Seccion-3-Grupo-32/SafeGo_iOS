//
//  LoginViewViewModel.swift
//  SafeGo
//
//  Created by Juan Martin Santos Ayala on 21/09/23.
//

import Foundation

class LoginViewViewModel: ObservableObject {
    @Published var username = ""
    @Published var password = ""
    @Published var errorMessage = ""
    private let authService: AuthService
    
    init(authService: AuthService) {
        self.authService = authService
    }
    
    func login(completion: @escaping (Bool) -> Void) {
        authService.login(email: username, password: password) { response in
            let success = response?.statusCode == 200
            completion(success)
        }
    }
    
    func logout(completion: @escaping (Bool) -> Void) {
            authService.logout { success in
                completion(success)
            }
        }

    private func validation() -> Bool {
        errorMessage = ""
        guard !username.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill the form completely"
            return false
        }
        
        return true
    }
}
