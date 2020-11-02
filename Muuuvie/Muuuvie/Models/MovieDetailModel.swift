//
//  Movie.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 30/10/20.
//

import Foundation

struct MovieDetailModel: Decodable {
    let id: Int
    let title: String
    let backdropImage: String
    let overview: String
    let status: String
    let voteAvarage: Double

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case overview
        case status
        case voteAvarage = "vote_average"
        case backdropImage = "backdrop_path"
    }
}

