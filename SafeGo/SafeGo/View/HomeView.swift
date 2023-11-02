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

struct HomeView: View 
{
    @StateObject var viewModel = HomeViewViewModel()
    
    @State private var isTextFieldExpanded = false
    
    var body: some View
    {
        NavigationView
        {
            VStack
            {

                
                VStack (alignment: .leading)
                {

                    // Add a navigation link to UserComplaintsView
                    NavigationLink(destination: UserComplaintsView()) {
                        Image(systemName: "line.horizontal.3") // Three lines symbol
                            .frame(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.height / 4, alignment: .leading)
                            .foregroundColor(.black)
                    }
                    
                    TextField("Where to?", text: $viewModel.whereto)
                        .padding()
                        .focusable(true)
                        .frame(height: UIScreen.main.bounds.height / 12, alignment: .leading)
                        .background(Color.white)
                        .cornerRadius(10)
                        .font(.custom("DM Sans", size: UIScreen.main.bounds.height / 35))
                        .foregroundColor(.gray)
                        .shadow(radius: 10)
                    
                    HStack 
                    {
                        NavigationLink(destination: ReportBugView()) 
                        {
                            RoundedRectangle(cornerSize: CGSize(width: 25, height: 25))
                                .foregroundColor(Color(hex: 0xCFF2E5))
                                .frame(height: UIScreen.main.bounds.height / 12)
                                .overlay(
                                    Image(systemName: "exclamationmark.triangle.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: UIScreen.main.bounds.height / 14, height: UIScreen.main.bounds.height / 14)
                                        .foregroundColor(.black)
                                )
                                .shadow(radius: 10)
                        }
                        
                        NavigationLink(destination: TravelsView()) 
                        {
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
                                .shadow(radius: 10)
                        }
                    }
                    
                    // Home
                    RoundedRectangle(cornerSize: CGSize(width: 25, height: 25))
                        .foregroundColor(Color(hex: 0xCFF2E5))
                        .frame(height: UIScreen.main.bounds.height / 12)
                        .overlay(
                            HStack {
                                Image("house")
                                    .frame(width: UIScreen.main.bounds.width / 10, height: UIScreen.main.bounds.height / 10)
                                    .padding(.horizontal, UIScreen.main.bounds.width / 15)
                                NavigationLink("Home", destination: MainView())
                                    .font(.custom("DM Sans", size: UIScreen.main.bounds.height / 35))
                                    .foregroundColor(.gray)
                            }
                                .frame(width: UIScreen.main.bounds.width / 1.2, alignment: .leading)
                        )
                        .shadow(radius: 10)
                    
                    // Work
                    RoundedRectangle(cornerSize: CGSize(width: 25, height: 25))
                        .foregroundColor(Color(hex: 0xCFF2E5))
                        .frame(height: UIScreen.main.bounds.height / 12)
                        .overlay(
                            HStack {
                                Image("work")
                                    .frame(width: UIScreen.main.bounds.width / 10, height: UIScreen.main.bounds.height / 10)
                                    .padding(.horizontal, UIScreen.main.bounds.width / 15)
                                NavigationLink("Work", destination: MainView())
                                    .font(.custom("DM Sans", size: UIScreen.main.bounds.height / 35))
                                    .foregroundColor(.gray)
                            }
                                .frame(width: UIScreen.main.bounds.width / 1.2, alignment: .leading)
                        )
                        .shadow(radius: 10)
                    
                    // Education
                    RoundedRectangle(cornerSize: CGSize(width: 25, height: 25))
                        .foregroundColor(Color(hex: 0xCFF2E5))
                        .frame(height: UIScreen.main.bounds.height / 12)
                        .overlay(
                            HStack {
                                Image("education")
                                    .frame(width: UIScreen.main.bounds.width / 10, height: UIScreen.main.bounds.height / 10)
                                    .padding(.horizontal, UIScreen.main.bounds.width / 15)
                                NavigationLink("Education", destination: MainView())
                                    .font(.custom("DM Sans", size: UIScreen.main.bounds.height / 35))
                                    .foregroundColor(.gray)
                            }
                                .frame(width: UIScreen.main.bounds.width / 1.2, alignment: .leading)
                        )
                        .shadow(radius: 10)
                    
                    // Partner
                    RoundedRectangle(cornerSize: CGSize(width: 25, height: 25))
                        .foregroundColor(Color(hex: 0xCFF2E5))
                        .frame(height: UIScreen.main.bounds.height / 12)
                        .overlay(
                            HStack {
                                Image("partner")
                                    .frame(width: UIScreen.main.bounds.width / 10, height: UIScreen.main.bounds.height / 10)
                                    .padding(.horizontal, UIScreen.main.bounds.width / 15)
                                NavigationLink("Partner", destination: MainView())
                                    .font(.custom("DM Sans", size: UIScreen.main.bounds.height / 35))
                                    .foregroundColor(.gray)
                            }
                                .frame(width: UIScreen.main.bounds.width / 1.2, alignment: .leading)
                        )
                        .shadow(radius: 10)
                    
                    VStack(alignment: .center)
                    {
                        ButtonFactory.createButton(title: "Go")
                        {
                            viewModel.uploadToCloud()
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
                }
                .padding()
                Spacer()
                Spacer()
                Spacer()

            }
            .background(Color(hex: 0x96CEB4))
        }
    }
}

struct HomeView_Previews: PreviewProvider 
{
    static var previews: some View 
    {
        HomeView()
    }
}




