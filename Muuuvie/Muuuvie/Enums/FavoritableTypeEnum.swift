//
//  FavoritableTypeEnum.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 29/11/20.
//

import Foundation

enum FavoritableTypeEnum: String, Codable, CaseIterable {
    case movie
    case tvShow
    case artist
    
    var userFriendlyLabel: String {
        switch self {
        case .movie:
            return "Movies"
        case .tvShow:
            return "TV Shows"
        case .artist:
            return "Artists"
        }
    }
}
