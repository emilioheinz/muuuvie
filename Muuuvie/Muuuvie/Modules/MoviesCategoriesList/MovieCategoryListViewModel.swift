//
//  MoviesCategoriesListViewModel.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 31/10/20.
//

import Foundation

class MovieCategoryListViewModel: ObservableObject, ViewModelWithRequest {

    @Published var categories: [MovieCategoryModel]
    @Published var isLoading: Bool
    @Published var hasError: Bool
    var message: String
    
    init() {
        self.categories = []
        self.isLoading = false
        self.hasError = false
        self.message = ""
    }

    func fetchMovieCategoryList() {
        Api.instance.request(with: .moviesInCategory(category: .popular)) { [weak self] (result: Result<MovieCategoryModel, APIError>) in
            switch result {
            case .success(let category):
                DispatchQueue.main.async {
                    self?.categories.append(category)
                    self?.isLoading = false
                }
            case .failure(let error):
                print(error)
                DispatchQueue.main.async {
                    self?.hasError = true
                    self?.isLoading = false
                    self?.message = error.message
                }
            }
        }
    }

}
