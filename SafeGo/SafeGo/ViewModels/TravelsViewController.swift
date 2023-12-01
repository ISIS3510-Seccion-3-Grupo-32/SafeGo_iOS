//
//  TravelsViewViewModel.swift
//  SafeGo
//
//  Created by Juan Felipe on 23/09/23.
//

import Foundation
import FirebaseFirestore
import SwiftUI
import FirebaseAuth

class TravelsViewController: ObservableObject 
{
    @Published var travel1 = ""
    @Published var travel2 = ""
    @Published var travel3 = ""
    @Published var travel4 = ""
    
    private var db = Firestore.firestore()
    
    func fetchData() {
        db.collection("directions")
            .order(by: "timestamp", descending: true) 
            .limit(to: 4)
            .getDocuments { (querySnapshot, error) in
                if let error = error {
                    print("Error getting documents: \(error)")
                } else {
                    var index = 1
                    for document in querySnapshot?.documents ?? [] {
                        let data = document.data()
                        if let directions = data["directions"] as? String {
                            switch index {
                            case 1:
                                self.travel1 = directions
                            case 2:
                                self.travel2 = directions
                            case 3:
                                self.travel3 = directions
                            case 4:
                                self.travel4 = directions
                            default:
                                break
                            }
                            index += 1
                        }
                    }
                }
            }
    }

    
    init () {}
    
    func logOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print (error)
        }
    }
}

