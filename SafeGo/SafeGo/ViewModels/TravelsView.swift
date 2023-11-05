//
//  TravelsView.swift
//  SafeGo
//
//  Created by Juan Felipe on 1/11/23.
//

import SwiftUI

struct TravelsView: View {
    @StateObject var viewModel = TravelsViewController()

    var body: some View {
        
        VStack{
            HStack
            {
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
            
                    Text("Travel History:")
                        .font(Font.custom("DM Sans", size: 30))
                        .foregroundColor(.white)
                        .bold()
                        .padding(.bottom, 10)
                        .frame(width: UIScreen.main.bounds.width - 40,
                               alignment: .leading)
                    
                    //Trip1
                    TextField("Trip1", text: $viewModel.travel1)
                        .font(Font.custom("DM Sans", size: 17))
                        .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        .padding()
                        .frame(width: UIScreen.main.bounds.width / 1.2, height: UIScreen.main.bounds.height / 15)
                        .background(Color.white)
                        .cornerRadius(10)
                        .autocapitalization(.words)
                    //Trip2
                    TextField("Trip2", text: $viewModel.travel2)
                        .font(Font.custom("DM Sans", size: 17))
                        .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        .padding()
                        .frame(width: UIScreen.main.bounds.width / 1.2, height: UIScreen.main.bounds.height / 15)
                        .background(Color.white)
                        .cornerRadius(10)
                        .autocapitalization(.words)
                    //Trip3
                    TextField("Trip3", text: $viewModel.travel3)
                        .font(Font.custom("DM Sans", size: 17))
                        .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        .padding()
                        .frame(width: UIScreen.main.bounds.width / 1.2, height: UIScreen.main.bounds.height / 15)
                        .background(Color.white)
                        .cornerRadius(10)
                        .autocapitalization(.words)
                    //Trip4
                    TextField("Trip4", text: $viewModel.travel4)
                        .font(Font.custom("DM Sans", size: 17))
                        .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        .padding()
                        .frame(width: UIScreen.main.bounds.width / 1.2, height: UIScreen.main.bounds.height / 15)
                        .background(Color.white)
                        .cornerRadius(10)
                        .autocapitalization(.words)
            
            Spacer()

            }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hex: 0x96CEB4))
        }
}

#Preview {
    TravelsView()
}
