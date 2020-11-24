//
//  TVModel.swift
//  Muuuvie
//
//  Created by Camille Grings on 07/11/20.
//

import Foundation

struct TVModel: Decodable, Identifiable {
    let id: Int
    let name: String
    let posterImagePath: String?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case posterImagePath = "poster_path"
    }
    
    static var mocked: TVModel {
        TVModel(id: 604, name: "Teen Titans", posterImagePath: "/hHwEptckXUwZM7XO2lxZ8w8upuU.jpg")
    }
}