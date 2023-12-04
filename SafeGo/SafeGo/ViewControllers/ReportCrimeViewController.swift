//
//  ReportCrimeViewViewModel.swift
//  SafeGo
//
//  Created by Gabriela on 10/12/23.
//

// Idea originally taken from https://www.youtube.com/watch?v=7VjkVAreYeg but then noticed that the connection was to firestore and not firedatabase

import SwiftUI

class ReportCrimesViewController: ObservableObject {
    @Published var alertMessage = ""
    @Published var showAlert = false

    let serviceAdapter: ServiceAdapter

    init(serviceAdapter: ServiceAdapter) {
        self.serviceAdapter = serviceAdapter
    }

    func sendDescription(_ description: String) {
        
        DispatchQueue.global(qos: .background).async{
            self.serviceAdapter.uploadToCloudCrimes(description: description) { result in
                switch result {
                case .success:
                    self.displayMessage("Report sent")
                case .failure(let error):
                    self.displayMessage("Report could not be sent: \(error.localizedDescription)")
                }
            }
        }
        
        
    }

    func displayMessage(_ message: String) {
        alertMessage = message
        showAlert = true
    }
}


