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
    @State private var isSaveSuccessful = false
    @State private var isChangesFailed = false

    var body: some View {
        NavigationView {
                VStack {
                    HStack()
                    {
                        NavigationLink(destination: HomeView()
                            .navigationBarBackButtonHidden(true))
                        {
                            Image(systemName: "house.fill")
                                .foregroundColor(.black)
                                .font(.system(size: 40))
                        }
                        .navigationBarBackButtonHidden(true)
                        
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        NavigationLink(destination: UserComplaintsView()
                            .navigationBarBackButtonHidden(true))
                        {
                            Image(systemName: "line.horizontal.3")
                                .foregroundColor(.black)
                                .font(.system(size: 40))
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width / 1.2)
                    
                    
                    Spacer()
                    Section(header: Text("General Settings")
                        .font(.custom("DM Sans", size: UIScreen.main.bounds.height / 25))
                        .foregroundColor(.white)
                            
                    ) {
                        
                        Toggle("Dark Mode", isOn: $isDarkMode)
                            .font(.custom("DM Sans", size: UIScreen.main.bounds.height / 35))
                            .foregroundColor(.white)
                            .tint(.blue)

                        Toggle("Notifications", isOn: $areNotificationsEnabled)
                            .font(.custom("DM Sans", size: UIScreen.main.bounds.height / 35))
                            .foregroundColor(.white)
                            .tint(.blue)

                    }
                    .frame(width: UIScreen.main.bounds.width / 1.2)
                    Spacer()
                    Spacer()

                    Section(header: Text("Sound")
                        .font(.custom("DM Sans", size: UIScreen.main.bounds.height / 35))
                        .foregroundColor(.white)

                    ) {
                        Slider(value: $soundLevel, in: 0...1, step: 0.01)
                            .tint(.blue)
                    }
                    .frame(width: UIScreen.main.bounds.width / 1.2)
                    
                    Spacer()
                    Spacer()

                    Section(header: Text("Language")
                        .font(.custom("DM Sans", size: UIScreen.main.bounds.height / 35))
                        .foregroundColor(.white)
                        ) {
                        Picker("Language", selection: $selectedLanguage) {
                            Text("English").tag("English")
                                .font(.custom("DM Sans", size: UIScreen.main.bounds.height / 40))
                                .foregroundColor(.white)

                            Text("Español").tag("Español")
                                .font(.custom("DM Sans", size: UIScreen.main.bounds.height / 40))
                                .foregroundColor(.white)


                            Text("French").tag("French")
                                .font(.custom("DM Sans", size: UIScreen.main.bounds.height / 40))
                                .foregroundColor(.white)

                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .frame(width: UIScreen.main.bounds.width / 1.2)

                    }
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()


                    Button("Save") {
                        UserDefaults.standard.set(isDarkMode, forKey: "isDarkMode")
                        UserDefaults.standard.set(areNotificationsEnabled, forKey: "areNotificationsEnabled")
                        UserDefaults.standard.set(soundLevel, forKey: "soundLevel")
                        UserDefaults.standard.set(selectedLanguage, forKey: "selectedLanguage")
                    }
                    .alert(isPresented: $isSaveSuccessful)
                    {
                        Alert(
                            title: Text("Saved Successfully"),
                            message: Text("Your settings have been saved."),
                            dismissButton: .default(Text("OK"))
                        )
                    }
                    .alert(isPresented: $isChangesFailed) {
                        Alert(
                            title: Text("Changes Could Not Be Made"),
                            message: Text("An error occurred while saving your settings."),
                            dismissButton: .default(Text("OK"))
                        )
                    }
                    
                    .frame(width: UIScreen.main.bounds.width / 2.5, height: UIScreen.main.bounds.height / 20)
                    .background(Color(hex: 0xCFF2E5))
                    .cornerRadius(10)
                    .foregroundColor(.black)
                    .font(.custom("DM Sans", size: UIScreen.main.bounds.height / 35))
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()

                }
                .onAppear {
                    
                    isDarkMode = UserDefaults.standard.bool(forKey: "isDarkMode")
                    areNotificationsEnabled = UserDefaults.standard.bool(forKey: "areNotificationsEnabled")
                    soundLevel = UserDefaults.standard.double(forKey: "soundLevel")
                    selectedLanguage = UserDefaults.standard.string(forKey: "selectedLanguage") ?? "English"
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(hex: 0x96CEB4))

        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

