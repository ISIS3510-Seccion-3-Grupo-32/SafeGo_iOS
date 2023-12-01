//
//  UserFormViewControler.swift
//  SafeGo
//
//  Created by Juan Martin Santos Ayala on 30/11/23.
//

import Foundation

class UserFormController: ObservableObject {
    @Published var preferences = UserPreferences()
    let devices = ["Apple Watch", "Headphones", "Mobile Phone", "iPad"]

    func submitForm() {
        // Enviar la informacion al back
        // Redirigir al homeView
    }
}
