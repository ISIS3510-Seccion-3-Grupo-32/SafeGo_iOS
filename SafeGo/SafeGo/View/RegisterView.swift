//
//  RegisterView.swift
//  SafeGo
//
//  Created by Juan Martin Santos Ayala on 21/09/23.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewController()
    var body: some View {
        VStack {
            ZStack {
                            
                VStack {
                    
                    Spacer()
                    
                    Text("Register")
                        .font(Font.custom("DM Sans", size: 30))
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width - 40,
                               alignment: .leading)
                        .bold()
                    
                    
                    TextField("Full name", text: $viewModel.name)
                        .padding()
                        .frame(height: UIScreen.main.bounds.height / 15)
                        .background(Color.white)
                        .cornerRadius(10)
                        .onChange(of: viewModel.name) {
                            if viewModel.name.count > 32 {
                                viewModel.name = String(viewModel.name.prefix(32))
                            }
                        }
                    
                    SecureField("Password", text: $viewModel.password)
                        .padding()
                        .frame(height: UIScreen.main.bounds.height / 15)
                        .background(Color.white)
                        .cornerRadius(10)
                        .onChange(of: viewModel.password) {
                            if viewModel.password.count > 32 {
                                viewModel.password = String(viewModel.password.prefix(32))
                            }
                        }
                    TextField("Email", text: $viewModel.email)
                        .padding()
                        .frame(height: UIScreen.main.bounds.height / 15)
                        .background(Color.white)
                        .cornerRadius(10)
                        .onChange(of: viewModel.email) {
                            if viewModel.email.count > 40 {
                                viewModel.email = String(viewModel.email.prefix(40))
                            }
                        }
                    
                    DatePicker("Birth Date", selection: $viewModel.dateOfBirth,
                               in: ...Date(),
                               displayedComponents: [.date])
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    
                    
                    Spacer()

                    
                    ButtonFactory.createButton(title: "Register") {
                        viewModel.register()
                    }.alert(isPresented: $viewModel.showAlert) {
                        Alert(title: Text("Error"), message: Text(viewModel.validationError), dismissButton: .default(Text("Ok")))
                    }
                    
                    Spacer()

                }
                .padding()
                
            }

        }
        .background(Color(hex: 0x96CEB4))

    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
