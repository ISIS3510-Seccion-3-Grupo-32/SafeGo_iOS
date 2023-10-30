//
//  SafeGo.swift
//  SafeGo
//
//  Created by Gabriela on 10/13/23.
//

import SwiftUI
import Network


class NetworkMonitor: ObservableObject {
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "NetworkMonitor")

    @Published var isOnline = true

    init() {
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                self.isOnline = (path.status == .satisfied)
            }
        }
        monitor.start(queue: queue)
    }
}


struct SafeGoView: View {
    @ObservedObject var networkMonitor = NetworkMonitor()
    @State private var showAlert = false

    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)

            Image("IconForApp")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .foregroundColor(.white)

            if !networkMonitor.isOnline {
                Button("Check Network") {
                    showAlert = true
                }
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Connection Not Active"),
                message: Text("You are not connected to the internet."),
                dismissButton: .default(Text("OK"))
            )
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

