//
//  APIManager.swift
//  Adopet
//
//  Created by Diego Sabino on 06/05/23.
//

import Foundation

struct Pet: Codable {
    let _id: String
    let name: String
    let sex: String
    let description: String
    let giverId: String
    let state: String
    let years: String
    let photos: [String]
}

class APIManager {
    func fetchData(completion: @escaping ([Pet]?) -> Void) {
        guard let url = URL(string: "http://localhost:3001/pets") else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode([Pet].self, from: data)
                    completion(result)
                } catch let DecodingError.dataCorrupted(context) {
                    print("Data corrupted:", context)
                    completion(nil)
                } catch let DecodingError.keyNotFound(key, context) {
                    print("Key '\(key)' not found:", context.debugDescription)
                    print("Coding path:", context.codingPath)
                    completion(nil)
                } catch let DecodingError.valueNotFound(value, context) {
                    print("Value '\(value)' not found:", context.debugDescription)
                    print("Coding path:", context.codingPath)
                    completion(nil)
                } catch let DecodingError.typeMismatch(type, context) {
                    print("Type '\(type)' mismatch:", context.debugDescription)
                    print("Coding path:", context.codingPath)
                    completion(nil)
                } catch {
                    print("Error decoding JSON: \(error.localizedDescription)")
                    completion(nil)
                }
            }
        }
        
        task.resume()
    }
}
