//
//  PQRView.swift
//  SafeGo
//
//  Created by Gabriela on 11/1/23.
//

import SwiftUI

struct PQRView: View 
{
    @StateObject var viewModel = ReportBugViewController()
    
    @State private var isTextFieldExpanded = false
    
    var body: some View
    {
        NavigationView{
            
            
            ZStack
            {
                
                //CurrentMapView() //Background
                
                RoundedRectangle(cornerRadius: 25)
                    .foregroundColor(Color(hex: 0x96CEB4))
                    .offset(y:420)
                
                
                VStack
                {
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    Text("Report a Suggestion")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding()
                    
                    TextField("Description of the suggestion", text: $viewModel.writeaDescription)
                        .padding()
                        .frame(width: UIScreen.main.bounds.width / 1.2, height: isTextFieldExpanded ? UIScreen.main.bounds.height / 4 : UIScreen.main.bounds.height / 8)
                        .background(Color.white)
                        .cornerRadius(10)
                        .autocapitalization(.words)
                    
                        // On tap gestuse is what is to happened when something is tapped, in this case the text field.
                        .onTapGesture {
                            isTextFieldExpanded.toggle() //A control that toggles between on and off states
                        }
                    
                    ButtonFactory.createButton(title: "Send Report")
                    {
                        viewModel.uploadToCloud()
                    }
                    
                    Spacer()
                    
                    .alert(isPresented: $viewModel.showAlert)
                    {
                        Alert(title: Text("Report"), message: Text(viewModel.alertMessage), dismissButton: .default(Text("OK")))
                    }
                    
                }
                
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}


#Preview 
{
    PQRView()
}
