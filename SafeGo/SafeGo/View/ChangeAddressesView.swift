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
    @StateObject var viewController = ChangeAddressesViewController()
    @State private var isAddressSaved = true
    @State private var showAlert = false
    @State private var alertMessage = ""
    @State private var navigateToHome = false

    var body: some View {
        VStack {
            HStack {
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

            Text("Change addresses")
                .font(Font.custom("DM Sans", size: 35))
                .foregroundColor(.white)
                .bold()
                .padding(.bottom, 10)
                .frame(width: UIScreen.main.bounds.width - 40,
                       alignment: .leading)
            Text("Simply click on an icon, write in your new address and then click on save changes")
                .font(Font.custom("DM Sans", size: 20))
                .foregroundColor(.white)
                .bold()
                .frame(width: UIScreen.main.bounds.width - 40,
                       alignment: .leading)

            Spacer()

            HStack {
                Button(action: {
                    selectedIcon = "house"
                    alertMessage = ""
                    toggleButtonSelection("house")
                }){
                    Image(systemName: "building")
                        .font(.system(size: 40))
                        .padding()
                        .foregroundColor(isButtonSelected["house"] == true ? .black : buttonColor)
                }

                Button(action: {
                    selectedIcon = "bag"
                    alertMessage = ""
                    toggleButtonSelection("bag")
                }) {
                    Image(systemName: "bag")
                        .font(.system(size: 40))
                        .padding()
                        .foregroundColor(isButtonSelected["bag"] == true ? .black : buttonColor)
                }

                Button(action: {
                    selectedIcon = "graduationcap"
                    alertMessage = ""
                    toggleButtonSelection("graduationcap")
                }) {
                    Image(systemName: "graduationcap")
                        .font(.system(size: 40))
                        .padding()
                        .foregroundColor(isButtonSelected["graduationcap"] == true ? .black : buttonColor)
                }

                Button(action: {
                    selectedIcon = "heart"
                    alertMessage = "" 
                    toggleButtonSelection("heart")
                }) {
                    Image(systemName: "heart")
                        .font(.system(size: 40))
                        .padding()
                        .foregroundColor(isButtonSelected["heart"] == true ? .black : buttonColor)
                }
            }

            Spacer()
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

            Spacer()
            Spacer()

            Button(action: {
                if selectedIcon.isEmpty {
                    alertMessage = "No icon selected. Please choose an icon to save the address."
                    showAlert = true
                } else {
                    viewController.saveAddressForSelectedIcon()
                    showAlert = true
                }
            }) {
                Text("Save changes")
                    .font(.custom("DM Sans", size: UIScreen.main.bounds.height / 35))
                    .padding()
                    .foregroundColor(.black)
                    .background(buttonColor)
                    .cornerRadius(10)
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Save Successful"),
                    message: Text("Address saved successfully."),
                    primaryButton: .default(Text("OK"), action: {
                        navigateToHome = true
                    }),
                    secondaryButton: .cancel()
                )
            }
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Error"),
                    message: Text(alertMessage),
                    dismissButton: .default(Text("OK"))
                )
            }

            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hex: 0x96CEB4))
        .fullScreenCover(isPresented: $navigateToHome) {
            HomeView()
        }
    }

    private func toggleButtonSelection(_ iconName: String) {
        for key in isButtonSelected.keys {
            isButtonSelected[key] = false
        }
        isButtonSelected[iconName] = true
    }
}

struct ChangeAddressesView_Previews: PreviewProvider 
{
    static var previews: some View 
    {
        ChangeAddressesView()
    }
}
