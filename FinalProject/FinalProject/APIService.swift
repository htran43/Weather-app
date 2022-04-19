//
//  APIService.swift
//  FinalProject
//
//  Created by FSE394 on 4/17/22.
//

import Foundation

public class APIService {
    struct APICall: Decodable {
        let lat: Double
        let lon: Double
    }
    
    func callAPI(latitude: Double, longitude: Double) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat=\(latitude)&lon=\(longitude)&exclude=current,minutely,hourly&appid=14209ad437f68c36d342053e91596f8f") else {
            print("dang")
            return
        }
    
        let task = URLSession.shared.dataTask(with: url) {
            data, response, error in
            
            if let data = data, let string = String(data: data, encoding: .utf8) {
                print(string)
                let jsonData = string.data(using: .utf8)!
                let apiCall: APICall = try! JSONDecoder().decode(APICall.self, from: jsonData)
                print(apiCall.lon)
            }
        }
        task.resume()
    }
    
    /*public static let shared = APIService()
    
    struct Forecast: Codable {
        struct Temp: Codable {
            let min: Double
            let max: Double
        }
        let temp: Temp
        let humidity: Int
        struct Weather: Codable {
            let id: Int
            let description: String
            let icon: String
            var weatherIconURL: URL {
                let urlString = "http://openweathermap.org/img/wn/\(icon)10d@2x.png"
                return URL(string: urlString)!
            }
        }
        let clouds: Int
        let pop: Double
    }
    
    public enum APIError: Error {
        case error(_ errorString: String)
    }
    
    public func getJSON<T: Decodable>(urlString: String, dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .deferredToDate, keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys, completion: @escaping (Result<T,APIError>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.error(NSLocalizedString("Error: Invalid URL", comment: ""))))
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void in
            if let error = error {
                completion(.failure(.error(NSLocalizedString("Error: \(error.localizedDescription)", comment: "Failure, error occurred."))))
                return
            }
            
            guard let data = data else {
                completion(.failure(.error("Error: Data is corrupt.")))
                return
            }
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = dateDecodingStrategy
            decoder.keyDecodingStrategy = keyDecodingStrategy
            do {
                let decodedData = try decoder.decode(Forecast.self, from: data)
                completion(.success(decodedData as! T))
                return
            } catch {print("bruh")}
        }.resume()
    }*/
}
