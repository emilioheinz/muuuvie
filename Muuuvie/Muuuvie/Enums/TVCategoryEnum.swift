//
//  TVCategoryEnum.swift
//  Muuuvie
//
//  Created by Camille Grings on 07/11/20.
//

import Foundation

enum TVCategoryEnum: String, CaseIterable {
    case popular
    case airingToday = "airing_today"
    case onTheAir = "on_the_air"
    case topRated = "top_rated"
    
    var title: String {
        switch self {
        case .popular:
            return "Popular"
        case .airingToday:
            return "Airing Today"
        case .onTheAir:
            return "On The Air"
        case .topRated:
            return "Top Rated"
        }
    }
}
