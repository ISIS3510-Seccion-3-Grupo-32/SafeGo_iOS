//
//  FormView.swift
//  SafeGo
//
//  Created by Juan Martin Santos Ayala on 21/09/23.
//

import SwiftUI

struct FormView: View {
    @State var username = ""
    @State var password = ""
    var body: some View {
        // Header
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .foregroundColor(Color(hex: 0x96CEB4))
                .offset(y:40)
            
            VStack {
                Text("Welcome to SafeGo")
                    .font(Font.custom("DM Sans", size: 30))
                    .foregroundColor(.white)
                    .bold()
                    .padding(.bottom, 10)
                Text("Login before starting your trip")
                    .font(Font.custom("DM Sans", size: 17))
                    .foregroundColor(.white)
                    .bold()
                
                // Login Form
                Form {
                    TextField("Username", text: $username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button {
                        
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.white)
                            
                            Text("login")
                                .foregroundColor(.black)
                                .bold()
                        }
                    }
                    .padding()
                    
                }
                
                // Register Now
                HStack {
                    Text("Don't have an account?")
                        .foregroundColor(.white)
                    NavigationLink("Register Now", destination: RegisterView())
                }
                .padding(.bottom, 20)
            }
        }
    }
}

extension Color {
    init(hex: UInt) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255.0,
            green: Double((hex >> 8) & 0xFF) / 255.0,
            blue: Double(hex & 0xFF) / 255.0,
            opacity: 1
        )
    }
}

#Preview {
    FormView()
}
