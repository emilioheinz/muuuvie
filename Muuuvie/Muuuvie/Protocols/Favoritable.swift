//
//  Favoritable.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 09/11/20.
//

import Foundation

enum FavoritableType: String, Codable {
    case movie
    case artist
    
    var userFriendlyLabel: String {
        switch self {
        case .movie:
            return "Movies"
        case .artist:
            return "Artists"
        }
    }
}


protocol Favoritable: Encodable {
    var id: Int { get }
    var name: String { get }
    var imagePath: String? { get }

    func getType() -> FavoritableType
}
