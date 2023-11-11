//
//  User.swift
//  SafeGo
//
//  Created by Juan Martin Santos Ayala on 21/09/23.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

struct User: Codable
{
    let id: String
    let name: String
    let email: String
    let birthDate: TimeInterval
    let joinned: TimeInterval
}

    	
class UserModel {
    func insertUser(user: User){
        let db = Firestore.firestore()
        db.collection("users")
            .document(user.id)
            .setData(user.asDictionary())
    }
    
    func calculateAge(from date: Date) -> Int {
        let calendar = Calendar.current
        let currentDate = Date()
        let birthDate = date
        let ageComponents = calendar.dateComponents([.year], from: birthDate, to: currentDate)
        let age = ageComponents.year ?? 0
        return age
    }
}
