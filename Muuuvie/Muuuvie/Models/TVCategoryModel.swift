//
//  TVCategoryModel.swift
//  Muuuvie
//
//  Created by Camille Grings on 07/11/20.
//

import Foundation

struct TVCategoryApiReturnModel: Decodable {
    let tvShows: [TVModel]
    
    enum CodingKeys: String, CodingKey {
        case tvShows = "results"
    }
}

struct TVCategoryModel: Identifiable {
    let id: Int
    let categoryType: TVCategoryEnum
    let tvShows: [TVModel]
    
    init(categoryType: TVCategoryEnum, tvShows: [TVModel]) {
        self.id = Int.random(in: 1...100)
        self.categoryType = categoryType
        self.tvShows = tvShows
    }
    
    static var mocked: TVCategoryModel {
        TVCategoryModel(
          categoryType: .popular,
            tvShows: [
                TVModel(id: 604, name: "Teen Titans", imagePath: "/hHwEptckXUwZM7XO2lxZ8w8upuU.jpg"),
                TVModel(id: 604, name: "Teen Titans", imagePath: "/hHwEptckXUwZM7XO2lxZ8w8upuU.jpg"),
                TVModel(id: 604, name: "Teen Titans", imagePath: "/hHwEptckXUwZM7XO2lxZ8w8upuU.jpg"),
                TVModel(id: 604, name: "Teen Titans", imagePath: "/hHwEptckXUwZM7XO2lxZ8w8upuU.jpg"),
        ])
    }
}
