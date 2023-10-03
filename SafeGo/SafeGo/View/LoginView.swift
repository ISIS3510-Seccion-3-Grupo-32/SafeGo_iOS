//
//  LoginView.swift
//  SafeGo
//
//  Created by Juan Martin Santos Ayala on 21/09/23.
//

import SwiftUI
import UIKit

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .foregroundColor(Color(hex: 0x96CEB4))
                        .offset(y:40)
                    
                    VStack {
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()

                        Text("Welcome to SafeGo")
                            .font(Font.custom("DM Sans", size: 30))
                            .foregroundColor(.white)
                            .bold()
                            .padding(.bottom, 10)
                            .frame(width: UIScreen.main.bounds.width - 40,
                                   alignment: .leading)
                        Text("Login before starting your trip")
                            .font(Font.custom("DM Sans", size: 17))
                            .foregroundColor(.white)
                            .bold()
                            .frame(width: UIScreen.main.bounds.width - 40,
                                   alignment: .leading)
                        
                        Spacer()
                        Spacer()
                        Spacer()
                        
                        if !viewModel.errorMessage.isEmpty {
                            Text(viewModel.errorMessage)
                                .foregroundColor(Color.red)
                        }
                        
                        // Login Form
                        TextField("Username", text: $viewModel.username)
                            .padding()
                            .frame(height: UIScreen.main.bounds.height / 15)
                            .background(Color.white)
                            .cornerRadius(10)
                            .autocapitalization(.words)
                        SecureField("Password", text: $viewModel.password)
                            .padding()
                            .frame(height: UIScreen.main.bounds.height / 15)
                            .background(Color.white)
                            .cornerRadius(10)
                            .autocorrectionDisabled()
                            .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        SGButtonLR(title: "Login"){
                            viewModel.login()
                        }
                            
                        Spacer()
                        
                        // Register Now
                        HStack(alignment: .center) {
                            Text("Don't have an account?")
                                .foregroundColor(.white)
                            NavigationLink("Register Now", destination: RegisterView())
                        }
                        .padding()
                    }
                    .padding()
                }
                .frame(width: UIScreen.main.bounds.width,
                       height: UIScreen.main.bounds.height / 1.9)
            }
            .background(
                Image("Map")
                    .resizable()
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .frame(width: UIScreen.main.bounds.width * 1.2,
                           height: UIScreen.main.bounds.height * 1.2)
                    .blur(radius: 1.8)
            )
            
        }
    }
}

extension Color {
    init(hex: UInt){
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255.0,
            green: Double((hex >> 8) & 0xFF) / 255.0,
            blue: Double(hex & 0xFF) / 255.0,
            opacity: 1
        )
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
