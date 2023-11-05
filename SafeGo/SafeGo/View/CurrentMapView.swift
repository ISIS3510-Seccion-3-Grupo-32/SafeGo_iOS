//
//  CurrentMapView.swift
//  SafeGo
//
//  Created by Gabriela on 10/13/23.
//


import SwiftUI
import MapKit

struct CurrentMapView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 4.6767, longitude: -74.0483), // Initial center, but it will be updated with the user's location
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )

    var body: some View {
        HStack {
            Map(coordinateRegion: $region, showsUserLocation: true)
                .onAppear {
                    // Center the map on the user's current location
                    if let userLocation = LocationManager.shared.userLocation {
                        region.center = userLocation
                    }
                }
            .edgesIgnoringSafeArea(.all)
        } // Make the map fill the entire screen
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            CurrentMapView()
                .navigationBarTitle("Map View")
        }
    }
}

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    static let shared = LocationManager()

    @Published var userLocation: CLLocationCoordinate2D?
    private var locationManager = CLLocationManager()

    private override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last?.coordinate {
            userLocation = location
        }
    }
}
// Preview
#Preview
{
    CurrentMapView()
}
