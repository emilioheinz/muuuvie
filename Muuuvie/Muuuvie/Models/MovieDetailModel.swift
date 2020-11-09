//
//  Movie.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 30/10/20.
//

import Foundation

struct MovieDetailModel: Decodable, FavoritableItem {
    let id: Int
    let name: String
    let imagePath: String?
    let overview: String
    let status: String
    let voteAvarage: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "title"
        case overview
        case status
        case voteAvarage = "vote_average"
        case imagePath = "backdrop_path"
    }
    
    func getType() -> FavoritableItemType {
        .movie
    }
}

