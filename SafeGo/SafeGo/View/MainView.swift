//
//  ContentView.swift
//  SafeGo
//
//  Created by Juan Martin Santos Ayala on 19/09/23.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject private var authStateManager: AuthStateManager

    var body: some View {
        NavigationView {
            if authStateManager.isLoggedIn {
                HomeView()
            } else {
                LoginView()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(AuthStateManager())
    }
}
