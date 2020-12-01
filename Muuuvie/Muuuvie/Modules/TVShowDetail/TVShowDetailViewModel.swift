//
//  TVShowDetailViewModel.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 29/11/20.
//

import Foundation

class TVShowDetailViewModel: ObservableObject, ViewModelWithRequest {

    @Published var show: TVShowDetailModel?
    @Published var artists: [ArtistModel]?
    @Published var isLoading: Bool = false
    @Published var hasError: Bool = false
    @Published var isFavorited: Bool = false
    var message: String = ""


    func fetchMovie(id: Int) {
        self.isLoading = true
        Api.instance.request(with: .tvShowDetail(id: id)) { [weak self] (result: Result<TVShowDetailModel, APIError>) in
            switch result {
            case .success(let show):
                Api.instance.request(with: .tvShowCast(id: id)) { [weak self] (resultCast: Result<CastApiReturnModel, APIError>) in
                    switch resultCast {
                    case .success(let castResp):
                        DispatchQueue.main.async {
                            self?.show = show
                            self?.artists = castResp.cast
                            self?.isLoading = false
                            self?.isFavorited = Favorites.instance.isInFavoritesList(item: show)
                        }
                    case .failure(let error):
                        DispatchQueue.main.async {
                            self?.hasError = true
                            self?.isLoading = false
                            self?.message = error.message
                        }
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
    
    func toggleFavorite() {
        self.isFavorited = Favorites.instance.toggle(item: show!)
    }

}
