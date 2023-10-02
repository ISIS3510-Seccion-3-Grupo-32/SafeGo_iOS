//
//  SafeGoApp.swift
//  SafeGo
//
//  Created by Juan Martin Santos Ayala on 19/09/23.
//

import SwiftUI
import FirebaseCore

@main
struct SafeGoApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
