//
//  TVCategoryModel.swift
//  Muuuvie
//
//  Created by Camille Grings on 07/11/20.
//

import Foundation

struct TVCategoryApiReturnModel: Decodable {
    let tvShows: [TVShowModel]
    
    enum CodingKeys: String, CodingKey {
        case tvShows = "results"
    }
}

struct TVCategoryModel: Identifiable {
    let id: Int
    let categoryType: TVCategoryEnum
    let tvShows: [TVShowModel]
    
    init(categoryType: TVCategoryEnum, tvShows: [TVShowModel]) {
        self.id = Int.random(in: 1...100)
        self.categoryType = categoryType
        self.tvShows = tvShows
    }
    
    static var mocked: TVCategoryModel {
        TVCategoryModel(
          categoryType: .popular,
            tvShows: [
                TVShowModel(id: 604, name: "Teen Titans", imagePath: "/hHwEptckXUwZM7XO2lxZ8w8upuU.jpg"),
                TVShowModel(id: 604, name: "Teen Titans", imagePath: "/hHwEptckXUwZM7XO2lxZ8w8upuU.jpg"),
                TVShowModel(id: 604, name: "Teen Titans", imagePath: "/hHwEptckXUwZM7XO2lxZ8w8upuU.jpg"),
                TVShowModel(id: 604, name: "Teen Titans", imagePath: "/hHwEptckXUwZM7XO2lxZ8w8upuU.jpg"),
        ])
    }
}
