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
    let endpointReferenceUserFomr = Bundle.main.infoDictionary!["EndpointReferenceUserFomr"] as! String

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
        db.collection(collectionReferenceUser).document(user.id).setData(user.asDictionary()) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }
    }

    func uploadToCloudBugs(description: String, completion: @escaping (Result<Void, Error>) -> Void) {
        
        let data = ["description": description]

        db.collection(collectionReferenceBugs).addDocument(data: data) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }
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
        if let endpointURL = URL(string: endpointReferenceUserFomr) {
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
            // Handle invalid URL
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
        let urlComponents = URLComponents(string: "http://localhost:8000/analytics/closest/\(latitude)/\(longitude)")!
        
        // Create the URL from the components
        guard let url = urlComponents.url else {
            print("Invalid URL")
            completion(nil, YourError.invalidURL)
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error: \(error)")
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                print("No data received")
                completion(nil, YourError.noDataReceived)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(Float.self, from: data)
                let roundedResult = round(result * 100) / 100 // Round to two decimal places
                print("Received data: \(roundedResult)")
                completion(roundedResult, nil)
            } catch {
                print("Error decoding data: \(error)")
                completion(nil, error)
            }
        }.resume()
    }

    enum YourError: Error {
        case invalidURL
        case noDataReceived
    }

}
