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
        ZStack 
        {
            
            MapView() //Background
                
            Spacer()
            Spacer()
            Spacer()

            
                RoundedRectangle(cornerRadius: 25)
                    .foregroundColor(Color(hex: 0x96CEB4))
                    .offset(y:40)
            
                VStack
                {
                    Text("Report a Crime")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding()
                    
                    TextField("Description of Crime", text: $viewModel.writeaDescription)
                        .padding()
                        .frame(height: UIScreen.main.bounds.height / 15)
                        .background(Color.white)
                        .cornerRadius(10)
                        .autocapitalization(.words)
                    
                }

                
            
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ReportCrimeView_Previews: PreviewProvider {
    static var previews: some View {
        ReportCrimeView()
    }
}
