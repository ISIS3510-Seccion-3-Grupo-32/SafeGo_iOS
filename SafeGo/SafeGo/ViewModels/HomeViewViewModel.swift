//
//  HomeViewViewModel.swift
//  SafeGo
//
//  Created by Pipe on 22/09/23.
//

import FirebaseAuth
import Foundation
import FirebaseFirestore
import CoreLocation

class HomeViewViewModel: ObservableObject {
    @Published var whereto = ""
    @Published var dateSelect = Date()
    @Published var longitud = ""
    @Published var latitude = ""
    @Published var coordinate = ""
    @Published var showAlert = false
    @Published var alertMessage = ""
    
    private let db = Firestore.firestore()
    private let collectionReference = "directions"
    
    init () {}
    
    
    func logOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print (error)
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
                "Longitude": location.coordinate.longitude,
                "Latitude": location.coordinate.latitude
            ]
            
            let db = Firestore.firestore()
            db.collection(self.collectionReference).addDocument(data: data) { error in
                if error != nil {
                    self.alertMessage = "Address not found"
                } else {
                    self.alertMessage = "Ready for your trip"
                }
            }
        }
    }
}
