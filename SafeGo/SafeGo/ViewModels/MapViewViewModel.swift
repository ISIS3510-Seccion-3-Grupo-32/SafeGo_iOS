//
//  MapViewViewModel.swift
//  SafeGo
//
//  Created by Gabriela Paez on 9/23/23.
//

import SwiftUI

import Foundation

import FirebaseAuth

import FirebaseFirestore

class MapViewViewModel: ObservableObject
{
    func logOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print (error)
        }
    }
}
