//
//  MapViewViewModel.swift
//  SafeGo
//
//  Created by Gabriela Paez on 9/23/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class MapViewController: ObservableObject
{
    func logOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print (error)
        }
    }
}
