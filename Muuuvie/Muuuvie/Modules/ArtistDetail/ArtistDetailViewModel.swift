//
//  ArtistDetailViewModel.swift
//  Muuuvie
//
//  Created by Camille Grings on 31/10/20.
//

import Foundation

class ArtistDetailViewModel: ObservableObject, ViewModelWithRequest {
    @Published var artist: ArtistDetailModel?
    @Published var isLoading: Bool = false
    @Published var hasError: Bool = false
    @Published var isFavorited: Bool = false
    var message: String = ""
    private let id: Int
    
    init(id: Int) {
        self.id = id
    }
    
    func fetchArtist() {
        self.isLoading = true
        Api.instance.request(with: .artistDetail(id: id)) { [weak self] (result: Result<ArtistDetailModel, APIError>) in
            switch result {
            case .success(let artist):
                DispatchQueue.main.async {
                    self?.artist = artist
                    self?.isLoading = false
                    self?.isFavorited = Favorites.instance.isInFavoritesList(item: artist)
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
        self.isFavorited = Favorites.instance.toggle(item: artist!)
    }
}
