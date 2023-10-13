//
//  HomeViewViewModel.swift
//  SafeGo
//
//  Created by Pipe on 22/09/23.
//

import FirebaseAuth
import Foundation

class HomeViewViewModel: ObservableObject {
    @Published var whereto = ""
    @Published var dateSelect = Date()
    
    init () {}
    
    func logOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print (error)
        }
    }
}
