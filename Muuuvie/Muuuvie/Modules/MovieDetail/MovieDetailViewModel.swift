//
//  MovieDetailViewModel.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 30/10/20.
//

import Foundation

class MovieDetailViewModel: ObservableObject {

    @Published var movie: MovieDetail?

    func fetchMovie(id: Int) {
        Api.instance.request(with: .movie(id: id)) { [weak self] (result: Result<MovieDetail, APIError>) in
            switch result {
            case .success(let movie):
                DispatchQueue.main.async {
                    print(movie)
                    self?.movie = movie
                }
            case .failure(let error):
                // TODO emilioheinz 30.10.2020: Create toast handling
                
                print(error)
            }
        }
    }

}
