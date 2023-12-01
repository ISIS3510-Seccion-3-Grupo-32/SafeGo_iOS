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
            HStack()
            {
                NavigationLink(destination: HomeView()
                    .navigationBarBackButtonHidden(true))
                {
                    Image(systemName: "house.fill")
                        .foregroundColor(.black)
                        .font(.system(size: 40))
                }
                .navigationBarBackButtonHidden(true)
                
                
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
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
            
            Spacer()
            
                TextField("Trip1", text: $viewModel.travel1)
                            .font(Font.custom("DM Sans", size: 17))
                            .disabled(true)
                            .padding()
                            .frame(width: UIScreen.main.bounds.width / 1.2, height: UIScreen.main.bounds.height / 15)
                            .background(Color.white)
                            .cornerRadius(10)
                            .autocapitalization(.words)
                    
                    //Trip2
                TextField("Trip2", text: $viewModel.travel2)
                        .font(Font.custom("DM Sans", size: 17))
                        .disabled(true)
                        .padding()
                        .frame(width: UIScreen.main.bounds.width / 1.2, height: UIScreen.main.bounds.height / 15)
                        .background(Color.white)
                        .cornerRadius(10)
                        .autocapitalization(.words)
            
                    //Trip3
                TextField("Trip3", text: $viewModel.travel3)
                        .font(Font.custom("DM Sans", size: 17))
                        .disabled(true)
                        .padding()
                        .frame(width: UIScreen.main.bounds.width / 1.2, height: UIScreen.main.bounds.height / 15)
                        .background(Color.white)
                        .cornerRadius(10)
                        .autocapitalization(.words)
            
                    //Trip4
                TextField("Trip4", text: $viewModel.travel4)
                        .font(Font.custom("DM Sans", size: 17))
                        .disabled(true)
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
