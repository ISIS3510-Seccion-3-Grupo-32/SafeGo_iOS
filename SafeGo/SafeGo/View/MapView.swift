//
//  ContentView.swift
//  SafeGo
//
//  Created by Gabriela on 10/12/23.
//

//
//  ContentView.swift
//  SafeGo
//
//  Created by Gabriela on 10/12/23.
//
import SwiftUI
import MapKit

struct MapView: View {
    @State private var region: MKCoordinateRegion = .userRegion
    
    var body: some View
    {
        
        VStack
        {
            Map
            {
                Marker ("My location", systemImage: "paperplane", coordinate: .userLocation)
                    .tint(.blue)
            
            }//Shows the users location
            
            // Register Now
            HStack(alignment: .center) {
                Text("Necesitas salirte")
                    .foregroundColor(.black)
                NavigationLink("Log Out", destination: LoginView())
            }
            .padding()
            
        }
    }

}

//"CLLocationCoordinate2D is a struct in the Core Location framework (imported as CoreLocation in Swift) used to represent a geographical coordinate."
extension CLLocationCoordinate2D {
    static var userLocation: CLLocationCoordinate2D {
        return .init(latitude: 4.6097, longitude: -74.0817) // This defines the user's location, which in this case in Bogota,  as a CLLocationCoordinate2D.
    }
}

extension MKCoordinateRegion {
    static var userRegion: MKCoordinateRegion {
        return .init(center: .userLocation, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    }
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
