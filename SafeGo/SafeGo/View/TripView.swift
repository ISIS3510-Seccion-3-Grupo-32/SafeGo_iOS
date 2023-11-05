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
            ZStack
            {
                Color(hex: 0x96CEB4)
                    .ignoresSafeArea()

                VStack(spacing: 20) {
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
                    Spacer()
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
                            
                            Button(action: {
                                // Handle the "Change Input Address" button action
                            }) {
                                Text("Change Input Address")
                                    .font(.system(size: 18))
                                    .bold()
                                    .padding()
                                    .background(Color(hex: 0xCFF2E5))
                                    .foregroundColor(.black)
                                    .cornerRadius(8)
                            }
                        }
                    Spacer()
                }
                .padding()
            }
            
            
            
        }
    }



#Preview {
    TripView()
}
