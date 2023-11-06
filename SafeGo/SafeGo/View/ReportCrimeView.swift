//
//  ReportCrimeView.swift
//  SafeGo
//
//  Created by Gabriela on 10/12/23.
//

import SwiftUI

struct ReportCrimeView: View {

    @StateObject var viewController: ReportCrimesViewController

    @State private var isTextFieldExpanded = false
    @State private var descriptionText = ""

    var body: some View {
        NavigationView {
            
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

                    Text("Report a Crime")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding()

                    TextField("Description of the crime", text: $descriptionText)
                        .padding()
                        .frame(width: UIScreen.main.bounds.width / 1.2, height: isTextFieldExpanded ? UIScreen.main.bounds.height / 3 : UIScreen.main.bounds.height / 8)
                        .background(Color.white)
                        .cornerRadius(10)
                        .autocapitalization(.words)
                        .onTapGesture {
                            isTextFieldExpanded.toggle()
                        }

                
                ButtonFactory.createButton(title: "Send Report") {
                    viewController.sendDescription(descriptionText)
                }
                .alert(isPresented: $viewController.showAlert) {
                    Alert(title: Text("Report"), message: Text(viewController.alertMessage), dismissButton: .default(Text("OK")))
                }
               
                Spacer()
                
                }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(hex: 0x96CEB4))
            }
        }
    
}

struct ReportCrimeView_Previews: PreviewProvider {
    static var previews: some View {
        ReportCrimeView(viewController: ReportCrimesViewController(serviceAdapter: ServiceAdapter()))
    }
}
