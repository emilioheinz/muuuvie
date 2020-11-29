//
//  Favorite.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 08/11/20.
//

import UIKit

struct FavoriteModel: Codable, Favoritable, Hashable, Equatable {
    let id: Int
    let name: String
    let imagePath: String?
    let type: FavoritableTypeEnum
    
    static func == (lhs: FavoriteModel, rhs: FavoriteModel) -> Bool {
        lhs.id == rhs.id && lhs.getType() == rhs.getType()
    }

    internal init(item: Favoritable) {
        self.id = item.id
        self.name = item.name
        self.imagePath = item.imagePath
        self.type = item.getType()
    }
    
    func getType() -> FavoritableTypeEnum {
        self.type
    }
}

