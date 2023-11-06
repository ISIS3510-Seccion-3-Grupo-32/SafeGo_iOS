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
    @Published var dateOfBirt = Date()
    @Published var validationError: String = ""
    @Published var showAlert = false
    
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
                           birthDate: dateOfBirt.timeIntervalSince1970,
                           joinned: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
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
        
        guard calculateAge(from: dateOfBirt) >= 14 else {
            DispatchQueue.main.async {
                self.showAlert = true
                self.validationError = "You must be at least 14 years old to register"
            }
            return false
        }
        
        guard calculateAge(from: dateOfBirt) <= 120 else {
            DispatchQueue.main.async {
                self.showAlert = true
                self.validationError = "Please insert a valid date"
            }
            return false
        }
        
        return true
    }
    
    func calculateAge(from date: Date) -> Int {
        let calendar = Calendar.current
        let currentDate = Date()
        let birthDate = date
        let ageComponents = calendar.dateComponents([.year], from: birthDate, to: currentDate)
        let age = ageComponents.year ?? 0
        return age
    }
}
