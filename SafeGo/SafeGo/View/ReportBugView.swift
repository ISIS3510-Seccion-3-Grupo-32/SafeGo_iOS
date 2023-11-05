//
//  ReportBugView.swift
//  SafeGo
//
//  Created by Gabriela on 10/30/23.
//

import SwiftUI

struct ReportBugView: View
{
    
        @StateObject var serviceAdapter = ServiceAdapter()
        @StateObject var viewController: ReportBugViewController

        @State private var isTextFieldExpanded = false
        @State private var description = ""
    
    init() {
            _viewController = StateObject(wrappedValue: ReportBugViewController(serviceAdapter: serviceAdapter))
        }
    
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
                    
                    Text("Report a Bug")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding()
                    
                    TextField("Whats wrong with the app", text: $description)
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
                        viewController.sendDescription(description)
                    }
                    
                    Spacer()
                    
                }
                
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct ReportBugView_Previews: PreviewProvider {
    static var previews: some View {
        ReportBugView()
    }
}
