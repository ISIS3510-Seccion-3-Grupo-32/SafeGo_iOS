//
//  LocationRequestView.swift
//  SafeGo
//
//  Created by Juan Martin Santos Ayala on 14/11/23.
//

import SwiftUI

struct LocationRequestView: View {
    var body: some View {
        VStack {
            Text("Request Location From User")
            
            Button(action: {
                LocationModel.shared.requestLocation()
            }) {
                Text("Allow Location")
                    .padding()
                    .font(.headline)
                    .foregroundColor(.white)
            }
            .frame(width: UIScreen.main.bounds.width)
            .padding(.horizontal, -32)
            .background(Color(.systemBlue))
            .clipShape(Capsule())
            .padding()
        }
    }
}

#if DEBUG
struct LocationRequestView_Previews: PreviewProvider {
    static var previews: some View {
        LocationRequestView()
    }
}
#endif

