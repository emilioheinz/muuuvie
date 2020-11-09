//
//  FavoritesListView.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 08/11/20.
//

import SwiftUI

struct FavoritesListView: View {
    @ObservedObject var viewModel = FavoritesListViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                ForEach(0..<viewModel.favoritedMovies.count / 2 + 1, id: \.self) { row in
                    HStack {
                        ForEach(0..<2, id: \.self) { column in
                            Card(data: viewModel.favoritedMovies, row: row, column: column)
                        }
                    }
                }
            }
        }
        .onAppear {
            self.configureNavigationBarAppearence()
            viewModel.getFavorittedItems()
        }
    }
}

struct FavoritesListView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesListView()
    }
}

struct Card: View {
    var item: FavoritableItem?
    
    init(data: [FavoritableItem], row: Int, column: Int) {
        let index = row + column + ( row * (2 - 1))
        if index < data.count {
            item = data[index]
        }
    }
    
    var body: some View {
        if let item = item {
            MuCardView(imagePath: item.imagePath ?? "", title: item.name)
        } else {
            EmptyView().frame(width: 140)
        }
    }
}
