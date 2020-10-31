//
//  MovieCategory.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 31/10/20.
//

import Foundation

struct MovieCategoryModel: Decodable, Identifiable {
    let id: Int
    let movies: [MovieModel]

    enum CodingKeys: String, CodingKey {
        case id = "total_results"
        case movies = "results"
    }
    
    static var mocked: MovieCategoryModel {
        MovieCategoryModel(
          id: 0,
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
