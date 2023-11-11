//
//  RegisterViewViewModel.swift
//  SafeGo
//
//  Created by Juan Martin Santos Ayala on 21/09/23.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation

class RegisterViewController: ObservableObject {
    @Published var name = ""
    @Published var password = ""
    @Published var email = ""
    @Published var dateOfBirth = Date()
    @Published var validationError: String = ""
    @Published var showAlert = false
    @Published var alerTitle = "Error"
    let user = UserModel()
    
    init() {}

    func register(){
        guard validation() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userid = result?.user.uid else {
                return
            }
            self?.insertUserInfo(id: userid)
        }
    }
    
    private func insertUserInfo(id: String) {
        let newUser = User(id: id,
                           name: name,
                           email: email,
                           birthDate: dateOfBirth.timeIntervalSince1970,
                           joinned: Date().timeIntervalSince1970)
        
        user.insertUser(user: newUser)
        self.showAlert = true
        self.alerTitle = "Register Success"
        self.validationError = "Loging into the app"
    }
    
    private func validation() -> Bool{
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            DispatchQueue.main.async {
                self.showAlert = true
                self.validationError = "Please fill in all fields"
            }
            return false
        }
        
        guard password.count >= 8 else {
            DispatchQueue.main.async {
                self.validationError = "Password must have atleast 8 characters"
                self.showAlert = true
            }
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            DispatchQueue.main.async {
                self.showAlert = true
                self.validationError = "Invalid Email"
            }
            return false
        }
        
        guard user.calculateAge(from: dateOfBirth) >= 14 else {
            DispatchQueue.main.async {
                self.showAlert = true
                self.validationError = "You must be at least 14 years old to register"
            }
            return false
        }
        
        guard user.calculateAge(from: dateOfBirth) <= 120 else {
            DispatchQueue.main.async {
                self.showAlert = true
                self.validationError = "please isnert a valid date"
            }
            return false
        }
        
        return true
    }

}
