//
//  HomeView.swift
//  SafeGo
//
//  Created by Pipe on 22/09/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewViewModel()
    @StateObject var logoutViewModel = LoginViewViewModel(authService: AuthService(networkService: NetworkService(), authStateManager: AuthStateManager()))
    
    var body: some View {
        
        VStack{
            Spacer()
            ZStack{
                RoundedRectangle(cornerRadius: 25)
                    .foregroundColor(Color(hex: 0x96CEB4))
                    .offset(y:40)
                VStack{
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    //Where to
                    HStack{
                        TextField("Where to?", text: $viewModel.whereto)
                            .padding()
                            .frame(height: UIScreen.main.bounds.height / 12, alignment: .leading)
                            .background(Color.white)
                            .cornerRadius(10)
                            .font(.custom("DM Sans", size: UIScreen.main.bounds.height / 35))
                            .foregroundColor(.gray)

                        NavigationLink {
                            TravelsView()
                        } label: {
                            Image("calendar")
                                .frame(width: UIScreen.main.bounds.width / 5, height: UIScreen.main.bounds.height / 11)
                        }
                    }
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    //Home
                    ZStack{
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundColor(Color(hex: 0xCFF2E5))
                            .frame(height: UIScreen.main.bounds.height / 12)
                        HStack{
                            Image("house")
                                .frame(width: UIScreen.main.bounds.width / 10, height: UIScreen.main.bounds.height / 10)
                                .padding(.horizontal, UIScreen.main.bounds.width / 15)
                            NavigationLink("Home", destination: MainView())
                                .font(.custom("DM Sans", size: UIScreen.main.bounds.height / 35))
                                .foregroundColor(.gray)
                        }
                        .frame(width: UIScreen.main.bounds.width / 1.2, alignment: .leading)
                    }.shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                               
                    //Work
                    ZStack{
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundColor(Color(hex: 0xCFF2E5))
                            .frame(height: UIScreen.main.bounds.height / 12)
                        HStack{
                            Image("work")
                                .frame(width: UIScreen.main.bounds.width / 10, height: UIScreen.main.bounds.height / 10)
                                .padding(.horizontal, UIScreen.main.bounds.width / 15)
                            NavigationLink("Work", destination: MainView())
                                .font(.custom("DM Sans", size: UIScreen.main.bounds.height / 35))
                                .foregroundColor(.gray)
                        }
                        .frame(width: UIScreen.main.bounds.width / 1.2, alignment: .leading)
                    }.shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    //Educatioon
                    ZStack{
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundColor(Color(hex: 0xCFF2E5))
                            .frame(height: UIScreen.main.bounds.height / 12)
                        HStack{
                            Image("education")
                                .frame(width: UIScreen.main.bounds.width / 10, height: UIScreen.main.bounds.height / 10)
                                .padding(.horizontal, UIScreen.main.bounds.width / 15)
                            NavigationLink("Education", destination: MainView())
                                .font(.custom("DM Sans", size: UIScreen.main.bounds.height / 35))
                                .foregroundColor(.gray)
                        }
                        .frame(width: UIScreen.main.bounds.width / 1.2, alignment: .leading)
                    }.shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    //Partner
                    ZStack{
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundColor(Color(hex: 0xCFF2E5))
                            .frame(height: UIScreen.main.bounds.height / 12)
                        HStack{
                            Image("partner")
                                .frame(width: UIScreen.main.bounds.width / 10, height: UIScreen.main.bounds.height / 10)
                                .padding(.horizontal, UIScreen.main.bounds.width / 15)
                            NavigationLink("Partner", destination: MainView())
                                .font(.custom("DM Sans", size: UIScreen.main.bounds.height / 35))
                                .foregroundColor(.gray)
                        }
                        .frame(width: UIScreen.main.bounds.width / 1.2, alignment: .leading)
                    }.shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    
                    SGButtonLR(title: "logout"){
                        viewModel.logOut()
                    }
                    
                }
                .padding()
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/1.6)
            .background(
                Image("Map")
                    .resizable()
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .frame(width: UIScreen.main.bounds.width * 1.2,
                           height: UIScreen.main.bounds.height * 1.2)
                    .blur(radius: 1.8))
        }
    }
}
#Preview {
    HomeView()
}
