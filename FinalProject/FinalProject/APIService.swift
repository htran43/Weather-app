//
//  APIService.swift
//  FinalProject
//
//  Created by FSE394 on 4/17/22.
//

import Foundation

public class APIService {
    public static let shared = APIService()
    
    public enum APIError: Error {
        case error(_ errorString: String)
    }
    
    public func getJSON<T: Decodable>(urlString: String, dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate, keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys, completion: @escaping (Result<T,APIError>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.error(NSLocalizedString("Error: Invalid URL", comment: ""))))
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(.error(NSLocalizedString("Error: \(error.localizedDescription)"))))
                return
            }
            
            guard let data = data else {
                completion(.failure(.error("Error: Data is corrupt.")))
                return
            }
            let decoder = JSONDecoder()
            do {
                let decodedData = try decoder.decode(Forecast.self, from: data)
                completion(.success(decodedData))
                return
            }
        }.resume()
    }
}
