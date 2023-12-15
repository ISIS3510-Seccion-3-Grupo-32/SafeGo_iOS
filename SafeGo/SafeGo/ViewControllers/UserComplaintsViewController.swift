//
//  UserComplaintsViewController.swift
//  SafeGo
//
//  Created by Juan Felipe on 6/11/23.
//

import Foundation
import Firebase

class UserComplaintsViewController: ObservableObject {
    
    @Published var alertMessage: String = ""
    @Published var showAlert = false
    @Published var disablebutton = false
    let serviceAdapter: ServiceAdapter
    let locationManager = LocationModel()
    
    init(serviceAdapter: ServiceAdapter) {
        self.serviceAdapter = serviceAdapter
    }
    
    func logOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
    }
    
    func getClosestReport() {
        self.disablebutton = true
        guard let latitude = locationManager.userLocation?.coordinate.latitude,
              let longitude = locationManager.userLocation?.coordinate.longitude else {
            // Handle the case when user location is not available
            self.alertMessage = "Unable to obtain your current location."
            self.showAlert = true
            self.disablebutton = false
            return
        }

        serviceAdapter.getTheClosestReport(latitude: latitude, longitude: longitude) { distance, error in
            DispatchQueue.main.async {
                if error != nil {
                    self.alertMessage = "There is no connection in this momment, try later :D"
                } else if let distance = distance {
                    self.alertMessage = "The last report was \(distance) km away from you. Be careful!"
                }
                self.showAlert = true
                self.disablebutton = false
            }
        }
    }
}
