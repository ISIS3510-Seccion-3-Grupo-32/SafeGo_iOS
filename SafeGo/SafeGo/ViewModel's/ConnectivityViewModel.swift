//
//  ConnectivityViewModel.swift
//  SafeGo
//
//  Created by Juan Martin Santos Ayala on 6/12/23.
//

import SwiftUI
import Network

class ConnectivityViewModel: ObservableObject {
    private var monitor = NWPathMonitor()
    @Published var isConnected: Bool = true

    init() {
        startMonitoring()
    }

    private func startMonitoring() {
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                self.isConnected = path.status == .satisfied
            }
        }
        let queue = DispatchQueue(label: "Monitor")
        monitor.start(queue: queue)
    }
}

