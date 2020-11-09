//
//  Favorite.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 08/11/20.
//

import Foundation

struct FavoriteModel: Codable, FavoritableItem, Equatable {
    let id: Int
    let name: String
    let imagePath: String?
    let type: FavoritableItemType
    
    static func == (lhs: FavoriteModel, rhs: FavoriteModel) -> Bool {
        lhs.id == rhs.id && lhs.getType() == rhs.getType()
    }

    internal init(item: FavoritableItem) {
        self.id = item.id
        self.name = item.name
        self.imagePath = item.imagePath
        self.type = item.getType()
    }
    
    func getType() -> FavoritableItemType {
        self.type
    }
}

