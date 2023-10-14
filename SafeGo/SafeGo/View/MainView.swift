//
//  ContentView.swift
//  SafeGo
//
//  Created by Gabriela Paez on 13/10/23.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewViewModel()
    @State private var showSafeGoView = true

    var body: some View {
        if showSafeGoView {
            SafeGoView()
                .onAppear {
                    // Automatically navigate to other views after 7 seconds
                    DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
                        self.showSafeGoView = false
                    }
                }
        } else if viewModel.isSignedIn && !viewModel.currentUserId.isEmpty {
            MapView()
        } else {
            LoginView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

