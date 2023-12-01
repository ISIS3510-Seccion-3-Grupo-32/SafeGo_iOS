//
//  changeAddressesViewController.swift
//  SafeGo
//
//  Created by Gabriela on 11/6/23.
//

import SwiftUI

class ChangeAddressesViewController: ObservableObject {
    @Published var selectedIcon: String = "house"
    @Published var whereTo: String = ""
    @State private var alertMessage = ""
    
    @Published var savedAddresses: [String: String] = [:]

    init() 
    {
            if let savedAddresses = UserDefaults.standard.dictionary(forKey: "savedAddressesChange") as? [String: String] 
        {
                self.savedAddresses = savedAddresses
        }
    }

    func getAddressForSelectedIcon(_ iconName: String) -> String? {
        return savedAddresses[iconName]
    }

    func toggleButtonSelection(_ iconName: String) {
        selectedIcon = iconName
    }

    func saveAddressForSelectedIcon() {
        if selectedIcon.isEmpty {
            // If no icon is chosen, set the alert message
            alertMessage = "No icon selected. Please choose an icon to save the address."
            return
        }

        // Save the address for the selected icon
        savedAddresses[selectedIcon] = whereTo
        UserDefaults.standard.set(savedAddresses, forKey: "savedAddressesChange")
    }
}
