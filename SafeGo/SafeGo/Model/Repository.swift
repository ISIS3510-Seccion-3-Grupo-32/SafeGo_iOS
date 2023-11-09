//
//  Repository.swift
//  SafeGo
//
//  Created by Gabriela on 11/5/23.
//

import Foundation
import Network

class NetworkManager 
{
    static let shared = NetworkManager()
    private let monitor = NWPathMonitor()
    private var isConnected: Bool = false

    private init() {
        startMonitoring()
    }

    private func startMonitoring() {
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                self.isConnected = true
            } else {
                self.isConnected = false
            }
        }

        let queue = DispatchQueue(label: "NetworkMonitor")
        monitor.start(queue: queue)
    }

    func isNetworkAvailable() -> Bool {
        return isConnected
    }
}
