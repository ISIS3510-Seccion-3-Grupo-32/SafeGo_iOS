//
//  SwiftUIView.swift
//  SafeGo
//
//  Created by Pipe on 2/11/23.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("isDarkMode") var isDarkMode: Bool = false
    @AppStorage("areNotificationsEnabled") var areNotificationsEnabled: Bool = true
    @State private var soundLevel: Double = 0.5
    @AppStorage("selectedLanguage") var selectedLanguage: String = "English"

    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: 0x96CEB4)
                    .ignoresSafeArea()

                VStack {
                    Spacer()
                    Section(header: Text("General Settings")) {
                        Toggle("Dark Mode", isOn: $isDarkMode)
                        Toggle("Notifications", isOn: $areNotificationsEnabled)
                    }
                    Spacer()
                    Spacer()

                    Section(header: Text("Sound")) {
                        Slider(value: $soundLevel, in: 0...1, step: 0.01)
                    }
                    
                    Spacer()
                    Spacer()

                    Section(header: Text("Language")) {
                        Picker("Language", selection: $selectedLanguage) {
                            Text("English").tag("English")
                            Text("Español").tag("Español")
                            Text("French").tag("French")
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    
                    Spacer()
                    Spacer()

                    Button("Save") {

                        UserDefaults.standard.set(isDarkMode, forKey: "isDarkMode")
                        UserDefaults.standard.set(areNotificationsEnabled, forKey: "areNotificationsEnabled")
                        UserDefaults.standard.set(soundLevel, forKey: "soundLevel")
                        UserDefaults.standard.set(selectedLanguage, forKey: "selectedLanguage")
                    }
                    .frame(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.height / 15)
                    .background(Color(hex: 0xCFF2E5))
                    .cornerRadius(10)
                    .foregroundColor(.black)
                    .font(.custom("DM Sans", size: UIScreen.main.bounds.height / 35)) // Missing closing parenthesis here
                    Spacer()
                    Spacer()
                }
                .navigationBarTitle("Settings")
            }
        }
        .onAppear {
            
            isDarkMode = UserDefaults.standard.bool(forKey: "isDarkMode")
            areNotificationsEnabled = UserDefaults.standard.bool(forKey: "areNotificationsEnabled")
            soundLevel = UserDefaults.standard.double(forKey: "soundLevel")
            selectedLanguage = UserDefaults.standard.string(forKey: "selectedLanguage") ?? "English"
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

