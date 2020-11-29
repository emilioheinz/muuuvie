//
//  Movie.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 30/10/20.
//

import Foundation

struct MovieDetailModel: Decodable, WatchableDetail {
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
    
    func getType() -> FavoritableTypeEnum {
        .movie
    }
    
    static var mocked: MovieDetailModel {
        MovieDetailModel(
            id: 724989,
            name: "Hard Kill",
            imagePath: "/86L8wqGMDbwURPni2t7FQ0nDjsH.jpg",
            overview: "The work of billionaire tech CEO Donovan Chalmers is so valuable that he hires mercenaries to protect it, and a terrorist group kidnaps his daughter just to get it.",
            status: "Released",
            voteAvarage: 5.0
        )
    }
}

