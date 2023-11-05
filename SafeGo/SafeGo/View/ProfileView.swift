//
//  ProfileView.swift
//  SafeGo
//
//  Created by Gabriela on 11/4/23.
//

import SwiftUI

struct ProfileView: View {
    @State private var profileImage: Image = Image(systemName: "person.circle")
    @State private var showImagePicker = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: 0x96CEB4)
                    .ignoresSafeArea()
                
                VStack {
                    
                    Button(action: {
                        showImagePicker = true
                    }) {
                        profileImage
                            .resizable()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.white)
                            .padding()
                    }
                    
                    // See your travel History button
                    NavigationLink(destination: TravelsView()) {
                                            RoundedRectangle(cornerSize: CGSize(width: 25, height: 25))
                                                .foregroundColor(Color(hex: 0xCFF2E5))
                                                .frame(width: UIScreen.main.bounds.width / 1.1, height: UIScreen.main.bounds.height / 12)
                                                .overlay(
                                                    HStack {
                                                        Image(systemName: "calendar")
                                                            .font(.system(size: 60))
                                                            .frame(width: UIScreen.main.bounds.width / 10, height: UIScreen.main.bounds.height / 10)
                                                            .padding(.horizontal, UIScreen.main.bounds.width / 15)
                                                            .foregroundColor(.black)
                                                        Text("Travel History")
                                                            .font(.custom("DM Sans", size: UIScreen.main.bounds.height / 35))
                                                            .foregroundColor(.gray)
                                                    }
                                                    .frame(width: UIScreen.main.bounds.width / 1.2, alignment: .leading)
                                                )
                                                .shadow(radius: 10)
                                        }
                    
                    // Change Address Button
                    NavigationLink(destination: ChangeAddressesView()) {
                                           RoundedRectangle(cornerSize: CGSize(width: 25, height: 25))
                                               .foregroundColor(Color(hex: 0xCFF2E5))
                                               .frame(width: UIScreen.main.bounds.width / 1.1, height: UIScreen.main.bounds.height / 12)
                                               .overlay(
                                                   HStack {
                                                       Image(systemName: "location")
                                                           .font(.system(size: 60))
                                                           .frame(width: UIScreen.main.bounds.width / 10, height: UIScreen.main.bounds.height / 10)
                                                           .padding(.horizontal, UIScreen.main.bounds.width / 15)
                                                           .foregroundColor(.black)
                                                       Text("Change Address")
                                                           .font(.custom("DM Sans", size: UIScreen.main.bounds.height / 35))
                                                           .foregroundColor(.gray)
                                                   }
                                                   .frame(width: UIScreen.main.bounds.width / 1.2, alignment: .leading)
                                               )
                                               .shadow(radius: 10)
                                       }
                    
                    Spacer()
                }
            }
            .navigationBarTitle("Profile")
        }
    }
}

#Preview {
    ProfileView()
}
