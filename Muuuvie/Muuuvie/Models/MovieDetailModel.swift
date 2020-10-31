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

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case backdropImage = "backdrop_path"
    }
}

