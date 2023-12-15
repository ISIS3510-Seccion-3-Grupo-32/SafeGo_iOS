//
//  TripView.swift
//  SafeGo
//
//  Created by Gabriela on 11/2/23.
//

import SwiftUI

struct TripView: View 
{
    @StateObject private var connectivityViewModel = ConnectivityViewModel()
    @StateObject var connectivityViewController = ConnectivityViewController()
    let address: String?
    let icon: String

    var body: some View {
        Group {
            if connectivityViewModel.isConnected {
                NavigationView {
                    VStack() {
                        HStack() {
                            NavigationLink(destination: HomeView()
                                .navigationBarBackButtonHidden(true)) {
                                Image(systemName: "house.fill")
                                    .foregroundColor(.black)
                                    .font(.system(size: 40))
                            }

                            Spacer()
                            NavigationLink(destination: UserComplaintsView()
                                .navigationBarBackButtonHidden(true)) {
                                Image(systemName: "line.horizontal.3")
                                    .foregroundColor(.black)
                                    .font(.system(size: 40))
                            }
                        }
                        .frame(width: UIScreen.main.bounds.width / 1.2)
                        Spacer()
                        VStack {
                            Spacer()
                            Spacer()
                            HStack {
                                Image(systemName: "clock")
                                    .font(.system(size: 24))
                                Text("You will get there at")
                                    .font(.system(size: 20))
                                    .foregroundColor(.black)
                            }
                            Spacer()

                            if let address = address {
                                Text("Destination")
                                    .font(.system(size: 20))
                                    .bold()

                                Text(address) // Display the saved address
                                    .font(.system(size: 20))
                                    .bold()
                                
                            } else {
                                Text("No address saved") // Display a message if no address is available
                                    .font(.system(size: 20))
                                    .bold()
                            }
                        }
                        Spacer()
                        Spacer()

                        HStack {
                            ButtonFactory.createButton(title: "Go") {
                            }
                        }
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color(hex: 0x96CEB4))
                }

            } else {
                NoConnectionView()
            }
        }
        .onAppear {
            connectivityViewModel.isConnected = connectivityViewController.isConnectedToInternet()
        }
    }
}


#Preview {
    TripView(address: "Your saved address here", icon: "Icon name here")
}
