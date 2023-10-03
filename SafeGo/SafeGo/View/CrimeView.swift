//
//  SGButtonLR.swift
//  SafeGo
//
//  Created by Gabriela Paez on 30/09/23.
//

import SwiftUI

struct CrimeView: View {
    @State private var name = ""
    @State private var description = ""
    @State private var dangerLevel = 5
    @State private var isNavigationActive = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Crime Report")
                    .font(.largeTitle)
                    .foregroundColor(Color(hex: 0x96CEB4))
                
                VStack(alignment: .leading) {
                    Text("Name:")
                        .font(.headline)
                        .padding(.bottom, 4)
                    
                    TextField("", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom, 16)
                    
                    Text("Description:")
                        .font(.headline)
                        .padding(.bottom, 4)
                    
                    TextEditor(text: $description)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(height: 100)
                        .cornerRadius(10)
                        .padding(.bottom, 16)
                    
                    Text("Danger Level:")
                        .font(.headline)
                    Stepper(value: $dangerLevel, in: 1...10) {
                        Text("\(dangerLevel) \(dangerLevel == 1 ? "" : "")")
                            .font(.subheadline)
                    }
                    
                    NavigationLink(destination: TravelsView(), isActive: $isNavigationActive) {
                        EmptyView()
                    }
                    
                    Button(action: {
                        
                        isNavigationActive = true
                    }) {
                        Text("Report")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color(hex: 0x96CEB4)) // Set the background color
                            .cornerRadius(10)
                    }
                    .padding(.top, 16)
                }
                .padding()
            }
        }
    }
}

#Preview {
    CrimeView()
}
