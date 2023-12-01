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
    @State private var navigateToHomeView = false

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
                        viewController.calculateIfIsTime()
                    }
            }
        }
        else if viewController.isSignedIn && !viewController.currentUserId.isEmpty
        {
            if viewController.showForms {
                NavigationLink(
                    destination: HomeView(),
                    isActive: $navigateToHomeView,
                    label: {
                        UserForm() {
                            viewController.setUserFormTimeStamp()
                            navigateToHomeView = true
                        }
                    })
                } else {
                HomeView()
            }
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

