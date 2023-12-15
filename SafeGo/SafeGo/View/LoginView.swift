//
//  LoginView.swift
//  SafeGo
//
//  Created by Juan Martin Santos Ayala on 21/09/23.
//

import SwiftUI
import UIKit

struct LoginView: View {
    @StateObject var viewController = LoginViewController()
    @StateObject private var connectivityViewModel = ConnectivityViewModel()
    @StateObject var connectivityViewController = ConnectivityViewController()
    
    var body: some View {
        Group {
            if connectivityViewModel.isConnected {
                NavigationView {
                    VStack {
                        Spacer()
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
                        Image("IconForApp")
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.main.bounds.width / 1.5)
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        TextField("Email", text: $viewController.username)
                            .padding()
                            .frame(width: UIScreen.main.bounds.width / 1.2,
                                   height: UIScreen.main.bounds.height / 15)
                            .background(Color.white)
                            .cornerRadius(10)
                            .autocapitalization(.none)
                            .onChange(of: viewController.username) {
                                if viewController.username.count > 35 {
                                    viewController.username = String(viewController.username.prefix(40))
                                }
                            }
                        
                        SecureField("Password", text: $viewController.password)
                            .padding()
                            .frame(width: UIScreen.main.bounds.width / 1.2, height: UIScreen.main.bounds.height / 15)
                            .background(Color.white)
                            .cornerRadius(10)
                            .autocorrectionDisabled()
                            .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                            .onChange(of: viewController.password) {
                                if viewController.password.count > 30 {
                                    viewController.password = String(viewController.password.prefix(32))
                                }
                            }
                        
                        ButtonFactory.createButton(title: "Login")
                        {
                            viewController.login()
                        }.alert(isPresented: $viewController.showAlert) {
                            Alert(title: Text("Error"), message: Text(viewController.validationError), dismissButton: .default(Text("Ok")))
                        }
                        .disabled($viewController.disablebutton.wrappedValue)
                        Spacer()
                        
                        // Register Now
                        HStack(alignment: .center) {
                            Text("Don't have an account?")
                                .foregroundColor(.white)
                            NavigationLink("Register Now", destination: RegisterView(viewController: RegisterViewController(serviceAdapter: ServiceAdapter())))
                        }
                        
                        Spacer()
                        
                    }
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
                    .background(Color(hex: 0x96CEB4))
                }
            } else {
                NoConnectionView()
            }
        }
        .onAppear {
            connectivityViewModel.isConnected = connectivityViewController.isConnectedToInternet()
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
