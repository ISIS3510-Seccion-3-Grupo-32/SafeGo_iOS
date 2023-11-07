//
//  UserComplaintsView.swift
//  SafeGo
//
//  Created by Gabriela on 10/30/23.
//

import SwiftUI

struct UserComplaintsView: View 
{
    @StateObject var viewController = UserComplaintsViewController()

    
    var body: some View
    {
        NavigationView
        {
            VStack
            {
                HStack()
                {
                    NavigationLink(destination: HomeView()
                        .navigationBarBackButtonHidden(true))
                    {
                        Image(systemName: "house.fill")
                            .foregroundColor(.black)
                            .font(.system(size: 40))
                    }
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    Image(systemName: "line.horizontal.3")
                        .foregroundColor(.black)
                        .font(.system(size: 40))
                }
                .frame(width: UIScreen.main.bounds.width / 1.2)
                
                Spacer()
                Spacer()
                Spacer()
                
                NavigationLink(destination: SettingsView()
                    .navigationBarBackButtonHidden(true)){
                    RoundedRectangle(cornerSize: CGSize(width: 25, height: 25))
                        .foregroundColor(Color(hex: 0xCFF2E5))
                        .frame(width: UIScreen.main.bounds.width / 1.1, height: UIScreen.main.bounds.height / 12)
                        .overlay(
                            HStack {
                                Image(systemName: "gear")
                                    .font(.system(size: 60))
                                    .frame(width: UIScreen.main.bounds.width / 10, height: UIScreen.main.bounds.height / 10)
                                    .padding(.horizontal, UIScreen.main.bounds.width / 15)
                                    .foregroundColor(.black)
                                Text("Settings")
                                    .font(.custom("DM Sans", size: UIScreen.main.bounds.height / 35))
                                    .foregroundColor(.gray)
                            }
                                .frame(width: UIScreen.main.bounds.width / 1.2, alignment: .leading)
                        )
                        .shadow(radius: 10)
                }
                .navigationBarBackButtonHidden(true)
                
                Spacer()

                
                NavigationLink(destination: ReportSuggestionsView(viewController: ReportSuggestionsViewController(serviceAdapter: ServiceAdapter()))
                    .navigationBarBackButtonHidden(true)) {
                    RoundedRectangle(cornerSize: CGSize(width: 25, height: 25))
                        .foregroundColor(Color(hex: 0xCFF2E5))
                        .frame(width: UIScreen.main.bounds.width / 1.1, height: UIScreen.main.bounds.height / 12)
                        .overlay(
                            HStack {
                                Image(systemName: "pencil")
                                    .font(.system(size: 60))
                                    .frame(width: UIScreen.main.bounds.width / 10, height: UIScreen.main.bounds.height / 10)
                                    .padding(.horizontal, UIScreen.main.bounds.width / 15)
                                    .foregroundColor(.black)
                                Text("Suggestions")
                                    .font(.custom("DM Sans", size: UIScreen.main.bounds.height / 35))
                                    .foregroundColor(.gray)
                            }
                            .frame(width: UIScreen.main.bounds.width / 1.2, alignment: .leading)
                        )
                        .shadow(radius: 10)
                }
                .navigationBarBackButtonHidden(true)
                
                
                Spacer()
                
                NavigationLink(
                    destination: ReportBugView(viewController: ReportBugViewController(serviceAdapter: ServiceAdapter())
                                              ).navigationBarBackButtonHidden(true),
                    label: {
                        RoundedRectangle(cornerSize: CGSize(width: 25, height: 25))
                            .foregroundColor(Color(hex: 0xCFF2E5))
                            .frame(width: UIScreen.main.bounds.width / 1.1, height: UIScreen.main.bounds.height / 12)
                            .overlay(
                                HStack {
                                    Image(systemName: "speaker.wave.2")
                                        .font(.system(size: 60))
                                        .frame(width: UIScreen.main.bounds.width / 10, height: UIScreen.main.bounds.height / 10)
                                        .padding(.horizontal, UIScreen.main.bounds.width / 15)
                                        .foregroundColor(.black)
                                    Text("Complaints")
                                        .font(.custom("DM Sans", size: UIScreen.main.bounds.height / 35))
                                        .foregroundColor(.gray)
                                }
                                .frame(width: UIScreen.main.bounds.width / 1.2, alignment: .leading)
                            )
                            .shadow(radius: 10)
                    }
                )
                .navigationBarBackButtonHidden(true)
                
                Spacer()
                
                NavigationLink(destination: ProfileView()
                    .navigationBarBackButtonHidden(true)){
                    RoundedRectangle(cornerSize: CGSize(width: 25, height: 25))
                        .foregroundColor(Color(hex: 0xCFF2E5))
                        .frame(width: UIScreen.main.bounds.width / 1.1, height: UIScreen.main.bounds.height / 12)
                        .overlay(
                            HStack {
                                Image(systemName: "person")
                                    .font(.system(size: 60))
                                    .frame(width: UIScreen.main.bounds.width / 10, height: UIScreen.main.bounds.height / 10)
                                    .padding(.horizontal, UIScreen.main.bounds.width / 15)
                                    .foregroundColor(.black)
                                Text("Profile")
                                    .font(.custom("DM Sans", size: UIScreen.main.bounds.height / 35))
                                    .foregroundColor(.gray)
                            }
                                .frame(width: UIScreen.main.bounds.width / 1.2, alignment: .leading)
                        )
                        .shadow(radius: 10)
                }
                .navigationBarBackButtonHidden(true)
                
                Spacer()
                
                NavigationLink(destination:  LoginView()
                    .navigationBarBackButtonHidden(true)){
                    RoundedRectangle(cornerSize: CGSize(width: 25, height: 25))
                        .foregroundColor(Color(hex: 0xCFF2E5))
                        .frame(width: UIScreen.main.bounds.width / 1.1, height: UIScreen.main.bounds.height / 12)
                        .overlay(
                            HStack {
                                Image(systemName: "person.fill")
                                    .font(.system(size: 60))
                                    .frame(width: UIScreen.main.bounds.width / 10, height: UIScreen.main.bounds.height / 10)
                                    .padding(.horizontal, UIScreen.main.bounds.width / 15)
                                    .foregroundColor(.black)
                                Text("Sign Out")
                                    .font(.custom("DM Sans", size: UIScreen.main.bounds.height / 35))
                                    .foregroundColor(.gray)
                            }
                                .frame(width: UIScreen.main.bounds.width / 1.2, alignment: .leading)
                        )
                        .shadow(radius: 10)
                }
                .navigationBarBackButtonHidden(true)
                
                
                Spacer()
                Spacer()
                Spacer()


            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
            .background(Color(hex: 0x96CEB4))
        }

    }
}

#Preview {
    UserComplaintsView()
}
