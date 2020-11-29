//
//  TVShowDetailViewModel.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 29/11/20.
//

import Foundation

class TVShowViewModel: ObservableObject, ViewModelWithRequest {

    @Published var show: TVShowDetailModel?
    @Published var isLoading: Bool = false
    @Published var hasError: Bool = false
    @Published var isFavorited: Bool = false
    var message: String = ""


    func fetchMovie(id: Int) {
        self.isLoading = true
        Api.instance.request(with: .tvShowDetail(id: id)) { [weak self] (result: Result<TVShowDetailModel, APIError>) in
            switch result {
            case .success(let show):
                DispatchQueue.main.async {
                    self?.show = show
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
    }
    
    func toggleFavorite() {
        self.isFavorited = Favorites.instance.toggle(item: show!)
    }

}
