//
//  ReportBugViewViewModel.swift
//  SafeGo
//
//  Created by Gabriela on 10/30/23.
//

import SwiftUI

class ReportBugViewController: ObservableObject {
    @Published var alertMessage = ""
    @Published var showAlert = false

    let serviceAdapter: ServiceAdapter

    init(serviceAdapter: ServiceAdapter) {
        self.serviceAdapter = serviceAdapter
    }

    func sendDescription(_ description: String) {
        serviceAdapter.uploadToCloudBugs(description: description) { result in
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


