//
//  TvShowDetail.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 29/11/20.
//

import Foundation

struct TVShowDetailModel: Decodable, WatchableDetail {
    let id: Int
    let name: String
    let imagePath: String?
    let overview: String
    let status: String
    let voteAvarage: Double
    
    func getType() -> FavoritableType {
        .movie
    }

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case overview
        case status
        case voteAvarage = "vote_average"
        case imagePath = "backdrop_path"
    }
    
    static var mocked: TVShowDetailModel {
        TVShowDetailModel(
            id: 724989,
            name: "Hard Kill",
            imagePath: "/86L8wqGMDbwURPni2t7FQ0nDjsH.jpg",
            overview: "The work of billionaire tech CEO Donovan Chalmers is so valuable that he hires mercenaries to protect it, and a terrorist group kidnaps his daughter just to get it.",
            status: "Released",
            voteAvarage: 5.0
        )
    }
}
