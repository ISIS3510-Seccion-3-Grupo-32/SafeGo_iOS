//
//  LoginViewViewModel.swift
//  SafeGo
//
//  Created by Juan Martin Santos Ayala on 21/09/23.
//

import FirebaseAuth
import Foundation
import KeychainAccess

class LoginViewController: ObservableObject {
    @Published var username = ""
    @Published var password = ""
    @Published var validationError: String = ""
    @Published var showAlert = false
    @Published var disablebutton = false

    private let keychain = Keychain(service: "uniandes.SafeGoAppPrueba")

    func login() {
        self.disablebutton = true
        guard validation() else {
            self.disablebutton = false
            return
        }

        // Try to log in
        Auth.auth().signIn(withEmail: username, password: password) { [weak self] (_, error) in
            guard let self = self else { return }

            if let error = error {
                // Handle login error
                print("Login error: \(error.localizedDescription)")
            } else {
                // Save credentials to Keychain upon successful login
                self.saveCredentialsToKeychain(username: self.username, password: self.password)
            }

            self.disablebutton = false
        }
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

    // Save user credentials to Keychain
    private func saveCredentialsToKeychain(username: String, password: String) {
        do {
            try keychain.set(username, key: "username")
            try keychain.set(password, key: "password")
        } catch {
            print("Error saving credentials to Keychain: \(error)")
        }
    }

    // Retrieve user credentials from Keychain
    private func getCredentialsFromKeychain() -> (username: String?, password: String?) {
        do {
            let username = try keychain.get("username")
            let password = try keychain.get("password")
            return (username, password)
        } catch {
            print("Error retrieving credentials from Keychain: \(error)")
            return (nil, nil)
        }
    }
}

