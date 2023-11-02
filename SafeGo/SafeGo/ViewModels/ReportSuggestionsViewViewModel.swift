//
//  ReportSuggestionsViewViewModel.swift
//  SafeGo
//
//  Created by Pipe on 1/11/23.
//

import SwiftUI
import FirebaseFirestore

class ReportSuggestionViewController: ObservableObject
{
    @Published var writeaDescription = ""
    @Published var showAlert = false
    @Published var alertMessage = ""

    private let db = Firestore.firestore()
    private let collectionReference = "suggReports"

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
