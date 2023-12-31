//
//  RegisterViewViewModel.swift
//  SafeGo
//
//  Created by Juan Martin Santos Ayala on 21/09/23.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation
import SystemConfiguration

class RegisterViewController: ObservableObject {
    @Published var name = ""
    @Published var password = ""
    @Published var email = ""
    @Published var dateOfBirth = Date()
    @Published var alertMessage: String = ""
    @Published var showAlert = false
    @Published var isRegistering = false
    @Published var disablebutton = false
    let user = UserModel()
    let serviceAdapter: ServiceAdapter
    
    init(serviceAdapter: ServiceAdapter) {
        self.serviceAdapter = serviceAdapter
    }

    func register(){
        self.disablebutton = true
        guard validation() else {
            self.disablebutton = false
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userid = result?.user.uid else {
                return
            }
            self?.insertUserInfo(id: userid)
            
            DispatchQueue.main.async {
                self?.showAlert = true
                self?.user.setTimeStamp()
            }
        }
    }
    
    private func insertUserInfo(id: String) {
        let newUser = User(id: id,
                           name: name,
                           email: email,
                           birthDate: dateOfBirth.timeIntervalSince1970,
                           joinned: Date().timeIntervalSince1970)
        
        serviceAdapter.uploadUserToCloud(user: newUser) { result in
            switch result {
            case .success:
                self.displayMessage("Register Succesfull")
            case .failure(let error):
                self.displayMessage("We had a problem in the Register process. Try later \(error.localizedDescription)")
            }
        }
    }
    
    private func validation() -> Bool{
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            DispatchQueue.main.async {
                self.displayMessage("Please fill in all fields")
            }
            return false
        }
        
        guard password.count >= 8 else {
            DispatchQueue.main.async {
                self.displayMessage("Password must have atleast 8 characters")
            }
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            DispatchQueue.main.async {
                self.displayMessage("Invalid Email")
            }
            return false
        }
        
        guard user.calculateAge(from: dateOfBirth) >= 14 else {
            DispatchQueue.main.async {
                self.displayMessage("You must be at least 14 years old to register")
            }
            return false
        }
        
        
        guard user.calculateAge(from: dateOfBirth) <= 120 else {
            DispatchQueue.main.async {
                self.displayMessage("please isnert a valid date")
            }
            return false
        }
        
        return true
    }
    
    func displayMessage(_ message: String) {
        alertMessage = message
        showAlert = true
    }
}
