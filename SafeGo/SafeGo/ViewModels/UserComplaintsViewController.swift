//
//  UserComplaintsViewController.swift
//  SafeGo
//
//  Created by Juan Felipe on 6/11/23.
//

import Foundation
import Firebase

class UserComplaintsViewController: ObservableObject {
    
    func logOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
    }
    
}
