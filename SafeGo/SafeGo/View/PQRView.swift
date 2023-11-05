//
//  PQRView.swift
//  SafeGo
//
//  Created by Gabriela on 11/5/23.
//

import SwiftUI

struct PQRView: View
{
    
        @StateObject var serviceAdapter = ServiceAdapter()
        @StateObject var viewController: ReportSuggestionsViewController

        @State private var isTextFieldExpanded = false
        @State private var descriptionText = ""

    
    
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
                    
                    TextField("Description of your suggestion", text: $descriptionText)
                        .padding()
                        .frame(width: UIScreen.main.bounds.width / 1.2, height: isTextFieldExpanded ? UIScreen.main.bounds.height / 4 : UIScreen.main.bounds.height / 8)
                        .background(Color.white)
                        .cornerRadius(10)
                        .autocapitalization(.words)
                        .onTapGesture {
                            isTextFieldExpanded.toggle()
                        }
                    
                    Button("Send Report")
                    {
                        viewController.sendDescription(descriptionText)
                    }
                    
                    Spacer()
                    
                }
                
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, xrOS 1.0, *)
struct PQRView_Previews: PreviewProvider {
    static var previews: some View {
        PQRView(viewController: ReportSuggestionsViewController(serviceAdapter: ServiceAdapter()))
    }
}
