//
//  HomeVIewSecondTry.swift
//  SafeGo
//
//  Created by Pipe on 2/11/23.
//

import SwiftUI

struct HomeVIewSecondTry: View {
    @StateObject var viewModel = HomeViewController()
    
    @State private var isTextFieldExpanded = false
    
    var body: some View
    {
        NavigationView
        {
            VStack
            {
                VStack ()
                {
                    // Settings
                    HStack{
                        
                        Spacer()

                        
                        NavigationLink(destination: UserComplaintsView()) {
                            Image(systemName: "line.horizontal.3") // Three lines symbol
                                .foregroundColor(.black)
                                .font(.system(size: 50))
                        }
                        
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()

                    }
            
                    Spacer()
                    Spacer()
                    
                    // Where to
                    TextField("Where to?", text: $viewModel.whereto)
                        .padding()
                        .frame(width: UIScreen.main.bounds.width / 1.2,
                               height: UIScreen.main.bounds.height / 15,
                               alignment: .center)
                        .background(Color.white)
                        .cornerRadius(10)
                        .font(.custom("DM Sans", size: UIScreen.main.bounds.height / 35))
                        .foregroundColor(.gray)
                        .shadow(radius: 10)
                    
                    Spacer()

                    
                    HStack{
                        // Exclamation
                        NavigationLink(destination: UserComplaintsView()) {
                            RoundedRectangle(cornerSize: CGSize(width: 25, height: 25))
                                .foregroundColor(Color(hex: 0xCFF2E5))
                                .frame(width: UIScreen.main.bounds.width/2.4, height: UIScreen.main.bounds.height / 12)
                                .overlay(
                                    Image(systemName: "exclamationmark.triangle.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: UIScreen.main.bounds.height / 20)
                                        .foregroundColor(.black)
                                )
                                .shadow(radius: 10)
                        }
                        // Old Trips
                        NavigationLink(destination: TravelsView()) {
                            RoundedRectangle(cornerSize: CGSize(width: 25, height: 25))
                                .foregroundColor(Color(hex: 0xCFF2E5))
                                .frame(width: UIScreen.main.bounds.width/2.4, height: UIScreen.main.bounds.height / 12)
                                .overlay(
                                    Image(systemName: "calendar")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: UIScreen.main.bounds.height / 20)
                                        .foregroundColor(.black)
                                )
                                .shadow(radius: 10)
                        }
                    }
                    
                    Spacer()

                    
                    // Home
                    NavigationLink(destination: MainView()){
                        RoundedRectangle(cornerSize: CGSize(width: 25, height: 25))
                            .foregroundColor(Color(hex: 0xCFF2E5))
                            .frame(width: UIScreen.main.bounds.width / 1.2, height:UIScreen.main.bounds.height / 10,alignment: .center)
                            .overlay(
                                HStack {
                                    Image(systemName: "house")
                                        .resizable()
                                        .frame(width: UIScreen.main.bounds.width / 8, height: UIScreen.main.bounds.height / 20)
                                        .padding(.horizontal, UIScreen.main.bounds.width / 15)
                                        .foregroundColor(.black)
                                    Text("Home")
                                        .font(.custom("DM Sans", size: UIScreen.main.bounds.height / 35))
                                        .foregroundColor(.gray)
                                    Spacer()
                                }).shadow(radius: 10)}
                    
                    Spacer()

                    
                    // Work
                    NavigationLink(destination: MainView()){
                        RoundedRectangle(cornerSize: CGSize(width: 25, height: 25))
                            .foregroundColor(Color(hex: 0xCFF2E5))
                            .frame(width: UIScreen.main.bounds.width / 1.2, height:UIScreen.main.bounds.height / 10,alignment: .center)
                            .overlay(
                                HStack {
                                    Image(systemName: "bag")
                                        .resizable()
                                        .frame(width: UIScreen.main.bounds.width / 8, height: UIScreen.main.bounds.height / 20)
                                        .padding(.horizontal, UIScreen.main.bounds.width / 15)
                                        .foregroundColor(.black)
                                    Text("Work")
                                        .font(.custom("DM Sans", size: UIScreen.main.bounds.height / 35))
                                        .foregroundColor(.gray)
                                    Spacer()
                                }).shadow(radius: 10)}
                    
                    Spacer()

                    
                    // Education
                    NavigationLink(destination: MainView()){
                        RoundedRectangle(cornerSize: CGSize(width: 25, height: 25))
                            .foregroundColor(Color(hex: 0xCFF2E5))
                            .frame(width: UIScreen.main.bounds.width / 1.2, height:UIScreen.main.bounds.height / 10,alignment: .center)
                            .overlay(
                                HStack {
                                    Image(systemName: "graduationcap")
                                        .resizable()
                                        .frame(width: UIScreen.main.bounds.width / 8, height: UIScreen.main.bounds.height / 20)
                                        .padding(.horizontal, UIScreen.main.bounds.width / 15)
                                        .foregroundColor(.black)
                                    Text("Education")
                                        .font(.custom("DM Sans", size: UIScreen.main.bounds.height / 35))
                                        .foregroundColor(.gray)
                                    Spacer()
                                }).shadow(radius: 10)}
                    
                    Spacer()

                    
                    // Partner
                    NavigationLink(destination: MainView()){
                        RoundedRectangle(cornerSize: CGSize(width: 25, height: 25))
                            .foregroundColor(Color(hex: 0xCFF2E5))
                            .frame(width: UIScreen.main.bounds.width / 1.2, height:UIScreen.main.bounds.height / 10,alignment: .center)
                            .overlay(
                                HStack {
                                    Image(systemName: "heart")
                                        .resizable()
                                        .frame(width: UIScreen.main.bounds.width / 8, height: UIScreen.main.bounds.height / 20)
                                        .padding(.horizontal, UIScreen.main.bounds.width / 15)
                                        .foregroundColor(.black)
                                    Text("Partner")
                                        .font(.custom("DM Sans", size: UIScreen.main.bounds.height / 35))
                                        .foregroundColor(.gray)
                                    Spacer()
                                }).shadow(radius: 10)}
                    
                    Spacer()
                    Spacer()
                    Spacer()

                    
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
                .background(Color(hex: 0x96CEB4))
            }
        }
    }
}

#Preview {
    HomeVIewSecondTry()
}
