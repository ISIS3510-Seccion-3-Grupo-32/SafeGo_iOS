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

class ServiceAdapter: ObservableObject {
    
    private let dataCache = LRUCache<String, Data>(capacity: 50)

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

        db.collection(collectionReferenceSuggestions).addDocument(data: data) { [weak self] error in
            if let error = error {
                // If there's an error, fall back to the cached data (if available)
                if let cachedData = self?.dataCache.retrieveObject(at: "suggestionsKey") {
                    completion(.success(()))
                } else {
                    completion(.failure(error))
                }
            } else {
                // If the upload is successful, update the cache
                self?.dataCache.setObject(for: "suggestionsKey", value: Data("Uploaded Data".utf8))
                completion(.success(()))
            }
        }
    }

    func uploadUserToCloud(user: User, completion: @escaping (Result<Void, Error>) -> Void) {
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
        // Intentar recuperar datos de la caché
        if let cachedData = self.dataCache.retrieveObject(at: "bugsKey") {
            // Notificar el éxito utilizando los datos de la caché
            DispatchQueue.main.async {
                completion(.success(()))
            }
        } else {
            // Si no hay datos en caché, realizar la carga en la nube
            let data = ["description": description]
            self.db.collection(self.collectionReferenceBugs).addDocument(data: data) { [weak self] error in
                if let error = error {
                    // En caso de error, notificar el error original
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
                } else {
                    // Si la carga en la nube es exitosa, actualizar la caché en segundo plano
                    self?.updateCacheInBackground(key: "bugsKey", data: data)
                    DispatchQueue.main.async {
                        completion(.success(()))
                    }
                }
            }
        }
    }
    
    func uploadToCloudCrimes(description: String, completion: @escaping (Result<Void, Error>) -> Void) {
        // Attempt to retrieve data from the cache
        if let cachedData = self.dataCache.retrieveObject(at: "crimesKey") {
            // Notify success using cached data
            DispatchQueue.main.async {
                completion(.success(()))
            }
        } else {
            // If no cached data, attempt to upload the data to the cloud
            let data = ["description": description]
            self.db.collection(self.collectionReferenceCrimes).addDocument(data: data) { [weak self] error in
                if let error = error {
                    // If there's an error, fall back to the cached data (if available)
                    if let cachedData = self?.dataCache.retrieveObject(at: "crimesKey") {
                        // Notify success using cached data
                        DispatchQueue.main.async {
                            completion(.success(()))
                        }
                    } else {
                        // Notify the original error
                        DispatchQueue.main.async {
                            completion(.failure(error))
                        }
                    }
                } else {
                    // If the upload is successful, update the cache in the background
                    self?.updateCacheInBackground(key: "crimesKey", data: data)
                    DispatchQueue.main.async {
                        completion(.success(()))
                    }
                }
            }
        }
    }
    
    func uploadToAnalyticsForms(jsonString: String, completion: @escaping (Result<Void, Error>) -> Void) {
        // Attempt to retrieve data from the cache
        if let cachedData = self.dataCache.retrieveObject(at: "analyticsFormsKey") {
            // Notify success using cached data
            DispatchQueue.main.async {
                completion(.success(()))
            }
        } else {
            // If no cached data, proceed with the network request
            if let serverAddress = serverAddress, let endpointURL = URL(string: "http://\(serverAddress):8080/analytics/userform/") {
                var request = URLRequest(url: endpointURL)
                request.httpMethod = "POST"
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                request.httpBody = jsonString.data(using: .utf8)

                let task = URLSession.shared.dataTask(with: request) { [weak self] (data, response, error) in
                    if let error = error {
                        // Notify failure if there's an error
                        DispatchQueue.main.async {
                            completion(.failure(error))
                        }
                    } else {
                        // If the network request is successful, update the cache in the background
                        DispatchQueue.global().async {
                            // Simulate updating the cache with the newly uploaded data
                            // Replace this with your actual cache update logic
                            if let data = jsonString.data(using: .utf8) {
                                self?.dataCache.setObject(for: "analyticsFormsKey", value: data)
                            }
                        }
                        DispatchQueue.main.async {
                            completion(.success(()))
                        }
                    }
                }
                task.resume()
            } else {
                // Notify failure for an invalid URL
                completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            }
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
        // Check if data is available in the cache
        if let cachedData = self.dataCache.retrieveObject(at: "closestReportKey"),
           let cachedResult = try? JSONDecoder().decode(Float.self, from: cachedData) {
            // Use the cached data immediately
            completion(cachedResult, nil)
            return
        }

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
        URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
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

                // Update the cache with the latest data
                self?.dataCache.setObject(for: "closestReportKey", value: data)

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
    
    private func updateCacheInBackground(key: String, data: [String: Any]) {
        DispatchQueue.global().async {
            let updatedData = Data("Updated Data from Network".utf8)
            self.dataCache.setObject(for: key, value: updatedData)
        }
    }

}
