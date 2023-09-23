//
//  HomeView.swift
//  SafeGo
//
//  Created by Pipe on 22/09/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewViewModel()
    @State private var buttonHome = false
    @State var selection: Int? = nil
    
    var body: some View {
        
        VStack{
            Spacer()
            ZStack{
                RoundedRectangle(cornerRadius: 25)
                    .foregroundColor(Color(hex: 0x96CEB4))
                    .offset(y:40)
                
                VStack{
                    
                    //Where to
                    HStack{
                        TextField("Where to?", text: $viewModel.whereto)
                            .padding()
                            .frame(height: UIScreen.main.bounds.height / 12, alignment: .leading)
                            .background(Color.white)
                            .cornerRadius(10)
                            .font(.custom("DM Sans", size: UIScreen.main.bounds.height / 35))
                            .foregroundColor(.gray)

                        Button{

                        }label: {
                            Image("calendar")
                                .frame(width: UIScreen.main.bounds.width / 5, height: UIScreen.main.bounds.height / 11)
                        }
                    }
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    
                    //Home
                    Button(action: {
                        self.buttonHome = true
                    }, label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 25)
                                .foregroundColor(Color(hex: 0xCFF2E5))
                                .frame(height: UIScreen.main.bounds.height / 12)
                            HStack{
                                Image("house")
                                    .frame(width: UIScreen.main.bounds.width / 10, height: UIScreen.main.bounds.height / 10)
                                    .padding(.horizontal, UIScreen.main.bounds.width / 15)
                                Text("Home")
                                    .font(.custom("DM Sans", size: UIScreen.main.bounds.height / 35))
                                    .foregroundColor(.gray)
                                
                                
                            }
                            .frame(width: UIScreen.main.bounds.width / 1.2, alignment: .leading)
                        }
                    })
                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                               
                    //Work

                    NavigationLink(destination: Text("Test"), tag: 1, selection: $selection) {
                        Button(action: {
                            print("login tapped")
                            self.selection = 1
                        }) {
                            HStack {
                                Spacer()
                                Text("Login").foregroundColor(Color.white).bold()
                                Spacer()
                            }
                        }
                        .accentColor(Color.black)
                        .padding()
                        .background(Color(UIColor.darkGray))
                        .cornerRadius(4.0)
                        .padding(Edge.Set.vertical, 20)
                    }
                    
                        
                }
                .padding()


            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/1.9)
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
