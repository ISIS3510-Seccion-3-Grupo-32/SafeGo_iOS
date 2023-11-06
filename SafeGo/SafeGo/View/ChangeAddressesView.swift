//
//  ChangeAddressesView.swift
//  SafeGo
//
//  Created by Gabriela on 11/5/23.
//

import SwiftUI

struct ChangeAddressesView: View {
    @State private var selectedIcon: String = "house"
    @State private var buttonColor: Color = Color(hex: 0xCFF2E5)
    @State private var isButtonSelected: [String: Bool] = ["house": false, "bag": false, "graduationcap": false, "heart": false]
    @State private var whereTo: String = ""

    var body: some View {
        ZStack {
            Color(hex: 0x96CEB4)
                .ignoresSafeArea()

            VStack {
                HStack {
                    Button(action: {
                        selectedIcon = "house"
                        toggleButtonSelection("house")
                    }) {
                        Image(systemName: "house")
                            .font(.system(size: 40))
                            .padding()
                            .foregroundColor(isButtonSelected["house"] == true ? .black : buttonColor)
                    }

                    Button(action: {
                        selectedIcon = "bag"
                        toggleButtonSelection("bag")
                    }) {
                        Image(systemName: "bag")
                            .font(.system(size: 40))
                            .padding()
                            .foregroundColor(isButtonSelected["bag"] == true ? .black : buttonColor)
                    }

                    Button(action: {
                        selectedIcon = "graduationcap"
                        toggleButtonSelection("graduationcap")
                    }) {
                        Image(systemName: "graduationcap")
                            .font(.system(size: 40))
                            .padding()
                            .foregroundColor(isButtonSelected["graduationcap"] == true ? .black : buttonColor)
                    }

                    Button(action: {
                        selectedIcon = "heart"
                        toggleButtonSelection("heart")
                    }) {
                        Image(systemName: "heart")
                            .font(.system(size: 40))
                            .padding()
                            .foregroundColor(isButtonSelected["heart"] == true ? .black : buttonColor)
                    }
                }

                Spacer()

                TextField("Where to?", text: $whereTo)
                    .padding()
                    .frame(width: UIScreen.main.bounds.width / 1.4,
                           height: UIScreen.main.bounds.height / 15,
                           alignment: .center)
                    .background(Color.white)
                    .cornerRadius(10)
                    .font(.custom("DM Sans", size: UIScreen.main.bounds.height / 35))
                    .foregroundColor(.gray)
                    .shadow(radius: 10)

                Button(action: {
                    // No se que hace. donde lo vamos aguardar?
                }) {
                    Text("Change")
                        .font(.custom("DM Sans", size: UIScreen.main.bounds.height / 35))
                        .padding()
                        .foregroundColor(.black)
                        .background(buttonColor)
                        .cornerRadius(10)
                }
                .padding(.top, 20)
            }
        }
    }

    private func toggleButtonSelection(_ iconName: String) {
        for key in isButtonSelected.keys {
            isButtonSelected[key] = false
        }
        isButtonSelected[iconName] = true
    }
}

struct ChangeAddressesView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeAddressesView()
    }
}
