//
//  Favorits.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 08/11/20.
//

import UIKit

class Favorites {
    static let instance = Favorites()
    
    let favoritesKey = "MuuuviesFavorits"
    
    var items: [FavoriteModel] = []
    
    var userDefaults = UserDefaults.standard
    
    private init() {
        getFromLocalStorage()
    }
    
    func toggle(item: Favoritable) -> Bool {
        defer {
            updateLocalStorage()
        }

        let favoritedItem = FavoriteModel(item: item)

        if let itemIndex = items.firstIndex(of: favoritedItem) {
            items.remove(at: itemIndex)
            return false
        } else {
            items.append(favoritedItem)
            return true
        }
    }
    
    func isInFavoritesList(item: Favoritable) -> Bool {
        items.contains(.init(item: item))
    }
}


extension Favorites {
    func updateLocalStorage() {
        guard let jsonData =  try? JSONEncoder().encode(items) else { return }

        userDefaults.setValue(jsonData, forKey: favoritesKey)
    }
    
    func getFromLocalStorage() {
        guard let jsonData = userDefaults.data(forKey: favoritesKey),
              let dacodedFavorites = try? JSONDecoder().decode([FavoriteModel].self, from: jsonData) else {
            self.items = []
            return
        }
        
        self.items = dacodedFavorites
    }
}
