//
//  ReportBugView.swift
//  SafeGo
//
//  Created by Gabriela on 10/30/23.
//

import SwiftUI

struct ReportBugView: View {
    
    @StateObject var serviceAdapter = ServiceAdapter()
    @StateObject var viewController: ReportBugViewController
    @StateObject private var connectivityViewModel = ConnectivityViewModel()
    @StateObject var connectivityViewController = ConnectivityViewController()

    @State private var isTextFieldExpanded = false
    @State private var descriptionText = ""

    
    var body: some View {
        Group {
            if connectivityViewModel.isConnected {
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
                        
                        Image(systemName: "speaker.wave.2")
                            .foregroundColor(.black)
                            .font(.system(size: 80))

                        Spacer()
                        
                            Text("Report an issue \nwith the app")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .padding()
                                .multilineTextAlignment(.center)

                            TextField("Whats wrong with the app", text: $descriptionText)
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
                        Spacer()

                        
                        }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color(hex: 0x96CEB4))
                }
            } else {
                NoConnectionView()
            }
        }
        .onAppear {
            connectivityViewModel.isConnected = connectivityViewController.isConnectedToInternet()
        }
    }
}

struct ReportBugView_Previews: PreviewProvider {
    static var previews: some View {
        ReportBugView(viewController: ReportBugViewController(serviceAdapter: ServiceAdapter()))

    }
}
