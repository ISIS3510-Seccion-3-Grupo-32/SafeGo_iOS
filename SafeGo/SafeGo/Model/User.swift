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
    
    let queue = OperationQueue()
    
    func setTimeStamp() {
        queue.addOperation {
            let timestamp = Date().timeIntervalSince1970
            UserDefaults.standard.set(timestamp, forKey: "LastFormShown")
        }
    }
        
    func calculateMOnths(completion: @escaping (Bool) -> Void) {
        DispatchQueue.global(qos: .background).async {
            let timestamp = Date().timeIntervalSince1970
            let lastTime = UserDefaults.standard.integer(forKey: "LastFormShown")
            
            let result = (Int(timestamp) - lastTime >= 5259600)
            
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
}
