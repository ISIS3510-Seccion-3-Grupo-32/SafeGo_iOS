//
//  HomeView.swift
//  SafeGo
//
//  Created by Pipe on 22/09/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewViewModel()
    
    
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
                            .frame(height: UIScreen.main.bounds.height / 15, alignment: .leading)
                            .background(Color.white)
                            .cornerRadius(10)
                            .autocapitalization(.words)
                        
                        Button{

                        }label: {
                            Image()
                        }
                    }
                    
                    //Home
                    Button{
                        
                    }label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 25)
                                .foregroundColor(Color(hex: 0xCFF2E5))
                                .frame(height: UIScreen.main.bounds.height / 15)
                            HStack{
                                Text("Home")
                                    .font(.custom("DM Sans", size: UIScreen.main.bounds.height / 35))
                                    .foregroundColor(.gray)
                                
                                //FOTO ICONO
                            }
                        }
                    }
                    
                    //NEXT

                    
                        
                }
                .padding()


            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/1.9)
             
        }
    }
}
#Preview {
    HomeView()
}
