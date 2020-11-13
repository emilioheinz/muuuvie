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
    @Published var selectedFilter: FavoritableType = .movie
    
    func getFavorittedItems() {        
        favoritedMovies = Favorites.instance.items.filter { item in
            item.getType() == .movie
        }
        
        favoritedArtists = Favorites.instance.items.filter { item in
            item.getType() == .artist
        }
    }
    
    func changeSelectedFilter(newFilter: FavoritableType) {
        selectedFilter = newFilter
    }
}
