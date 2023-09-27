//
//  navigationTest.swift
//  SafeGo
//
//  Created by Pipe on 25/09/23.
//

import SwiftUI

struct navigationTest: View {
    var body: some View {
            
        NavigationStack {
          VStack {
           NavigationLink("Go to screen 1", value: "1")
           Spacer().frame(height: 10)
           NavigationLink("Go to screen 2", value: "2")
         
          }.navigationDestination(for: String.self) { value in
           Text("This is screen number \(value)")
          }
         }
            

    }
}

#Preview {
    navigationTest()
}
