//
//  HomeVIewSecondTry.swift
//  SafeGo
//
//  Created by Pipe on 2/11/23.
//

import SwiftUI
import MapKit

struct HomeView: View {
    @StateObject var viewModel = HomeViewController()
    @State private var isTextFieldExpanded = false
    @State private var navigateToMapView = false
    @State private var destinationCoordinate: CLLocationCoordinate2D?

    var body: some View {
        NavigationView {
            VStack {
                VStack 
                {
                    VStack
                    {
                        HStack {
                            NavigationLink(destination: UserComplaintsView()) 
                            {
                                Image(systemName: "line.horizontal.3")
                                    .foregroundColor(.black)
                                    .font(.system(size: 30))
                            }
                            .navigationBarTitle("")
                            .padding(.leading)
                            
                            Spacer()
                            

                            NavigationLink(destination: ProfileView()) 
                            {
                                Image(systemName: "person.circle")
                                    .foregroundColor(.black)
                                    .font(.system(size: 40))
                                    .padding(.leading, 2)
                                
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
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
                        
                        Button(action: 
                                {
                            viewModel.uploadToCloud()
                            
                            let destinationCoordinate = CLLocationCoordinate2D(latitude: viewModel.latitude, longitude: viewModel.longitude)
                            
                            // Set the destination coordinate
                            viewModel.destinationCoordinate = destinationCoordinate
                            
                            navigateToMapView = true // Set the state to trigger navigation
                        }) {
                            Text("Go")
                                .font(.custom("DM Sans", size: UIScreen.main.bounds.height / 35))
                                .foregroundColor(.black)
                                .padding()
                                .background(Color(hex: 0xCFF2E5))
                                .cornerRadius(10)
                        }
                        .background(
                            NavigationLink("", destination: CurrentMapView(destinationCoordinate: $viewModel.destinationCoordinate), isActive: $navigateToMapView)
                                .opacity(0)
                        )
                    }

                    HStack {
                        Spacer()

                        // Home
                        NavigationLink(destination: TripView()) {
                            RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                                .foregroundColor(Color(hex: 0xCFF2E5))
                                .frame(width: UIScreen.main.bounds.width / 6, height: UIScreen.main.bounds.height / 15)
                                .overlay(
                                    Image(systemName: "house")
                                        .resizable()
                                        .frame(width: UIScreen.main.bounds.width / 8, height: UIScreen.main.bounds.height / 20)
                                        .foregroundColor(.black)
                                )
                                .shadow(radius: 5)
                        }

                        Spacer()

                        // Work
                        NavigationLink(destination: TripView()) {
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

                        // Education
                        NavigationLink(destination: TripView()) {
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

                        // Partner
                        NavigationLink(destination: TripView()) {
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
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(hex: 0x96CEB4))
        }
    }
}


#Preview {
    HomeView()
}
