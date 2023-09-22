//
//  ContentView.swift
//  SafeGo
//
//  Created by Juan Martin Santos Ayala on 19/09/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            LoginView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
