//
//  travelingView.swift
//  SafeGo
//
//  Created by Gabriela on 11/2/23.
//

import SwiftUI
import MapKit
import CoreLocation

struct travelingView: View {    
    
    var body: some View {
        
        VStack{
            
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
            
        }
        
        
    }
}



#Preview {
    travelingView()
}
