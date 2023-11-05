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
}
