//
//  TVModel.swift
//  Muuuvie
//
//  Created by Camille Grings on 07/11/20.
//

import Foundation

struct TVShowModel: Decodable, Identifiable, Watchable {

    let id: Int
    let name: String
    let imagePath: String?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case imagePath = "poster_path"
    }
    
    static var mocked: TVShowModel {
        TVShowModel(id: 604, name: "Teen Titans", imagePath: "/hHwEptckXUwZM7XO2lxZ8w8upuU.jpg")
    }
}
