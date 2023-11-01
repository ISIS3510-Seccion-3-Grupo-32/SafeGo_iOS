//
//  HomeView.swift
//  SafeGo
//
//  Created by Pipe on 22/09/23.
//
//
//  HomeView.swift
//  SafeGo
//
//  Created by Pipe on 22/09/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewViewModel()
    
    @State private var isTextFieldExpanded = false
    
    var body: some View 
    {
        NavigationView
        {
            
        ZStack {
            CurrentMapView() // Background
            
            VStack {
                Spacer()
                
                ZStack {
                    RoundedRectangle(cornerSize: CGSize(width: 25, height: 25))
                        .foregroundColor(Color(hex: 0x96CEB4))
                        .offset(y: 120)
                    
                    VStack {
                        Spacer().frame(height: UIScreen.main.bounds.height / 12)
                        
                        // Add a navigation link to UserComplaintsView
                        NavigationLink(destination: UserComplaintsView()) {
                            Image(systemName: "line.horizontal.3") // Three lines symbol
                                .frame(width: UIScreen.main.bounds.width / 5, height: UIScreen.main.bounds.height / 11)
                        }
                        
                        TextField("Where to?", text: $viewModel.whereto)
                            .padding()
                            .frame(height: UIScreen.main.bounds.height / 12, alignment: .leading)
                            .background(Color.white)
                            .cornerRadius(10)
                            .font(.custom("DM Sans", size: UIScreen.main.bounds.height / 35))
                            .foregroundColor(.gray)
                            .shadow(radius: 10)
                        
                        ZStack {
                            HStack {
                                NavigationLink(destination: ReportBugView()) {
                                    RoundedRectangle(cornerSize: CGSize(width: 25, height: 25))
                                        .foregroundColor(Color(hex: 0xCFF2E5))
                                        .frame(height: UIScreen.main.bounds.height / 12)
                                        .overlay(
                                            Image(systemName: "exclamationmark.triangle.fill")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: UIScreen.main.bounds.height / 12, height: UIScreen.main.bounds.height / 12)
                                                .foregroundColor(.black)
                                        )
                                }
                                .shadow(radius: 10)
                                
                                NavigationLink(destination: TravelsView()) {
                                    RoundedRectangle(cornerSize: CGSize(width: 25, height: 25))
                                        .foregroundColor(Color(hex: 0xCFF2E5))
                                        .frame(height: UIScreen.main.bounds.height / 12)
                                        .overlay(
                                            Image("calendar")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: UIScreen.main.bounds.height / 2, height: UIScreen.main.bounds.height / 2)
                                                .foregroundColor(.black)
                                        )
                                }
                                .shadow(radius: 10)
                            }
                        }
                        
                        VStack {
                            // Home
                            ZStack {
                                RoundedRectangle(cornerSize: CGSize(width: 25, height: 25))
                                    .foregroundColor(Color(hex: 0xCFF2E5))
                                    .frame(height: UIScreen.main.bounds.height / 12)
                                HStack {
                                    Image("house")
                                        .frame(width: UIScreen.main.bounds.width / 10, height: UIScreen.main.bounds.height / 10)
                                        .padding(.horizontal, UIScreen.main.bounds.width / 15)
                                    NavigationLink("Home", destination: MainView())
                                        .font(.custom("DM Sans", size: UIScreen.main.bounds.height / 35))
                                        .foregroundColor(.gray)
                                }
                                .frame(width: UIScreen.main.bounds.width / 1.2, alignment: . leading)
                            }.shadow(radius: 10)
                            
                            // Work
                            ZStack {
                                RoundedRectangle(cornerSize: CGSize(width: 25, height: 25))
                                    .foregroundColor(Color(hex: 0xCFF2E5))
                                    .frame(height: UIScreen.main.bounds.height / 12)
                                HStack {
                                    Image("work")
                                        .frame(width: UIScreen.main.bounds.width / 10, height: UIScreen.main.bounds.height / 10)
                                        .padding(.horizontal, UIScreen.main.bounds.width / 15)
                                    NavigationLink("Work", destination: MainView())
                                        .font(.custom("DM Sans", size: UIScreen.main.bounds.height / 35))
                                        .foregroundColor(.gray)
                                }
                                .frame(width: UIScreen.main.bounds.width / 1.2, alignment: .leading)
                            }.shadow(radius: 10)
                            
                            // Education
                            ZStack {
                                RoundedRectangle(cornerSize: CGSize(width: 25, height: 25))
                                    .foregroundColor(Color(hex: 0xCFF2E5))
                                    .frame(height: UIScreen.main.bounds.height / 12)
                                HStack {
                                    Image("education")
                                        .frame(width: UIScreen.main.bounds.width / 10, height: UIScreen.main.bounds.height / 10)
                                        .padding(.horizontal, UIScreen.main.bounds.width / 15)
                                    NavigationLink("Education", destination: MainView())
                                        .font(.custom("DM Sans", size: UIScreen.main.bounds.height / 35))
                                        .foregroundColor(.gray)
                                }
                                .frame(width: UIScreen.main.bounds.width / 1.2, alignment: .leading)
                            }.shadow(radius: 10)
                            
                            // Partner
                            ZStack {
                                RoundedRectangle(cornerSize: CGSize(width: 25, height: 25))
                                    .foregroundColor(Color(hex: 0xCFF2E5))
                                    .frame(height: UIScreen.main.bounds.height / 12)
                                HStack {
                                    Image("partner")
                                        .frame(width: UIScreen.main.bounds.width / 10, height: UIScreen.main.bounds.height / 10)
                                        .padding(.horizontal, UIScreen.main.bounds.width / 15)
                                    NavigationLink("Partner", destination: MainView())
                                        .font(.custom("DM Sans", size: UIScreen.main.bounds.height / 35))
                                        .foregroundColor(.gray)
                                }
                                .frame(width: UIScreen.main.bounds.width / 1.2, alignment: .leading)
                            }.shadow(radius: 10)
                            
                            
                            ButtonFactory.createButton(title: "Logout") {
                                viewModel.logOut()
                            }
                        }
                    }
                    .padding()
                }
            }
            }
        }
    }
}


#Preview 
{
    HomeView()
}



