//
//  Enpoints.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 30/10/20.
//

import Foundation

enum Endpoint {
    case popularMovies
    case movieDetail(id: Int)
    case moviesInCategory(category: MovieCategoryEnum)
    case artistDetail(id: Int)
    
    var url: String {
        switch self {
        case .popularMovies:
            return "movie/popular"
        case .movieDetail(let id):
            return "movie/\(id)"
        case .moviesInCategory(let category):
            return "movie/\(category)"
        case .artistDetail(let id):
            return "person/\(id)"
//        default:
//            return "\(self)"
        }
    }
}
