//
//  ReportCrimeViewViewModel.swift
//  SafeGo
//
//  Created by Gabriela on 10/12/23.
//

import SwiftUI
import FirebaseFirestore


// Idea originally taken from https://www.youtube.com/watch?v=7VjkVAreYeg but then noticed that the connection was to firestore and not firedatabase

class ReportCrimeViewViewModel: ObservableObject {
    @Published var writeaDescription = ""
    
    private let db = Firestore.firestore()
    
    // Use your Firestore collection path
    private let collectionReference = "CrimeReports"

    func uploadToCloud() {
        let data = ["description": writeaDescription]
        
        db.collection(collectionReference).addDocument(data: data) { error in
            if let error = error {
                print("Your report could not be loaded at this time: \(error)")
            } else {
                print("Your report was sent correctly")
            }
        }
    }
}

