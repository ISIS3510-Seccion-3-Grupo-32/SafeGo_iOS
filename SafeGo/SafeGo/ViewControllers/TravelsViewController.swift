//
//  TravelsViewViewModel.swift
//  SafeGo
//
//  Created by Juan Felipe on 23/09/23.
//
import Foundation
import FirebaseFirestore
import FirebaseAuth

class TravelsViewController: ObservableObject
{
    @Published var travel1 = ""
    @Published var travel2 = ""
    @Published var travel3 = ""
    @Published var travel4 = ""
    
    private var db = Firestore.firestore()
    
    func fetchData(forUser userId: String) {
        
        if let currentUser = Auth.auth().currentUser
        {
            db.collection("HistoryTravels")
                .whereField("User", isEqualTo: currentUser.uid)
                .order(by: "timestamp", descending: true)
                .limit(to: 4)
                .getDocuments { (querySnapshot, error) in
                    if let error = error
                    {
                        print("Error getting documents: \(error)")
                    } else
                    {
                        var index = 1
                        for document in querySnapshot?.documents ?? []
                        {
                            let data = document.data()
                            if let Address = data["Address"] as? String {
                                switch index {
                                case 1:
                                    self.travel1 = Address
                                case 2:
                                    self.travel2 = Address
                                case 3:
                                    self.travel3 = Address
                                case 4:
                                    self.travel4 = Address
                                default:
                                    break
                                }
                                index += 1
                            }
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
