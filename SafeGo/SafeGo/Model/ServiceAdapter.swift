//
//  ServiceAdapter.swift
//  SafeGo
//
//  Created by Gabriela on 11/5/23.
//
// Upload to cloud. Everything that has to do with firebase


import Foundation
import Firebase
import FirebaseAuth

class ServiceAdapter: ObservableObject 
{

    @Published var showAlert = false
    @Published var alertMessage = ""

    private let db = Firestore.firestore()
    private let collectionReferenceSuggestions = "suggReports"
    private let collectionReferenceBugs = "bugReports"
    private let collectionReferenceCrimes = "crimeReports"
    private let collectionReferenceUser = "users"
    let serverAddress = ServerManager.shared.serverAddresses["ServerAddress"]

    func uploadToCloudSuggestions(description: String, completion: @escaping (Result<Void, Error>) -> Void) {
            let data = ["description": description]

            db.collection(collectionReferenceSuggestions).addDocument(data: data) { error in
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.success(()))
                }
            }
        }

    func uploadUserToCloud(user: User, completion: @escaping (Result<Void, Error>) -> Void) {
        // Crear una cola de despacho global para realizar operaciones en segundo plano
        let queue = DispatchQueue.global(qos: .background)

        // Ejecutar la operación de carga en segundo plano
        queue.async {
            self.db.collection(self.collectionReferenceUser).document(user.id).setData(user.asDictionary()) { error in
                if let error = error {
                    // Si hay un error, llamar al bloque de finalización en el hilo principal
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
                } else {
                    // Si la operación es exitosa, llamar al bloque de finalización en el hilo principal
                    DispatchQueue.main.async {
                        completion(.success(()))
                    }
                }
            }
        }
    }


    func uploadToCloudBugs(description: String, completion: @escaping (Result<Void, Error>) -> Void) {
        // Crear un DispatchWorkItem para realizar la carga en segundo plano
        let workItem = DispatchWorkItem {
            // Realizar la carga de información de errores en la nube
            let data = ["description": description]
            self.db.collection(self.collectionReferenceBugs).addDocument(data: data) { error in
                if let error = error {
                    // Si hay un error, llamar al bloque de finalización en el hilo principal
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
                } else {
                    // Si la operación es exitosa, llamar al bloque de finalización en el hilo principal
                    DispatchQueue.main.async {
                        completion(.success(()))
                    }
                }
            }
        }

        // Ejecutar el DispatchWorkItem en una cola global en segundo plano
        DispatchQueue.global(qos: .background).async(execute: workItem)
    }
    
    
    func uploadToCloudCrimes(description: String, completion: @escaping (Result<Void, Error>) -> Void) {
        let data = ["description": description]

        db.collection(collectionReferenceCrimes).addDocument(data: data) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }
    }
    
    func uploadToAnalyticsForms(jsonString: String, completion: @escaping (Result<Void, Error>) -> Void) {
        if let serverAddress = serverAddress, let endpointURL = URL(string: "http://\(serverAddress):8080/analytics/userform/") {
            var request = URLRequest(url: endpointURL)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = jsonString.data(using: .utf8)

            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.success(()))
                }
            }
            task.resume()
        } else {
    
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
        }
    }


    func connectGCPClassifyBugs(text: String) {
    
        let urlString = "https://us-central1-safego-399621.cloudfunctions.net/classify-bugs"
        
        if let url = URL(string: urlString) {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            
            let bodyString = "text=\(text)"
            request.httpBody = bodyString.data(using: .utf8)
            
            // Create a URLSession task
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("Error: \(error)")
                } else if let data = data {
                    if let result = String(data: data, encoding: .utf8) {
                        print("Response: \(result)")
                    }
                }
            }
            task.resume()
        } else {
            print("Invalid URL")
        }
    }

    func getTheClosestReport(latitude: Double, longitude: Double, completion: @escaping (Float?, Error?) -> Void) {
        // Set up the URL components
        var urlComponents = URLComponents()
        urlComponents.scheme = "http"
        urlComponents.host = serverAddress
        urlComponents.port = 8080
        urlComponents.path = "/analytics/closest/\(latitude)/\(longitude)"

        // Create the URL from the components
        guard let url = urlComponents.url else {
            print("Invalid URL")
            completion(nil, YourError.invalidURL)
            return
        }

        // Perform the network request asynchronously
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            // Handle network errors
            if let error = error {
                print("Error: \(error)")
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }

            // Ensure data is received
            guard let data = data else {
                print("No data received")
                DispatchQueue.main.async {
                    completion(nil, YourError.noDataReceived)
                }
                return
            }

            // Decode the data
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(Float.self, from: data)
                let roundedResult = round(result * 100) / 100
                print("Received data: \(roundedResult)")

                // Call the completion handler on the main thread
                DispatchQueue.main.async {
                    completion(roundedResult, nil)
                }
            } catch {
                print("Error decoding data: \(error)")

                // Call the completion handler on the main thread
                DispatchQueue.main.async {
                    completion(nil, YourError.decodingError)
                }
            }
        }.resume()
    }


    enum YourError: Error {
        case invalidURL
        case noDataReceived
        case decodingError
    }

}
