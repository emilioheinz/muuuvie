//
//  TVCategoriesListViewModel.swift
//  Muuuvie
//
//  Created by Camille Grings on 07/11/20.
//

import Foundation

class TVCategoriesListViewModel: ObservableObject, ViewModelWithRequest {
    
    @Published var categories: [TVCategoryModel] = []
    @Published var isLoading: Bool = false
    @Published var hasError: Bool = false
    var loadedCategories: Int = 0
    var categoriesWithErrorResponse: Int = 0
    var message: String = ""
    

    func fetchTVCategoriesList() {
        self.isLoading = true
        self.hasError = false
        self.loadedCategories = 0
        self.categoriesWithErrorResponse = 0
        
        let numberOfAvailableCategories = TVCategoryEnum.allCases.count
        
        TVCategoryEnum.allCases.forEach { currentCase in
            Api.instance.request(with: .tvShowsInCategory(category: currentCase)) { [weak self] (result: Result<TVCategoryApiReturnModel, APIError>) in
                switch result {
                case .success(let response):
                    DispatchQueue.main.async {
                        let category = TVCategoryModel(categoryType: currentCase, tvShows: response.tvShows)
                        self?.categories.append(category)
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
