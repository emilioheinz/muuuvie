//
//  ApiSupport.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 30/10/20.
//

import Foundation

public enum APIError: Error {
    case malformedURL
    case apiError
    case invalidResponse
    case noData
    case decodeError
}

extension URLSession {
    func dataTask(with url: URL, result: @escaping (Result<(URLResponse, Data), Error>) -> Void) -> URLSessionDataTask {
        return dataTask(with: url) { (data, response, error) in
            if let error = error {
                result(.failure(error))
                return
            }
            
            guard let response = response, let data = data else {
                let error = NSError(domain: "Error", code: 0, userInfo: nil)

                result(.failure(error))
                return
            }
            
            result(.success((response, data)))
        }
    }
}

