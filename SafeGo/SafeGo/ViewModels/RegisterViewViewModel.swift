//
//  RegisterViewViewModel.swift
//  SafeGo
//
//  Created by Juan Martin Santos Ayala on 21/09/23.
//

import Foundation

class RegisterViewViewModel: ObservableObject {
    @Published var name = ""
    @Published var password = ""
    @Published var email = ""
    @Published var dateOfBirt = ""
    
    init() {}

    func register(){
        
    }
}
