//
//  ContentView.swift
//  SafeGo
//
//  Created by Gabriela Paez on 13/10/23.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewController = MainViewController()
    @State private var showSafeGoView = true

    var body: some View 
    {
        if showSafeGoView
        {
            SafeGoView()
                .onAppear 
            {
                    // Shows the SafeGoView for 7 seconds and then shows either login view or map view depending if a person is already logged in.
                    DispatchQueue.main.asyncAfter(deadline: .now() + 7)
                    {
                        self.showSafeGoView = false
                    }
            }
        } 
        else if viewController.isSignedIn && !viewController.currentUserId.isEmpty
        {
            HomeView()
        } else {
            LoginView()
        }
    }
}

struct ContentView_Previews: PreviewProvider 
{
    static var previews: some View
    {
        MainView()
    }
}

