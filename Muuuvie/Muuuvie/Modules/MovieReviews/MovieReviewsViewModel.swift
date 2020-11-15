//
//  MoviewReviewsViewModel.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 07/11/20.
//

import Foundation

class MovieReviewsViewModel: ObservableObject, ViewModelWithRequest {
    @Published var reviews: [MovieReviewModel]?
    @Published var isLoading: Bool
    @Published var hasError: Bool
    var message: String
    
    init() {
        self.isLoading = false
        self.hasError = false
        self.message = ""
    }
    
    func fetchArtist(movieId: Int) {
        self.isLoading = true
        Api.instance.request(with: .movieReviews(movieId: movieId)) { [weak self] (result: Result<MovieReviewsApiReturnModel, APIError>) in
            switch result {
            case .success(let movie):
                DispatchQueue.main.async {
                    self?.reviews = movie.reviews
                    self?.isLoading = false
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.hasError = true
                    self?.isLoading = false
                    self?.message = error.message
                }
            }
        }
    }
}
