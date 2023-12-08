//
//  NoConnectionView.swift
//  SafeGo
//
//  Created by Juan Martin Santos Ayala on 6/12/23.
//

import SwiftUI

struct NoConnectionView: View {
    var body: some View {
        VStack {
            Image(systemName: "wifi.slash")
                .font(.system(size: 60))
                .foregroundColor(.red)
                .padding()

            Text("No Internet Connection")
                .font(.headline)
                .foregroundColor(.red)

            Text("Please check your connection.")
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding()
        }
        .padding()
    }
}

struct NoConnectionView_Previews: PreviewProvider {
    static var previews: some View {
        NoConnectionView()
    }
}

