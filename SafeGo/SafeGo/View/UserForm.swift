//
//  UserForm.swift
//  SafeGo
//
//  Created by Juan Martin Santos Ayala on 30/11/23.
//

import SwiftUI

struct UserForm: View {
    @ObservedObject var controller = UserFormController()

    var body: some View {
        VStack{
            
            Text("USER'S FORM")
                .font(.title) // You can adjust the size based on your preference
                .bold()
                .padding()

            Text("Which are the devices that you use the most for the followig funcitnalities?").padding()
            Form {
                Section(header: Text("Safe Navigation").bold()) {
                    Picker("Most Used Device", selection: $controller.preferences.deviceForSafeNavigation) {
                        ForEach(controller.devices, id: \.self) { device in
                            Text(device).tag(device)
                        }
                    }
                }

                Section(header: Text("Report a Crime").bold()) {
                    Picker("Most Used Device", selection: $controller.preferences.deviceForReportCrime) {
                        ForEach(controller.devices, id: \.self) { device in
                            Text(device).tag(device)
                        }
                    }
                }

                Section(header: Text("Login").bold()) {
                    Picker("Most Used Device", selection: $controller.preferences.deviceForLogin) {
                        ForEach(controller.devices, id: \.self) { device in
                            Text(device).tag(device)
                        }
                    }
                }

                Section(header: Text("Send a Suggestion").bold()) {
                    Picker("Most Used Device", selection: $controller.preferences.deviceForSuggestion) {
                        ForEach(controller.devices, id: \.self) { device in
                            Text(device).tag(device)
                        }
                    }
                }

                Section {
                    Button(action: {
                        self.controller.submitForm()
                    }) {
                        Text("Submit")
                    }
                }
            }
            .scrollContentBackground(.hidden)
            .navigationTitle("User Preferences")
        }
        .background(Color(hex: 0x96CEB4))
    }
}

struct UserForm_Previews: PreviewProvider {
    static var previews: some View {
        UserForm()
    }
}
