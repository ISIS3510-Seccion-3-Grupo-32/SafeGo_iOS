//
//  Popup.swift
//  SafeGo
//
//  Created by Gabriela Paez on 9/26/23.
//

import SwiftUI

struct Popup: View {
    @Binding var isPresented: Bool

    var body: some View {
        ZStack {
            Color.black.opacity(0.3).edgesIgnoringSafeArea(.all)
            
            // Pop-up window with centered text
            VStack {
                Rectangle()
                    .fill(Color.white)
                    .cornerRadius(20)
                    .padding()
                    .overlay(
                        VStack {
                            Text("Number of days passed, on average, between user-reported safety concerns")
                                .font(.title)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.black) // Set text color to black

                            Text("5")
                                .font(.title)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.black) // Set text color to black

                            Button("Close") {
                                withAnimation {
                                    isPresented.toggle()
                                }
                            }
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        }
                    )
            }
        }
        .opacity(isPresented ? 1 : 0)
    }
}









struct Popup_Preview: PreviewProvider {
    static var previews: some View {
        Popup(isPresented: .constant(true)) // You can change the initial value of isPresented as needed for your preview
    }
}
