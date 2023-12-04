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
    func calculateAge(from date: Date) -> Int {
        let calendar = Calendar.current
        let currentDate = Date()
        let birthDate = date
        let ageComponents = calendar.dateComponents([.year], from: birthDate, to: currentDate)
        let age = ageComponents.year ?? 0
        return age
    }
    
    func setTimeStamp() {
        let timestamp = Date().timeIntervalSince1970
        UserDefaults.standard.set(timestamp, forKey: "LastFormShown")
    }
    
    func calculateMOnths() -> Bool{
        let timestamp = Date().timeIntervalSince1970
        let lastTime = UserDefaults.standard.integer(forKey: "LastFormShown")
        
        if (Int(timestamp) - lastTime >= 5259600 ) {
            return Bool.random()
        }
        return false
    }
}
