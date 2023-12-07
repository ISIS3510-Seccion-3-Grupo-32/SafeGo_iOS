//
//  PQRView.swift
//  SafeGo
//
//  Created by Gabriela on 11/5/23.
//

import SwiftUI

struct ReportSuggestionsView: View {
    
    @StateObject var serviceAdapter = ServiceAdapter()
    @StateObject var viewController: ReportSuggestionsViewController
    @StateObject private var connectivityViewModel = ConnectivityViewModel()
    @StateObject var connectivityViewController = ConnectivityViewController()

    @State private var isTextFieldExpanded = false
    @State private var descriptionText = ""
    
    var body: some View {
        Group {
            if connectivityViewModel.isConnected {
                NavigationView {
                    VStack {
                        HStack()
                        {
                            NavigationLink(destination: HomeView()
                                .navigationBarBackButtonHidden(true)) {
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
                        
                        Image(systemName: "pencil")
                            .foregroundColor(.black)
                            .font(.system(size: 80))

                        Spacer()
                        
                            Text("Give us a suggestion")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .padding()
                                .multilineTextAlignment(.center)

                            TextField("Description of your suggestion", text: $descriptionText)
                                .padding()
                                .frame(width: UIScreen.main.bounds.width / 1.2, height: isTextFieldExpanded ? UIScreen.main.bounds.height / 3 : UIScreen.main.bounds.height / 8)
                                .background(Color.white)
                                .cornerRadius(10)
                                .autocapitalization(.words)
                                .onTapGesture {
                                    isTextFieldExpanded.toggle()
                                }

                        
                        ButtonFactory.createButton(title: "Send Suggestion") {
                            viewController.sendDescription(descriptionText)
                        }
                        .alert(isPresented: $viewController.showAlert) {
                            Alert(title: Text("Suggestion"), message: Text(viewController.alertMessage), dismissButton: .default(Text("OK")))
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

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, xrOS 1.0, *)
struct PQRView_Previews: PreviewProvider {
    static var previews: some View {
        ReportSuggestionsView(viewController: ReportSuggestionsViewController(serviceAdapter: ServiceAdapter()))
    }
}
