//
//  Favoritable.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 09/11/20.
//

import Foundation

protocol Favoritable: Encodable {
    var id: Int { get }
    var name: String { get }
    var imagePath: String? { get }

    func getType() -> FavoritableTypeEnum
}
