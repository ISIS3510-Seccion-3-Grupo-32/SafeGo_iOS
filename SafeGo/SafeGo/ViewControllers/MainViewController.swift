//
//  MainViewViewModel.swift
//  SafeGo
//
//  Created by Juan Martin Santos Ayala on 21/09/23.
//

import FirebaseAuth
import Foundation

class MainViewController: ObservableObject {
    private let userModel = UserModel()
    @Published var showForms: Bool = false
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init(){
        self.handler = Auth.auth().addStateDidChangeListener { [weak self]_, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn: Bool {
        Auth.auth().currentUser != nil
        
    }
    
    func setUserFormTimeStamp() {
        DispatchQueue.main.async {
            self.userModel.setTimeStamp()
        }
    }
    
    func calculateIfIsTime() {
        userModel.calculateMOnths { result in
            DispatchQueue.main.async {
                self.showForms = result
            }
        }
    }
}
