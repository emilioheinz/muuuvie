//
//  MovieDetailViewModel.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 30/10/20.
//

import Foundation

class MovieDetailViewModel: ObservableObject, ViewModelWithRequest {

    @Published var movie: MovieDetailModel?
    @Published var artists: [ArtistModel]?
    @Published var isLoading: Bool
    @Published var hasError: Bool
    @Published var videos: [MovieVideoModel]?
    var message: String
    
    init() {
        self.isLoading = false
        self.hasError = false
        self.message = ""
    }

    func fetchMovie(id: Int) {
        self.isLoading = true
        Api.instance.request(with: .movieDetail(id: id)) { [weak self] (result: Result<MovieDetailModel, APIError>) in
            switch result {
            case .success(let movie):
                Api.instance.request(with: .movieCast(id: id)) { [weak self] (result2: Result<CastApiReturnModel, APIError>) in
                    switch result2 {
                    case .success(let castResp):
                        DispatchQueue.main.async {
                            self?.movie = movie
                            self?.artists = castResp.cast
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
                
                Api.instance.request(with: .movieVideos(id: id)) { [weak self] (result3: Result<VideosReturnModel, APIError>) in
                    switch result3 {
                    case .success(let videos):
                        DispatchQueue.main.async {
                            self?.videos = videos.videos
                        }
                    case .failure(let error):
                        print(error)
                    }
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
