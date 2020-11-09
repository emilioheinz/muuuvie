//
//  FavoritableItem.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 08/11/20.
//

import Foundation

enum FavoritableItemType: String, Codable {
    case movie
    case artist
}


protocol FavoritableItem: Encodable {
    var id: Int { get }
    var name: String { get }
    var imagePath: String? { get }

    func getType() -> FavoritableItemType
}
