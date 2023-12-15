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
    
    // UserDefaults key for user data
    private let userDefaultsKey = "userData"

    func uploadToCloudSuggestions(description: String, completion: @escaping (Result<Void, Error>) -> Void) {
        let data = ["description": description]

        var usedCachedData = false

        db.collection(collectionReferenceSuggestions).addDocument(data: data) { [weak self] error in
            if let error = error {
                // Check if there's cached data available
                if let _ = self?.dataCache.retrieveObject(at: "suggestionsKey") {
                    // Use the fact that cached data exists as a flag
                    usedCachedData = true
                }
                
                // If there's an error and cached data was used, consider it a success
                if usedCachedData {
                    completion(.success(()))
                } else {
                    // If there's no cached data or cached data wasn't used, report the original error
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

        // Execute the upload operation in the background
        queue.async {
            self.saveUserDataToUserDefaults(user: user)
            self.saveUserDataToFileSystem(user: user)
            SQLiteManager.shared.insertUser(user: user)

            // Upload user data to Firestore
            self.db.collection(self.collectionReferenceUser).document(user.id).setData(user.asDictionary()) { error in
                if let error = error {
                    // If there's an error, call the completion block on the main thread
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
                } else {
                    // If the operation is successful, call the completion block on the main thread
                    DispatchQueue.main.async {
                        completion(.success(()))
                    }
                }
            }
        }
    }

    func uploadToCloudBugs(description: String, completion: @escaping (Result<Void, Error>) -> Void) {
        // Attempt to retrieve data from the cache
        var usedCachedData = false

        if let _ = self.dataCache.retrieveObject(at: "bugsKey") {
            // Notify success using cached data
            usedCachedData = true
            DispatchQueue.main.async {
                completion(.success(()))
            }
        } else {
            // If no cached data, attempt to upload the data to the cloud
            let data = ["description": description]
            
            SQLiteManager.shared.insertBug(description: description)
            
            self.db.collection(self.collectionReferenceBugs).addDocument(data: data) { [weak self] error in
                if let error = error {
                    // In case of an error, fall back to the cached data (if available)
                    if let _ = self?.dataCache.retrieveObject(at: "bugsKey"), !usedCachedData {
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
                    // If the upload to the cloud is successful, update the cache in the background
                    if !usedCachedData {
                        self?.updateCacheInBackground(key: "bugsKey", data: data)

                        // Save data to File System
                        self?.saveBugsDataToFileSystem(data: data)
                    }
                    DispatchQueue.main.async {
                        completion(.success(()))
                    }
                }
            }
        }
    }
    
    func uploadToCloudCrimes(description: String, completion: @escaping (Result<Void, Error>) -> Void) {
        // Attempt to retrieve data from the cache
        var usedCachedData = false

        if let _ = self.dataCache.retrieveObject(at: "crimesKey") {
            // Notify success using cached data
            usedCachedData = true
            DispatchQueue.main.async {
                completion(.success(()))
            }
        } else {
            // If no cached data, attempt to upload the data to the cloud
            let data = ["description": description]
            self.db.collection(self.collectionReferenceCrimes).addDocument(data: data) { [weak self] error in
                if let error = error {
                    // If there's an error, fall back to the cached data (if available)
                    if let _ = self?.dataCache.retrieveObject(at: "crimesKey"), !usedCachedData {
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
                    if !usedCachedData {
                        self?.updateCacheInBackground(key: "crimesKey", data: data)
                    }
                    DispatchQueue.main.async {
                        completion(.success(()))
                    }
                }
            }
        }
    }

    
    func uploadToAnalyticsForms(jsonString: String, completion: @escaping (Result<Void, Error>) -> Void) {
        // Attempt to retrieve data from the cache
        var usedCachedData = false

        if let _ = self.dataCache.retrieveObject(at: "analyticsFormsKey") {
            // Notify success using cached data
            usedCachedData = true
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
                            if let data = jsonString.data(using: .utf8), !usedCachedData {
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
    
    private func saveUserDataToFileSystem(user: User) {
        do {
            let userData = try JSONEncoder().encode(user)
            let filePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("userData.json")
            try userData.write(to: filePath, options: .atomic)
        } catch {
            print("Error saving user data to File System: \(error)")
        }
    }
    
    private func saveUserDataToUserDefaults(user: User) {
        let userData = try? JSONEncoder().encode(user)
        UserDefaults.standard.set(userData, forKey: userDefaultsKey)
    }

    private func saveBugsDataToFileSystem(data: [String: Any]) {
        do {
            let bugsData = try JSONSerialization.data(withJSONObject: data, options: [])
            let filePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("bugsData.json")
            try bugsData.write(to: filePath, options: .atomic)
        } catch {
            print("Error saving bug data to File System: \(error)")
        }
    }
}

