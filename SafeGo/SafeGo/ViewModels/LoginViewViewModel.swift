//
//  LoginViewViewModel.swift
//  SafeGo
//
//  Created by Juan Martin Santos Ayala on 21/09/23.
//

import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject {
    @Published var username = ""
    @Published var password = ""
    @Published var validationError: String = ""
    @Published var showAlert = false
    
    init() {
    }
    
    func login() {
        guard validation() else {
            return
        }
        
        // Try to log in
        Auth.auth().signIn(withEmail: username, password: password)
    }

    private func validation() -> Bool {
        guard !username.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            DispatchQueue.main.async {
                self.showAlert = true
                self.validationError = "Please fill the form completely"
            }
            return false
        }
        
        return true
    }
}
