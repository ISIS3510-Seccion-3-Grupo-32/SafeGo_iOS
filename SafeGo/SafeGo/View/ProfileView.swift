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
    @State private var selectedImage: Image? = nil
    @State private var userDefaultsKey = "profileImage" // Add a userDefaultsKey state variable
    
    @StateObject private var connectivityViewModel = ConnectivityViewModel()
    @StateObject var connectivityViewController = ConnectivityViewController()

    var body: some View {
        
        Group {
            if connectivityViewModel.isConnected {
                NavigationView {
                    ZStack {
                        Color(hex: 0x96CEB4)
                            .ignoresSafeArea()
                        VStack {
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
                                    NavigationLink(destination: UserComplaintsView()
                                        .navigationBarBackButtonHidden(true))
                                    {
                                        Image(systemName: "line.horizontal.3")
                                            .foregroundColor(.black)
                                            .font(.system(size: 40))
                                    }
                                }
                                .frame(width: UIScreen.main.bounds.width / 1.2)
                            
                            Text("Profile")
                                .frame(width: UIScreen.main.bounds.width / 1.4,
                                       height: UIScreen.main.bounds.height / 15,
                                       alignment: .center)
                                .cornerRadius(10)
                                .font(.custom("DM Sans", size: UIScreen.main.bounds.height / 25))
                                .foregroundColor(.white)
                            
                            Button(action: {
                                showImagePicker = true
                            }) {
                                (selectedImage ?? profileImage)
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .foregroundColor(.white)
                                    .padding()
                            }
                            Spacer()
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
                            Spacer()
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
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                        }
                    }
                    .sheet(isPresented: $showImagePicker) {
                        ProfileViewController(image: $selectedImage, userDefaultsKey: $userDefaultsKey) // Pass userDefaultsKey as a binding
                    }
                }
                .onAppear {
                    if let imageData = UserDefaults.standard.data(forKey: userDefaultsKey) {
                        if let uiImage = UIImage(data: imageData) {
                            profileImage = Image(uiImage: uiImage)
                        }
                    }
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

struct ProfileView_Previews: PreviewProvider 
{
    static var previews: some View 
    {
        ProfileView()
    }
}
