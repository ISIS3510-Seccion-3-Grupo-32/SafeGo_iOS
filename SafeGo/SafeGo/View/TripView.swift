//
//  TripView.swift
//  SafeGo
//
//  Created by Gabriela on 11/2/23.
//

import SwiftUI

struct TripView: View 
{
    var body: some View
    {
        NavigationView
        {
            VStack() {
                   
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
                    Spacer()
                    Spacer()
                    
                    VStack
                    {
                        HStack
                        {
                            Image(systemName: "clock")
                                .font(.system(size: 24))
                            Text("You will get there at")
                                .font(.system(size: 20))
                                .foregroundColor(.black)
                        }
                        
                        Text("Date and Time")
                            .font(.system(size: 20))
                            .bold()
                    }
                    Spacer()


                    VStack {
                        HStack
                        {
                            Image(systemName: "location.fill")
                                .font(.system(size: 24))
                            Text("You are going to")
                                .font(.system(size: 20))
                                .foregroundColor(.black)
                        }
                        Text("Destination")
                            .font(.system(size: 20))
                            .bold()
                    }
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    
                        HStack
                        {
                            
                            ButtonFactory.createButton(title: "Go [WIP]") {
                               HomeView()
                                    .navigationBarBackButtonHidden(true)
                            }
                            
                            //NavigationLink(destination: CurrentMapView())
                            //{
                              //  Text("Go")
                                //    .font(.system(size: 18))
                                  //  .bold()
                                    //.padding()
                                    //.background(Color(hex: 0xCFF2E5))
                                    //.foregroundColor(.black)
                                    //.cornerRadius(8)
                            }
                        }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(hex: 0x96CEB4))
        }
            
        }
    }



#Preview {
    TripView()
}
