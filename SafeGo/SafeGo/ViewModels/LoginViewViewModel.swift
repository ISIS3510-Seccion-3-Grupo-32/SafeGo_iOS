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
    
    init() {}
    
    func login () {
        guard validation() else {
            return
        }
        
        // try to log in
    }
    
    private func validation() -> Bool {
        errorMessage = ""
        guard !username.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            errorMessage = "Please fill the form completely"
            return false
        }
        
        return true
    }
}
