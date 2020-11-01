//
//  ArtistDetailViewModel.swift
//  Muuuvie
//
//  Created by Camille Grings on 31/10/20.
//

import Foundation

class ArtistDetailViewModel: ObservableObject, ViewModelWithRequest {
    @Published var artist: ArtistModel?
    @Published var isLoading: Bool
    @Published var hasError: Bool
    var message: String
    private let id: Int
    
    init(id: Int) {
        self.id = id
        self.isLoading = false
        self.hasError = false
        self.message = ""
    }
    
    func fetchArtist() {
        self.isLoading = true
        Api.instance.request(with: .artistDetail(id: id)) { [weak self] (result: Result<ArtistModel, APIError>) in
            switch result {
            case .success(let artist):
                DispatchQueue.main.async {
                    self?.artist = artist
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
