//
//  Location.swift
//  SafeGo
//
//  Created by Juan Martin Santos Ayala on 11/11/23.
//

import Foundation
import CoreLocation

class LocationModel: NSObject, ObservableObject {
    private var manager = CLLocationManager()
    @Published var userLocation: CLLocation?
    static let shared = LocationModel()
    
    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.startUpdatingLocation()
    }
    
    func requestLocation() {
        manager.requestWhenInUseAuthorization()
    }
}

extension LocationModel: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .notDetermined:
            print("DEBUG: Not determined")
        case .restricted:
            print("DEBUG: Restricted")
        case .denied:
            print("DEBUG: Denied")
        case .authorizedAlways:
            print("DEBUG: Auth Always")
        case .authorizedWhenInUse:
            print("DEBUG: Auth when in use ")
        @unknown default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.userLocation = location
    }
}
