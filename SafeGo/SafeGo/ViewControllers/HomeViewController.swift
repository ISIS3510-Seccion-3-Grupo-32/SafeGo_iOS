//
//  HomeViewViewModel.swift
//  SafeGo
//
//  Created by Juan Felipe on 22/09/23.
//

import SwiftUI
import MapKit
import CoreLocation
import Firebase

class HomeViewController: ObservableObject {
    @Published var whereto = ""
    @Published var dateSelect = Date()
    @Published var longitude: Double = 0.0
    @Published var latitude: Double = 0.0
    @Published var showAlert = false
    @Published var alertMessage = ""
    @Published var destinationCoordinate: CLLocationCoordinate2D?
    @Published var savedAddresses: [String: String] = [:]
    @StateObject var changeAddressesController = ChangeAddressesViewController()

    

    private let db = Firestore.firestore()
    private let collectionReference = "directions"

    init() 
    {
        if let savedAddresses = UserDefaults.standard.dictionary(forKey: "savedAddressesChange") as? [String: String]
        {
            self.savedAddresses = savedAddresses
        }
    }

    func uploadToCloud() {
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(whereto) { (placemarks, error) in
            guard let placemarks = placemarks, let location = placemarks.first?.location else {
                self.alertMessage = "Address not found"
                return
            }

            let data: [String: Any] = [
                "Address": self.whereto,
                "Latitude": location.coordinate.latitude,
                "Longitude": location.coordinate.longitude
            ]

            let db = Firestore.firestore()
            db.collection(self.collectionReference).addDocument(data: data) { error in
                if error != nil {
                    self.alertMessage = "Address not found"
                } else {
                    self.alertMessage = "Ready for your trip"
                    self.destinationCoordinate = location.coordinate // Set the destination coordinate
                }
            }
        }
    }
    
    func uploadToCloudClicks()
    {
        
    }
    
    func getSavedAddress(icon: String) -> String? 
    {
           return changeAddressesController.savedAddresses[icon]
    }
}
