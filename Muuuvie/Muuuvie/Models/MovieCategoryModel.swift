//
//  MovieCategory.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 31/10/20.
//

import Foundation

struct MovieCategoryApiReturnModel: Decodable {
    let movies: [MovieModel]
    
    enum CodingKeys: String, CodingKey {
        case movies = "results"
    }
}

struct MovieCategoryModel: Identifiable {
    let id: Int
    let categoryType: MovieCategoryEnum
    let movies: [MovieModel]
    
    init(categoryType: MovieCategoryEnum, movies: [MovieModel]) {
        self.id = Int.random(in: 1...100)
        self.categoryType = categoryType
        self.movies = movies
    }
    
    static var mocked: MovieCategoryModel {
        MovieCategoryModel(
          categoryType: .popular,
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
