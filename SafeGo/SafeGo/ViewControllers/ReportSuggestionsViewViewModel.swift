//
//  ReportSuggestionsViewViewModel.swift
//  SafeGo
//
//  Created by Juan Felipe on 1/11/23.
//

import SwiftUI

class ReportSuggestionsViewController: ObservableObject {
    @Published var alertMessage = ""
    @Published var showAlert = false

    let serviceAdapter: ServiceAdapter

    init(serviceAdapter: ServiceAdapter) {
        self.serviceAdapter = serviceAdapter
    }

    func sendDescription(_ description: String) {
        serviceAdapter.uploadToCloudSuggestions(description: description) { result in
            switch result {
            case .success:
                self.displayMessage("Report sent")
            case .failure(let error):
                self.displayMessage("Report could not be sent: \(error.localizedDescription)")
            }
        }
    }
    
    func displayMessage(_ message: String) {
        alertMessage = message
        showAlert = true
    }
}
