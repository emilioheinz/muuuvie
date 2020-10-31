//
//  MovieCategory.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 31/10/20.
//

import Foundation

struct MovieCategory: Decodable, Identifiable {
    let id: String
    let title: String
    let movies: [Movie]

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case movies = "results"
    }
    
    static var mocked: MovieCategory {
        MovieCategory(
          id: "pop",
          title: "Popular",
          movies: [
            Movie(
                id: 724989,
                title: "Hard Kill And Hard Something else",
                posterImagePath: "/ugZW8ocsrfgI95pnQ7wrmKDxIe.jpg"
            ),
            Movie(
                id: 724989,
                title: "Hard Kill And Hard Something else",
                posterImagePath: "/ugZW8ocsrfgI95pnQ7wrmKDxIe.jpg"
            ),
            Movie(
                id: 724989,
                title: "Hard Kill And Hard Something else",
                posterImagePath: "/ugZW8ocsrfgI95pnQ7wrmKDxIe.jpg"
            ),
            Movie(
                id: 724989,
                title: "Hard Kill And Hard Something else",
                posterImagePath: "/ugZW8ocsrfgI95pnQ7wrmKDxIe.jpg"
            ),
            Movie(
                id: 724989,
                title: "Hard Kill And Hard Something else",
                posterImagePath: "/ugZW8ocsrfgI95pnQ7wrmKDxIe.jpg"
            ),
        ])
    }
}
