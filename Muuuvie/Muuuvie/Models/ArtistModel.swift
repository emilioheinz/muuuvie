//
//  ArtistModel.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 04/11/20.
//

import Foundation

struct CastApiReturnModel: Decodable {
    let cast: [ArtistModel]
}

struct ArtistModel: Decodable, Identifiable {
    let id: Int
    let name: String
    let imagePath: String?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case imagePath = "profile_path"
    }
    
    static var mocked: ArtistModel {
        ArtistModel(
            id: 819,
            name: "Edward Norton",
            imagePath: "/5XBzD5WuTyVQZeS4VI25z2moMeY.jpg"
        )
    }
}

