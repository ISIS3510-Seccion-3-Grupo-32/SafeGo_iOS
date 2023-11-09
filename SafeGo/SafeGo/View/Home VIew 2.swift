//
//  Home VIew 2.swift
//  SafeGo
//
//  Created by Gabriela on 11/3/23.
//

import SwiftUI

struct Home_VIew_2: View {
    var body: some View
    {
        HStack {
            // Home
            NavigationLink(destination: TripView()) {
                RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)) // Smaller corner radius
                    .foregroundColor(Color(hex: 0xCFF2E5))
                    .frame(width: UIScreen.main.bounds.width / 5, height: UIScreen.main.bounds.height / 15) // Smaller size
                    .overlay(
                        Image(systemName: "house")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width / 8, height: UIScreen.main.bounds.height / 20)
                            .foregroundColor(.black)
                    )
                    .shadow(radius: 5) // Smaller shadow radius
            }

            Spacer()

            // Work
            NavigationLink(destination: TripView()) {
                RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                    .foregroundColor(Color(hex: 0xCFF2E5))
                    .frame(width: UIScreen.main.bounds.width / 5, height: UIScreen.main.bounds.height / 15)
                    .overlay(
                        Image(systemName: "bag")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width / 8, height: UIScreen.main.bounds.height / 20)
                            .foregroundColor(.black)
                    )
                    .shadow(radius: 5)
            }

            Spacer()

            // Education
            NavigationLink(destination: TripView()) {
                RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                    .foregroundColor(Color(hex: 0xCFF2E5))
                    .frame(width: UIScreen.main.bounds.width / 5, height: UIScreen.main.bounds.height / 15)
                    .overlay(
                        Image(systemName: "graduationcap")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width / 8, height: UIScreen.main.bounds.height / 20)
                            .foregroundColor(.black)
                    )
                    .shadow(radius: 5)
            }

            Spacer()

            // Partner
            NavigationLink(destination: TripView()) {
                RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                    .foregroundColor(Color(hex: 0xCFF2E5))
                    .frame(width: UIScreen.main.bounds.width / 5, height: UIScreen.main.bounds.height / 15)
                    .overlay(
                        Image(systemName: "heart")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width / 8, height: UIScreen.main.bounds.height / 20)
                            .foregroundColor(.black)
                    )
                    .shadow(radius: 5)
            }
        }

    }
}

#Preview {
    Home_VIew_2()
}
