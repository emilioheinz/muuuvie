//
//  Placeholder.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 29/10/20.
//

import Foundation

typealias RequestCallback<T> = (Result<T, APIError>) -> Void


// https://api.themoviedb.org/3/movie/popular?api_key=37186ddc43254f76799f9204ff25251c
struct Api {
    static let instance = Api()
    
    let imagesBaseUrl: String = "https://image.tmdb.org/t/p/w500"
    let baseUrl: String = "https://api.themoviedb.org/3/"
    let apiKey: String = "37186ddc43254f76799f9204ff25251c"
    
    private init() {}
    
    func request<T: Decodable>(with endpoint: Endpoint, completion: @escaping RequestCallback<T>) {
        let fullUrlString = "\(baseUrl)\(endpoint.url)?api_key=\(apiKey)"

        guard let fullUrl = URL(string: fullUrlString) else {
            completion(.failure(.malformedURL))
            return
        }
        
        URLSession.shared.dataTask(with: fullUrl) { result in
            switch result {
            case .success(let (response, data)):
                guard let statusCode = (response as? HTTPURLResponse)?.statusCode, 200..<299 ~= statusCode else {
                    completion(.failure(.invalidResponse))
                    return
                }
                
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .custom({ (decoder) -> Date in
                    return try decoder.dateFormatterWithoutTime()
                })
                
                do {
                    let values = try decoder.decode(T.self, from: data)
                    completion(.success(values))
                } catch let error {
                    completion(.failure(.decodeError))
                }
            case .failure(let error):
                completion(.failure(.apiError))
            }
        }.resume()
    }
    
    func imageUrl(from path: String) -> String {
        "\(imagesBaseUrl)\(path)"
    }
}

