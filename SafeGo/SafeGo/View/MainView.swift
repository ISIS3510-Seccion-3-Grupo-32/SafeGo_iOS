//
//  ContentView.swift
//  SafeGo
//
//  Created by Gabriela Paez on 13/10/23.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var locationManager: LocationModel = LocationModel.shared
    @StateObject var viewController = MainViewController()
    @State private var showSafeGoView = true
    @State private var navigateToHomeView = false
    @State private var alertValue: Double?
    @State private var alertValue: Double?

    var body: some View {
        Group {
            if locationManager.userLocation == nil {
                LocationRequestView()
            } else {
                if showSafeGoView {
                    SafeGoView()
                        .onAppear {
                            // Shows the SafeGoView for 7 seconds and then shows either login view or map view depending if a person is already logged in.
                            DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
                                self.showSafeGoView = false
                                viewController.checkIfUserIsSignedIn()
                            }
                        }
                }
                else if viewController.isSignedIn && !viewController.currentUserId.isEmpty {
                    if (viewController.showForms && navigateToHomeView = fasle) {
                        UserForm() {
                            viewController.setUserFormTimeStamp()
                            navigateToHomeView = true
                        }
                    } else {
                        HomeView()
                    }
                    HomeView()
                } else {
                    LoginView()
                }
            }
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

