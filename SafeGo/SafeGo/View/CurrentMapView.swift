//
//  CurrentMapView.swift
//  SafeGo
//
//  Created by Gabriela on 10/13/23.
//


import SwiftUI
import MapKit

struct CurrentMapView: View {
    @ObservedObject var locationManager: LocationModel = LocationModel.shared
    @State private var cameraPosition: MapCameraPosition = .region(.userRegion)
    var body: some View {
        HStack {
            Map(position: $cameraPosition){
                UserAnnotation()
            }
                .edgesIgnoringSafeArea(.all)
                .mapControls{
                    MapCompass()
                    MapUserLocationButton()
                }
        }
    }
}

extension CLLocationCoordinate2D {
    static var userLocation: CLLocationCoordinate2D {
        return .init(latitude: 4.6767, longitude: -74.0483)
    }
}

extension MKCoordinateRegion {
    static var userRegion: MKCoordinateRegion {
        return .init(center: .userLocation,
                     latitudinalMeters: 10000,
                     longitudinalMeters: 1000)
    }
}
// Preview
#Preview
{
    CurrentMapView()
}
