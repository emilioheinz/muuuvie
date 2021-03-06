//
//  ArtistModel.swift
//  Muuuvie
//
//  Created by Camille Grings on 31/10/20.
//

import Foundation

struct ArtistDetailModel: Decodable, Identifiable, Favoritable {
    let id: Int
    let name: String
    let knownForDepartment: String
    let biography: String
    let birthday: Date?
    let imagePath: String?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case knownForDepartment = "known_for_department"
        case biography
        case birthday
        case imagePath = "profile_path"
    }
    
    func getType() -> FavoritableTypeEnum {
        .artist
    }
    
    static var mocked: ArtistDetailModel {
        ArtistDetailModel(id: 287, name: "Brad Pitt", knownForDepartment: "Acting", biography: "William Bradley \"Brad\" Pitt (born December 18, 1963) is an American actor and film producer.", birthday: Date(), imagePath: "/kU3B75TyRiCgE270EyZnHjfivoq.jpg")
    }
}
