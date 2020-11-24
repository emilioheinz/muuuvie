//
//  Movie.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 31/10/20.
//

import Foundation

struct MovieModel: Decodable, Identifiable {
    let id: Int
    let name: String
    let imagePath: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "title"
        case imagePath = "poster_path"
    }
    
    static var mocked: MovieModel {
        MovieModel(id: 724989, name: "Hard Kill And Hard Something else", imagePath: "/ugZW8ocsrfgI95pnQ7wrmKDxIe.jpg")
    }
}
