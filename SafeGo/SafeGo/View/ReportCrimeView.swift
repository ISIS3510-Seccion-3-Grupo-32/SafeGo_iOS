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
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .foregroundColor(Color(hex: 0x96CEB4))
                    .offset(y: 420)

                VStack {
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()

                    Text("Report a Crime")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding()

                    TextField("Description of the crime", text: $descriptionText)
                        .padding()
                        .frame(width: UIScreen.main.bounds.width / 1.2, height: isTextFieldExpanded ? UIScreen.main.bounds.height / 4 : UIScreen.main.bounds.height / 8)
                        .background(Color.white)
                        .cornerRadius(10)
                        .autocapitalization(.words)
                        .onTapGesture {
                            isTextFieldExpanded.toggle()
                        }

                    Button("Send Report") {
                        viewController.sendDescription(descriptionText)
                    }

                    Spacer()

                    .alert(isPresented: $viewController.showAlert) {
                        Alert(title: Text("Report"), message: Text(viewController.alertMessage), dismissButton: .default(Text("OK")))
                    }
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct ReportCrimeView_Previews: PreviewProvider {
    static var previews: some View {
        ReportCrimeView(viewController: ReportCrimesViewController(serviceAdapter: ServiceAdapter()))
    }
}
