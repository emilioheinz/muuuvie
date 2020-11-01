//
//  MoviesCategoriesListViewModel.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 31/10/20.
//

import Foundation

class MovieCategoryListViewModel: ObservableObject, ViewModelWithRequest {

    @Published var categories: [MovieCategoryModel] = []
    @Published var isLoading: Bool = false
    @Published var hasError: Bool = false
    var loadedCategories: Int = 0
    var categoriesWithErrorResponse: Int = 0
    var message: String = ""

    func fetchMovieCategoryList() {
        self.isLoading = true
        
        let numberOfAvailableCategories = MovieCategoryEnum.allCases.count
        
        MovieCategoryEnum.allCases.forEach { currentCase in
            Api.instance.request(with: .moviesInCategory(category: currentCase)) { [weak self] (result: Result<MovieCategoryApiReturnModel, APIError>) in
                switch result {
                case .success(let response):
                    DispatchQueue.main.async {
                        let categoryWithTitle = MovieCategoryModel(categoryType: currentCase, movies: response.movies)
                        self?.categories.append(categoryWithTitle)
                        self?.loadedCategories += 1
                        
                        let loadedCategories = self?.loadedCategories ?? 0
                        let categoriesWithErrorResponse = self?.categoriesWithErrorResponse ?? 0
                        let requestedCategories = loadedCategories + categoriesWithErrorResponse
                        
                        if requestedCategories == numberOfAvailableCategories {
                            self?.isLoading = false
                        }
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        self?.message = error.message
                        self?.categoriesWithErrorResponse += 1
                        
                        let loadedCategories = self?.loadedCategories ?? 0
                        let categoriesWithErrorResponse = self?.categoriesWithErrorResponse ?? 0
                        let requestedCategories = loadedCategories + categoriesWithErrorResponse
                        
                        if categoriesWithErrorResponse == numberOfAvailableCategories {
                            self?.hasError = true
                            self?.isLoading = false
                        } else if requestedCategories == numberOfAvailableCategories {
                            self?.isLoading = false
                        }
                    }
                }
            }
        }
    }

}
