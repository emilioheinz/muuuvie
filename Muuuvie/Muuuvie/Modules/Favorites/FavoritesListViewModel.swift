//
//  FavoritesListViewModel.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 08/11/20.
//

import Foundation

class FavoritesListViewModel: ObservableObject {
    @Published var favoritedMovies: [FavoritableItem] = []
    @Published var favoritedArtists: [FavoritableItem] = []
    
    func getFavorittedItems() {        
        favoritedMovies = Favorites.instance.items.filter { item in
            item.getType() == .movie
        }
        
        favoritedArtists = Favorites.instance.items.filter { item in
            item.getType() == .artist
        }
    }
}
