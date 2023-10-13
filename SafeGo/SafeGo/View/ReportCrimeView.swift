//
//  ReportCrimeView.swift
//  SafeGo
//
//  Created by Gabriela on 10/12/23.
//

import SwiftUI

struct ReportCrimeView: View {
    
    @StateObject var viewModel = ReportCrimeViewViewModel()
    
    var body: some View 
    {
        NavigationView{
            
            
            ZStack
            {
                
                MapView() //Background
                
                RoundedRectangle(cornerRadius: 25)
                    .foregroundColor(Color(hex: 0x96CEB4))
                    .offset(y:520)
                
                
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
                    
                    Text("Report a Crime")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding()
                    
                    TextField("Description of Crime", text: $viewModel.writeaDescription)
                        .padding()
                        .frame(width: UIScreen.main.bounds.width/1.2, height: UIScreen.main.bounds.height / 8 )
                        .background(Color.white)
                        .cornerRadius(10)
                        .autocapitalization(.words)
                    
                    ButtonFactory.createButton(title: "Send Report") {
                        viewModel.sendReport()
                    }
                    
                    Spacer()
                    
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct ReportCrimeView_Previews: PreviewProvider {
    static var previews: some View {
        ReportCrimeView()
    }
}
