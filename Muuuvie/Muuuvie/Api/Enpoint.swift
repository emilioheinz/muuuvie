//
//  Enpoints.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 30/10/20.
//

import Foundation

enum Endpoint {
    case popularMovies
    case movie(id: Int)
    
    var url: String {
        switch self {
        case .popularMovies:
            return "movie/popular"
        case .movie(let id):
            return "movie/\(id)"
//        default:
//            return "\(self)"
        }
    }
}
