//
//  FavoritesListViewModel.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 08/11/20.
//

import Foundation

class FavoritesListViewModel: ObservableObject {
    @Published var favoritedMovies: [FavoriteModel] = []
    @Published var favoritedArtists: [FavoriteModel] = []
    @Published var favoritedTVShows: [FavoriteModel] = []
    @Published var selectedFilter: FavoritableTypeEnum = .movie
    
    let favoritesInstance: Favorites
    
    init(favoritesInstance: Favorites) {
        self.favoritesInstance = favoritesInstance
    }
    
    func getFavorittedItems() {        
        favoritedMovies = favoritesInstance.items.filter { item in
            item.getType() == .movie
        }
        
        favoritedArtists = favoritesInstance.items.filter { item in
            item.getType() == .artist
        }
        
        favoritedTVShows = favoritesInstance.items.filter { item in
            item.getType() == .tvShow
        }
    }
    
    func changeSelectedFilter(newFilter: FavoritableTypeEnum) {
        selectedFilter = newFilter
    }
}
