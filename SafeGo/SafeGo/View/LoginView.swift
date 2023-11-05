//
//  LoginView.swift
//  SafeGo
//
//  Created by Juan Martin Santos Ayala on 21/09/23.
//

import SwiftUI
import UIKit

struct LoginView: View {
    @StateObject var viewModel = LoginViewController()
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                ZStack {
                    
                    VStack {
                        
                        Text("Welcome to SafeGo")
                            .font(Font.custom("DM Sans", size: 30))
                            .foregroundColor(.white)
                            .bold()
                            .padding(.bottom, 10)
                            .frame(width: UIScreen.main.bounds.width - 40,
                                   alignment: .leading)
                        Text("Login before you start your trip")
                            .font(Font.custom("DM Sans", size: 17))
                            .foregroundColor(.white)
                            .bold()
                            .frame(width: UIScreen.main.bounds.width - 40,
                                   alignment: .leading)
                        
                        Spacer()
                        Spacer()
                        Spacer()
                        
                        // Login Form
                        TextField("Email", text: $viewModel.username)
                            .padding()
                            .frame(height: UIScreen.main.bounds.height / 15)
                            .background(Color.white)
                            .cornerRadius(10)
                            .autocapitalization(.none)
                            .onChange(of: viewModel.username) {
                                if viewModel.username.count > 35 {
                                    viewModel.username = String(viewModel.username.prefix(40))
                                }
                            }
                        
                        SecureField("Password", text: $viewModel.password)
                            .padding()
                            .frame(height: UIScreen.main.bounds.height / 15)
                            .background(Color.white)
                            .cornerRadius(10)
                            .autocorrectionDisabled()
                            .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                            .onChange(of: viewModel.password) {
                                if viewModel.password.count > 30 {
                                    viewModel.password = String(viewModel.password.prefix(32))
                                }
                            }
                        
                        ButtonFactory.createButton(title: "Login")
                        {
                            viewModel.login()
                        }.alert(isPresented: $viewModel.showAlert) {
                            Alert(title: Text("Error"), message: Text(viewModel.validationError), dismissButton: .default(Text("Ok")))
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
            .background(Color(hex: 0x96CEB4))
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
