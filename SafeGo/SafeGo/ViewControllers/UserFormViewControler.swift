//
//  UserFormViewControler.swift
//  SafeGo
//
//  Created by Juan Martin Santos Ayala on 30/11/23.
//

import Foundation

class UserFormController: ObservableObject {
    @Published var preferences = UserPreferences()
    
    let serviceAdapter: ServiceAdapter
    let devices = ["Apple Watch", "Headphones", "Mobile Phone", "iPad"]

    init(serviceApadter: ServiceAdapter) {
        self.serviceAdapter = serviceApadter
    }
    
    func submitForm() {
        let userPreferencesDictionary = userPreferencesAsDictionary()

        // Convert dictionary to JSON data
        if let jsonData = try? JSONSerialization.data(withJSONObject: userPreferencesDictionary, options: []) {
            // Convert JSON data to string
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                print("JSON Data: \(jsonString)")

                // Now you can send the jsonString to your backend or use it as needed
                serviceAdapter.uploadToAnalyticsForms(jsonString: jsonString) { result in
                    switch result {
                    case .success:
                        print("Upload successful")
                        // Handle success as needed
                    case .failure(let error):
                        print("Upload failed with error: \(error)")
                        // Handle failure as needed
                    }
                }
            }
        }
    }

    
    func userPreferencesAsDictionary() -> [String: String] {
        return [
            "deviceForSafeNavigation": preferences.deviceForSafeNavigation,
            "deviceForReportCrime": preferences.deviceForReportCrime,
            "deviceForLogin": preferences.deviceForLogin,
            "deviceForSuggestion": preferences.deviceForSuggestion
        ]
    }

}
