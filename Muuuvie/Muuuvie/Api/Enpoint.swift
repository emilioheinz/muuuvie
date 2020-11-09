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
    case movieVideos(id: Int)
    case moviesInCategory(category: MovieCategoryEnum)
    case artistDetail(id: Int)
    
    var url: String {
        switch self {
        case .popularMovies:
            return "movie/popular"
        case .movieDetail(let id):
            return "movie/\(id)"
        case .movieVideos(let id):
            return "movie/\(id)/videos"
        case .moviesInCategory(let category):
            return "movie/\(category.rawValue)"
        case .artistDetail(let id):
            return "person/\(id)"
//        default:
//            return "\(self)"
        }
    }
}
