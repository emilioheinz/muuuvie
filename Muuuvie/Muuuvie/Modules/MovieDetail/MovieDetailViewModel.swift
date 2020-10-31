//
//  MovieDetailViewModel.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 30/10/20.
//

import SwiftUI

class MovieDetailViewModel: ObservableObject, ViewModelWithRequest {

    @Published var movie: MovieDetail?
    @Published var isLoading: Bool
    @Published var hasError: Bool
    var message: String
    
    init() {
        self.isLoading = false
        self.hasError = false
        self.message = ""
    }

    func fetchMovie(id: Int) {
        self.isLoading = true
        Api.instance.request(with: .movie(id: id)) { [weak self] (result: Result<MovieDetail, APIError>) in
            switch result {
            case .success(let movie):
                DispatchQueue.main.async {
                    self?.movie = movie
                    self?.isLoading = false
                }
            case .failure(let error):
                self?.hasError = true
                self?.isLoading = false
                self?.message = error.message
            }
        }
    }

}
