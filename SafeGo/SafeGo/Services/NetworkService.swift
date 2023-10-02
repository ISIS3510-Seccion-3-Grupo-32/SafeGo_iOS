//
//  NetworkService.swift
//  SafeGo
//
//  Created by Juan Martin Santos Ayala on 1/10/23.
//

import Foundation

class NetworkService {
    private let session: URLSession

    init() {
        let configuration = URLSessionConfiguration.default
        configuration.httpCookieStorage = HTTPCookieStorage.shared
        self.session = URLSession(configuration: configuration)
    }

    func request(endpoint: String, method: String, parameters: [String: Any]?, completion: @escaping (HTTPURLResponse?) -> Void) {
        guard let url = URL(string: endpoint) else {
            completion(nil)
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = method
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        if let parameters = parameters {
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                completion(nil)
                return
            }
        }

        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                completion(nil)
                return
            }

            guard let httpResponse = response as? HTTPURLResponse else {
                completion(nil)
                return
            }

            // Handle cookies
            if let cookies = HTTPCookieStorage.shared.cookies(for: url) {
                for cookie in cookies {
                    print("Received cookie: \(cookie.name)")
                }
            }

            completion(httpResponse)
        }

        task.resume()
    }
}


