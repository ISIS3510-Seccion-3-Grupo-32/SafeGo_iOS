//
//  UserForm.swift
//  SafeGo
//
//  Created by Juan Martin Santos Ayala on 30/11/23.
//

import SwiftUI

struct UserForm: View {
    @ObservedObject var viewController = UserFormController(serviceApadter: ServiceAdapter())
    @StateObject private var connectivityViewModel = ConnectivityViewModel()
    @StateObject var connectivityViewController = ConnectivityViewController()
    
    var onSubmit: () -> Void

    var body: some View {
        Group {
            if connectivityViewModel.isConnected {
                VStack{
                    Text("USER'S FORM")
                        .font(.title) // You can adjust the size based on your preference
                        .bold()
                        .padding()

                    Text("Which are the devices that you use the most for the followig functionalities?").padding()
                    Form {
                        Section(header: Text("Safe Navigation").bold()) {
                            Picker("Most Used Device", selection: $viewController.preferences.deviceForSafeNavigation) {
                                ForEach(viewController.devices, id: \.self) { device in
                                    Text(device).tag(device)
                                }
                            }
                        }

                        Section(header: Text("Report a Crime").bold()) {
                            Picker("Most Used Device", selection: $viewController.preferences.deviceForReportCrime) {
                                ForEach(viewController.devices, id: \.self) { device in
                                    Text(device).tag(device)
                                }
                            }
                        }

                        Section(header: Text("Login").bold()) {
                            Picker("Most Used Device", selection: $viewController.preferences.deviceForLogin) {
                                ForEach(viewController.devices, id: \.self) { device in
                                    Text(device).tag(device)
                                }
                            }
                        }

                        Section(header: Text("Send a Suggestion").bold()) {
                            Picker("Most Used Device", selection: $viewController.preferences.deviceForSuggestion) {
                                ForEach(viewController.devices, id: \.self) { device in
                                    Text(device).tag(device)
                                }
                            }
                        }

                        Section {
                            Button(action: {
                                viewController.submitForm()
                                onSubmit()
                            }) {
                                Text("Submit")
                            }
                        }
                    }
                    .scrollContentBackground(.hidden)
                    .navigationTitle("User Preferences")
                }
                .background(Color(hex: 0x96CEB4))
            } else {
                NoConnectionView()
            }
        }
        .onAppear {
            connectivityViewModel.isConnected = connectivityViewController.isConnectedToInternet()
        }
    }
}

struct UserForm_Previews: PreviewProvider {
    static var previews: some View {
        UserForm() {
            print("Informe enviado al back...")
        }
    }
}
