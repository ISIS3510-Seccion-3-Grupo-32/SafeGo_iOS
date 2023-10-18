//
//  RegisterView.swift
//  SafeGo
//
//  Created by Juan Martin Santos Ayala on 21/09/23.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(Color(hex: 0x96CEB4))
                    .offset(y:40)
                
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
                    
                    DatePicker("Birth Date", selection: $viewModel.dateOfBirt, displayedComponents: [.date])
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    
                    ButtonFactory.createButton(title: "Register") {
                        viewModel.register()
                    }
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


struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
