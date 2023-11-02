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
            Spacer()

            ZStack{
                RoundedRectangle(cornerRadius: 25)
                    .foregroundColor(Color(hex: 0x96CEB4))
                    .offset(y:40)
                VStack{
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
                        .frame(height: UIScreen.main.bounds.height / 15)
                        .background(Color.white)
                        .cornerRadius(10)
                        .autocapitalization(.words)
                    //Trip2
                    TextField("Trip2", text: $viewModel.travel2)
                        .font(Font.custom("DM Sans", size: 17))
                        .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        .padding()
                        .frame(height: UIScreen.main.bounds.height / 15)
                        .background(Color.white)
                        .cornerRadius(10)
                        .autocapitalization(.words)
                    //Trip3
                    TextField("Trip3", text: $viewModel.travel3)
                        .font(Font.custom("DM Sans", size: 17))
                        .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        .padding()
                        .frame(height: UIScreen.main.bounds.height / 15)
                        .background(Color.white)
                        .cornerRadius(10)
                        .autocapitalization(.words)
                    //Trip4
                    TextField("Trip4", text: $viewModel.travel4)
                        .font(Font.custom("DM Sans", size: 17))
                        .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                        .padding()
                        .frame(height: UIScreen.main.bounds.height / 15)
                        .background(Color.white)
                        .cornerRadius(10)
                        .autocapitalization(.words)
                    
                    SGButtonLR(title: "Log Out") {
                        viewModel.logOut()
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
    TravelsView()
}
