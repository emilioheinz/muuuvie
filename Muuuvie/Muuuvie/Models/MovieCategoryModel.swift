//
//  MovieCategory.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 31/10/20.
//

import Foundation

struct MovieCategoryModel: Decodable, Identifiable {
    let id: String
    let title: String
    let movies: [MovieModel]

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case movies = "results"
    }
    
    static var mocked: MovieCategoryModel {
        MovieCategoryModel(
          id: "pop",
          title: "Popular",
          movies: [
            MovieModel(
                id: 724989,
                title: "Hard Kill And Hard Something else",
                posterImagePath: "/ugZW8ocsrfgI95pnQ7wrmKDxIe.jpg"
            ),
            MovieModel(
                id: 724989,
                title: "Hard Kill And Hard Something else",
                posterImagePath: "/ugZW8ocsrfgI95pnQ7wrmKDxIe.jpg"
            ),
            MovieModel(
                id: 724989,
                title: "Hard Kill And Hard Something else",
                posterImagePath: "/ugZW8ocsrfgI95pnQ7wrmKDxIe.jpg"
            ),
            MovieModel(
                id: 724989,
                title: "Hard Kill And Hard Something else",
                posterImagePath: "/ugZW8ocsrfgI95pnQ7wrmKDxIe.jpg"
            ),
            MovieModel (
                id: 724989,
                title: "Hard Kill And Hard Something else",
                posterImagePath: "/ugZW8ocsrfgI95pnQ7wrmKDxIe.jpg"
            ),
        ])
    }
}
