//
//  UserComplaintsView.swift
//  SafeGo
//
//  Created by Gabriela on 10/30/23.
//

import SwiftUI

struct UserComplaintsView: View 
{
    var body: some View 
    {
        ZStack
        {
            VStack
            {
                Link("PQRS", destination: URL(string: "https://forms.gle/UPGXXCDFYLrQNY9i9")!)
                    .foregroundColor(.blue)
            }
            
        }
        
        
    }
}

#Preview {
    UserComplaintsView()
}
