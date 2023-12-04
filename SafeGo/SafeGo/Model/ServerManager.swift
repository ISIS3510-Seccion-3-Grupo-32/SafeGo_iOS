//
//  ServerManager.swift
//  SafeGo
//
//  Created by Juan Martin Santos Ayala on 4/12/23.
//

import Foundation

class ServerManager {
    static let shared = ServerManager()
    
    var serverAddresses: [String: String] = [:]
    
    private init() {
        loadConfig()
    }
    
    private func loadConfig() {
        guard let path = Bundle.main.path(forResource: "Config", ofType: "json") else {
            fatalError("Config.json not found.")
        }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let json = try JSONSerialization.jsonObject(with: data, options: [])
            if let config = json as? [String: String] {
                serverAddresses = config
            } else {
                fatalError("Error parsing Config.json")
            }
            
        } catch {
            fatalError("Error loading Config.json: \(error.localizedDescription)")
        }
    }
}
