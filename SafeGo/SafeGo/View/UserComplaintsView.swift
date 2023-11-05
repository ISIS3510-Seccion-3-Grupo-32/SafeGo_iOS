//
//  UserComplaintsView.swift
//  SafeGo
//
//  Created by Gabriela on 10/30/23.
//

import SwiftUI

struct UserComplaintsView: View 
{
    var body: some View 
    {
        NavigationView
        {
            VStack
            {
                HStack {
                    Spacer()

                    NavigationLink(destination: UserComplaintsView())
                    {
                        Image(systemName: "line.horizontal.3")
                            .foregroundColor(.black)
                            .font(.system(size: 30))
                    }
                    .navigationBarTitle("")
                    .padding(.leading)
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()

                    NavigationLink(destination: ProfileView())
                    {
                        Image(systemName: "person.circle")
                            .foregroundColor(.black)
                            .font(.system(size: 40))
                            .padding(.leading, 2)
                        
                    }
                    Spacer()

                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                Spacer()
                Spacer()
                
                NavigationLink(destination: SettingsView()){
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

                
                NavigationLink(destination: PQRView()){
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
                
                NavigationLink(destination: ReportBugView()){
                    RoundedRectangle(cornerSize: CGSize(width: 25, height: 25))
                        .foregroundColor(Color(hex: 0xCFF2E5))
                        .frame(width: UIScreen.main.bounds.width / 1.1, height: UIScreen.main.bounds.height / 12)
                        .overlay(
                            HStack {
                                Image(systemName: "speaker")
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
                .navigationBarBackButtonHidden(true)
                
                
                Spacer()
                Spacer()
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
