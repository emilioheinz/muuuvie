//
//  Movie.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 31/10/20.
//

import Foundation

struct Movie: Decodable {
    let id: Int
    let title: String
    let posterImagePath: String

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case posterImagePath = "poster_path"
    }
    
    static var mocked: Movie {
        Movie(id: 724989, title: "Hard Kill And Hard Something else", posterImagePath: "/ugZW8ocsrfgI95pnQ7wrmKDxIe.jpg")
    }
}
