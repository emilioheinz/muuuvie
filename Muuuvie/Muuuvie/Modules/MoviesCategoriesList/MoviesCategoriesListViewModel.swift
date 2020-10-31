//
//  MoviesCategoriesListViewModel.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 31/10/20.
//

import Foundation

class MoviesCategoriesListViewModel: ObservableObject, ViewModelWithRequest {

    @Published var categries: [MovieCategoryModel]?
    @Published var isLoading: Bool
    @Published var hasError: Bool
    var message: String
    
    init() {
        self.isLoading = false
        self.hasError = false
        self.message = ""
    }

    func fetchMovieCategories() {
        // TODO
    }

}
