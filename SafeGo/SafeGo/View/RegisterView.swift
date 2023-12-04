//
//  RegisterView.swift
//  SafeGo
//
//  Created by Juan Martin Santos Ayala on 21/09/23.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewController: RegisterViewController
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
                    
                    
                    TextField("Full name", text: $viewController.name)
                        .padding()
                        .frame(height: UIScreen.main.bounds.height / 15)
                        .background(Color.white)
                        .autocapitalization(.sentences)
                        .cornerRadius(10)
                        .onChange(of: viewController.name) {
                            if viewController.name.count > 32 {
                                viewController.name = String(viewController.name.prefix(32))
                            }
                        }
                    
                    SecureField("Password", text: $viewController.password)
                        .padding()
                        .frame(height: UIScreen.main.bounds.height / 15)
                        .background(Color.white)
                        .autocorrectionDisabled()
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        .cornerRadius(10)
                        .onChange(of: viewController.password) {
                            if viewController.password.count > 32 {
                                viewController.password = String(viewController.password.prefix(32))
                            }
                        }
                    TextField("Email", text: $viewController.email)
                        .padding()
                        .frame(height: UIScreen.main.bounds.height / 15)
                        .background(Color.white)
                        .autocorrectionDisabled()
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        .cornerRadius(10)
                        .onChange(of: viewController.email) {
                            if viewController.email.count > 40 {
                                viewController.email = String(viewController.email.prefix(40))
                            }
                        }
                    
                    DatePicker("Birth Date", selection: $viewController.dateOfBirth,
                               in: ...Date(),
                               displayedComponents: [.date])
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    
                    
                    Spacer()

                    
                    ButtonFactory.createButton(title: "Register") {
                        DispatchQueue.main.async {
                            viewController.register()
                        }
                    }
                    .alert(isPresented: $viewController.showAlert) {
                        Alert(title: Text("Register"), message: Text(viewController.alertMessage), dismissButton: .default(Text("Ok")))
                    }
                    .disabled($viewController.disablebutton.wrappedValue)
                    
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
        RegisterView(viewController: RegisterViewController(serviceAdapter: ServiceAdapter()))
    }
}
