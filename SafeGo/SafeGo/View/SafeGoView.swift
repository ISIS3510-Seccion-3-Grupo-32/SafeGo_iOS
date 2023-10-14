//
//  SafeGo.swift
//  SafeGo
//
//  Created by Gabriela on 10/13/23.
//

import SwiftUI

struct SafeGoView: View 
{
    var body: some View 
    {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            Image("IconForApp")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .foregroundColor(.white)
        }
    }
}

struct SafeGo_Previews: PreviewProvider
{
    static var previews: some View 
    {
        SafeGoView()
    }
}

