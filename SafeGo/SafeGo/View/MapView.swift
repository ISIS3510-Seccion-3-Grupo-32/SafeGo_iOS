//
//  ContentView.swift
//  SafeGo
//
//  Created by Gabriela on 10/12/23.
//


import SwiftUI
import MapKit
import CoreLocation

struct MapView: View {
    @State private var region: MKCoordinateRegion = .userRegion
    @StateObject var viewModel = MapViewController()
    
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
                    
                    Marker ("Work", systemImage: "briefcase", coordinate: .workLocation )
                        .tint(.brown)
                    
                    Marker ("Home", systemImage: "home", coordinate: .homeLocation )
                        .tint(.green)
                    
                    Marker ("Home", systemImage: "heart", coordinate: .partnerLocation )
                        .tint(.red)
                    
                    Marker ("Education", systemImage: "cap", coordinate: .educationLocation )
                        .tint(.black)
                
                }//Shows the users location
                
                // Log Out
                VStack
                {
                    HStack(alignment: .center)
                    {
                        ZStack 
                        {
                            NavigationLink(
                                destination: LoginView(),
                                label: {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundColor(Color(hex: 0xCFF2E5))
                                        .frame(width: 200, height: 40)
                                        .overlay(
                                            Text("Log Out")
                                                .foregroundColor(.primary)
                                        )
                                    
                                        .onTapGesture {
                                            viewModel.logOut()
                                        }
                                }
                            )

                        }
                        
                        Spacer()
                        
                        ZStack
                        {
                            NavigationLink(
                                destination: HomeView(),
                                label: {
                                    RoundedRectangle(cornerRadius: 10) // Adjust the corner radius and other properties as needed
                                        .foregroundColor(Color(hex: 0xCFF2E5))
                                        .frame(width: 200, height: 40) // Adjust the width and height as needed
                                        .overlay(
                                            Text("Home")
                                                .foregroundColor(.primary)
                                        )
                                }
                            )
                        }
                    }
                    HStack(alignment: .center)
                    {
                        ZStack
                        {
                            NavigationLink(
                                destination: ReportCrimeView(),
                                label: {
                                    RoundedRectangle(cornerRadius: 10) // Adjust the corner radius and other properties as needed
                                        .foregroundColor(Color(hex: 0xCFF2E5))
                                        .frame(width: 200, height: 40) // Adjust the width and height as needed
                                        .overlay(
                                            Text("Report a Crime")
                                                .foregroundColor(.primary)
                                        )
                                }
                            )
                        }
                        
                        Spacer()
                        
                    }
                        
                        
                    }
                }
                .padding()
                
            }
        }
        
    }





//"CLLocationCoordinate2D is a struct in the Core Location framework (imported as CoreLocation in Swift) used to represent a geographical coordinate."
extension CLLocationCoordinate2D {
    static var userLocation: CLLocationCoordinate2D 
    {
        return .init(latitude: 4.602706, longitude: -74.065953) // This defines the user's location, which in this case in Bogota,  as a CLLocationCoordinate2D.
    }
    
    static var workLocation: CLLocationCoordinate2D
    {
        return .init(latitude: 4.6815, longitude: -74.0443) // This defines the user's location, which in this case in Bogota,  as a CLLocationCoordinate2D.
    }
    
    static var homeLocation: CLLocationCoordinate2D
    {
        return .init(latitude: 4.8116, longitude: -74.0305) // This defines the user's location, which in this case in Bogota,  as a CLLocationCoordinate2D.
    }
    
    static var partnerLocation: CLLocationCoordinate2D
    {
        return .init(latitude: 4.6767, longitude: -74.0483) // This defines the user's location, which in this case in Bogota,  as a CLLocationCoordinate2D.
    }
    
    static var educationLocation: CLLocationCoordinate2D
    {
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
