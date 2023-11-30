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
}
