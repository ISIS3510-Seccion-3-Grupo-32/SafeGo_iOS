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
        Form {
            Section(header: Text("Safe Navigation")) {
                Picker("Most Used Device", selection: $controller.preferences.deviceForSafeNavigation) {
                    ForEach(controller.devices, id: \.self) { device in
                        Text(device).tag(device)
                    }
                }
            }

            Section(header: Text("Report a Crime")) {
                Picker("Most Used Device", selection: $controller.preferences.deviceForReportCrime) {
                    ForEach(controller.devices, id: \.self) { device in
                        Text(device).tag(device)
                    }
                }
            }

            Section(header: Text("Login")) {
                Picker("Most Used Device", selection: $controller.preferences.deviceForLogin) {
                    ForEach(controller.devices, id: \.self) { device in
                        Text(device).tag(device)
                    }
                }
            }

            Section(header: Text("Send a Suggestion")) {
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
        .padding()
        .navigationTitle("User Preferences")
    }
}

struct UserForm_Previews: PreviewProvider {
    static var previews: some View {
        UserForm()
    }
}
