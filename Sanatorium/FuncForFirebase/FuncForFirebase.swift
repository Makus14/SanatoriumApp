//
//  FuncForFirebase.swift
//  Sanatorium
//
//  Created by Mac on 23/02/2023.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage
import Firebase

class FuncForFirebase {
    
    static let shared = FuncForFirebase()
    
    private func configureFB() -> Firestore {
            var db: Firestore!
            let settings = FirestoreSettings()
            Firestore.firestore().settings = settings
            db = Firestore.firestore()
            return db
        }
    
    func getRegions(completion: @escaping (Result<[RegionModel], Error>) -> Void) {
            let dataBase = configureFB()
            dataBase.collection("regions").getDocuments { result, error in
                if let error = error {
                    completion(.failure(error))
                } else {
                    guard let result else { return }
                    var regionArray = [RegionModel]()

                    for document in result.documents {
                        let data = document.data()
                        guard let imageURL = data["imageURL"] as? String else {return}
                        guard let name = data["name"] as? String else { return }

                        let regionModel = RegionModel(city: name, imageURL: imageURL)
                        regionArray.append(regionModel)
                    }
                    completion(.success(regionArray))
                }
            }
        }
    
}
