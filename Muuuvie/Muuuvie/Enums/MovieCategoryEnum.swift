//
//  MovieCategory.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 31/10/20.
//

import Foundation

enum MovieCategoryEnum: String, CaseIterable {
    case popular
    case upcoming
    case nowPlaying = "now_playing"
    case topRated = "top_rated"
    
    var title: String {
        switch self {
        case .popular:
            return "Popular"
        case .upcoming:
            return "Upcoming"
        case .nowPlaying:
            return "Now"
        case .topRated:
            return "Top Rated"
        }
    }
}
