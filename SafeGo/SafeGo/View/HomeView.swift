//
//  HomeView.swift
//  SafeGo
//
//  Created by Juan Felipe on 2/11/23.
//

import SwiftUI
import MapKit

struct HomeView: View {
    @StateObject var viewModel = HomeViewController()
    @StateObject private var connectivityViewModel = ConnectivityViewModel()
    @StateObject var connectivityViewController = ConnectivityViewController()

    @State private var isTextFieldExpanded = false
    @State private var navigateToMapView = false
    @State private var destinationCoordinate: CLLocationCoordinate2D?
    @State private var showAlert = false

    var body: some View {
        Group {
            if connectivityViewModel.isConnected {
                NavigationView {
                    VStack {
                        HStack() {
                            Image(systemName: "house.fill")
                                .foregroundColor(.black)
                                .font(.system(size: 40))
                            
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

                        ZStack{
                            CurrentMapView()
                            
                            VStack{
                                Spacer()
                                HStack{
                                    Spacer()
                                    NavigationLink(destination: ReportCrimeView(viewController: ReportCrimesViewController(serviceAdapter: ServiceAdapter()))
                                        .navigationBarBackButtonHidden(true))
                                    {
                                        Image(systemName: "exclamationmark.triangle.fill")
                                            .foregroundColor(.black)
                                            .font(.system(size: UIScreen.main.bounds.height / 15))
                                    }
                                }
                            }
                            .frame(width: UIScreen.main.bounds.width / 1.22, height: UIScreen.main.bounds.height / 1.52)
                            
                        }
                        .frame(width: UIScreen.main.bounds.width / 1.2, height: UIScreen.main.bounds.height / 1.5)


                        Spacer()

                        HStack {
                            // Where to
                            TextField("Where to?", text: $viewModel.whereto)
                                .padding()
                                .frame(width: UIScreen.main.bounds.width / 1.4,
                                       height: UIScreen.main.bounds.height / 15,
                                       alignment: .center)
                                .background(Color.white)
                                .cornerRadius(10)
                                .font(.custom("DM Sans", size: UIScreen.main.bounds.height / 35))
                                .foregroundColor(.gray)
                                .shadow(radius: 10)

                            Button(action: {
                                if viewModel.whereto.isEmpty {
                                    showAlert = true
                                } else {
                                    viewModel.uploadToCloud()
                                    navigateToMapView = true // Set the state to trigger navigation
                                }
                            }) {
                                Text("Go")
                                    .font(.custom("DM Sans", size: UIScreen.main.bounds.height / 35))
                                    .foregroundColor(.black)
                                    .padding()
                                    .background(Color(hex: 0xCFF2E5))
                                    .cornerRadius(10)
                            }
                        }

                        HStack {
                            Spacer()

                            // Home
                            NavigationLink(destination: TripView(address: viewModel.getSavedAddress(icon: "house"), icon: "house")
                                .navigationBarBackButtonHidden(true))
                            {
                                RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                                    .foregroundColor(Color(hex: 0xCFF2E5))
                                    .frame(width: UIScreen.main.bounds.width / 6, height: UIScreen.main.bounds.height / 15)
                                    .overlay(
                                        Image(systemName: "building")
                                            .resizable()
                                            .frame(width: UIScreen.main.bounds.width / 12, height: UIScreen.main.bounds.height / 20)
                                            .foregroundColor(.black)
                                    )
                                    .shadow(radius: 5)
                            }
                            Spacer()
                            
                            NavigationLink(destination: TripView(address: viewModel.getSavedAddress(icon: "bag"), icon: "bag")
                                .navigationBarBackButtonHidden(true))
                            {
                                RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                                    .foregroundColor(Color(hex: 0xCFF2E5))
                                    .frame(width: UIScreen.main.bounds.width / 6, height: UIScreen.main.bounds.height / 15)
                                    .overlay(
                                        Image(systemName: "bag")
                                            .resizable()
                                            .frame(width: UIScreen.main.bounds.width / 8, height: UIScreen.main.bounds.height / 20)
                                            .foregroundColor(.black)
                                    )
                                    .shadow(radius: 5)
                            }

                            Spacer()

                            NavigationLink(destination: TripView(address: viewModel.getSavedAddress(icon: "graduationcap"), icon: "graduationcap")
                                .navigationBarBackButtonHidden(true))
                            {
                                RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                                    .foregroundColor(Color(hex: 0xCFF2E5))
                                    .frame(width: UIScreen.main.bounds.width / 6, height: UIScreen.main.bounds.height / 15)
                                    .overlay(
                                        Image(systemName: "graduationcap")
                                            .resizable()
                                            .frame(width: UIScreen.main.bounds.width / 8, height: UIScreen.main.bounds.height / 20)
                                            .foregroundColor(.black)
                                    )
                                    .shadow(radius: 5)
                            }

                            Spacer()

                            NavigationLink(destination: TripView(address: viewModel.getSavedAddress(icon: "heart"), icon: "heart")
                                .navigationBarBackButtonHidden(true))
                            {
                                RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                                    .foregroundColor(Color(hex: 0xCFF2E5))
                                    .frame(width: UIScreen.main.bounds.width / 6, height: UIScreen.main.bounds.height / 15)
                                    .overlay(
                                        Image(systemName: "heart")
                                            .resizable()
                                            .frame(width: UIScreen.main.bounds.width / 8, height: UIScreen.main.bounds.height / 20)
                                            .foregroundColor(.black)
                                    )
                                    .shadow(radius: 5)
                            }

                            Spacer()
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color(hex: 0x96CEB4))
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("No address saved"), message: Text("Please enter a valid address."), dismissButton: .default(Text("OK")))
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
    HomeView()
}
