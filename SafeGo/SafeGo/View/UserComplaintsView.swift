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
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()

                
                RoundedRectangle(cornerSize: CGSize(width: 25, height: 25))
                    .foregroundColor(Color(hex: 0xCFF2E5))
                    .frame(height: UIScreen.main.bounds.height / 12)
                    .overlay(
                        HStack {
                            Image(systemName: "gear")
                                .font(.system(size: 60))
                                .frame(width: UIScreen.main.bounds.width / 10, height: UIScreen.main.bounds.height / 10)
                                .padding(.horizontal, UIScreen.main.bounds.width / 15)
                            NavigationLink("Settings", destination: SettingsView())
                                .font(.custom("DM Sans", size: UIScreen.main.bounds.height / 35))
                                .foregroundColor(.gray)
                        }
                            .frame(width: UIScreen.main.bounds.width / 1.2, alignment: .leading)
                    )
                    .shadow(radius: 10)
                
                Spacer()

                
                RoundedRectangle(cornerSize: CGSize(width: 25, height: 25))
                    .foregroundColor(Color(hex: 0xCFF2E5))
                    .frame(height: UIScreen.main.bounds.height / 12)
                    .overlay(
                        HStack {
                            Image(systemName: "pencil")
                                .font(.system(size: 65))
                                .frame(width: UIScreen.main.bounds.width / 10, height: UIScreen.main.bounds.height / 10)
                                .padding(.horizontal, UIScreen.main.bounds.width / 15)
                            NavigationLink("Suggestions", destination: PQRView())
                                .font(.custom("DM Sans", size: UIScreen.main.bounds.height / 35))
                                .foregroundColor(.gray)
                        }
                            .frame(width: UIScreen.main.bounds.width / 1.2, alignment: .leading)
                    )
                    .shadow(radius: 10)
                
                Spacer()
                
                RoundedRectangle(cornerSize: CGSize(width: 25, height: 25))
                    .foregroundColor(Color(hex: 0xCFF2E5))
                    .frame(height: UIScreen.main.bounds.height / 12)
                    .overlay(
                        HStack {
                            Image(systemName: "speaker")
                                .font(.system(size: 60))
                                .frame(width: UIScreen.main.bounds.width / 10, height: UIScreen.main.bounds.height / 10)
                                .padding(.horizontal, UIScreen.main.bounds.width / 15)
                            NavigationLink("Complaints", destination: ReportBugView())
                                .font(.custom("DM Sans", size: UIScreen.main.bounds.height / 35))
                                .foregroundColor(.gray)
                        }
                            .frame(width: UIScreen.main.bounds.width / 1.2, alignment: .leading)
                    )
                    .shadow(radius: 10)
                
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
