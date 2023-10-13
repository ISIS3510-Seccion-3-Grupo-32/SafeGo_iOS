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
        NavigationView
        {
            VStack
            {
                Map
                {
                    Marker ("My location", systemImage: "paperplane", coordinate: .userLocation)
                        .tint(.blue)
                
                }//Shows the users location
                
                // Log Out
                HStack(alignment: .center) {
                    NavigationLink("Log Out", destination: LoginView())
                    
                    Spacer()
                    
                // Go to home view
                    NavigationLink("Home", destination: HomeView())
                    
                    Spacer()
                    
                    // Go to reportcrimeview view
                    NavigationLink("Report a crime", destination: ReportCrimeView())
                    
                }
                .padding()
                
            }
        }
        
    }

}

//"CLLocationCoordinate2D is a struct in the Core Location framework (imported as CoreLocation in Swift) used to represent a geographical coordinate."
extension CLLocationCoordinate2D {
    static var userLocation: CLLocationCoordinate2D {
        return .init(latitude: 4.602706, longitude: -74.065953) // This defines the user's location, which in this case in Bogota,  as a CLLocationCoordinate2D.
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
