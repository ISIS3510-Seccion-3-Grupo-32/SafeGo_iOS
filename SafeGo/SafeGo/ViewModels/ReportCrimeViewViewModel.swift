//
//  ReportCrimeViewViewModel.swift
//  SafeGo
//
//  Created by Gabriela on 10/12/23.
//

// Idea originally taken from https://www.youtube.com/watch?v=7VjkVAreYeg but then noticed that the connection was to firestore and not firedatabase

import SwiftUI
import FirebaseFirestore

class ReportCrimeViewViewModel: ObservableObject {
    @Published var writeaDescription = ""
    @Published var showAlert = false
    @Published var alertMessage = ""

    private let db = Firestore.firestore()
    private let collectionReference = "CrimeReports"

    func uploadToCloud() {
            let data = ["description": writeaDescription]
            
            db.collection(collectionReference).addDocument(data: data) { error in
                
                // taken from https://developer.apple.com/documentation/swiftui/alert
                if let error = error 
                {
                    self.alertMessage = "Report could not be sent"
                } else
                
                {
                    self.alertMessage = "Report sent"
                    self.writeaDescription = ""
                }
                self.showAlert = true
            }
        }
}


