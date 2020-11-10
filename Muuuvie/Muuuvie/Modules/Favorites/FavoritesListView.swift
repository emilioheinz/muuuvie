//
//  FavoritesListView.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 08/11/20.
//

import SwiftUI
import QGrid

struct FavoritesListView: View {
    @ObservedObject var viewModel = FavoritesListViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack(alignment: .bottom) {
                    Spacer().frame(width: 25)
                    Button(action: {}) {
                        VStack {
                            Text("Movies")
                            Rectangle()
                                .frame(width: 65, height: 4)
                                .foregroundColor(.mainOrange)
                        }
                    }.accentColor(.black)
                    Spacer().frame(width: 25)
                    Button(action: {}) {
                        VStack {
                            Text("Artists")
                            Rectangle()
                                .frame(width: 65, height: 4)
                                .foregroundColor(.clear)
                        }
                    }.accentColor(.black)
                    Spacer()
                }.frame(height: 50)
                ScrollView {
                    VStack {
                        ForEach(viewModel.favoritedMovies, id: \.self) { movie in
                            MuCardView(imagePath: movie.imagePath ?? "", title: movie.name)
                        }
                    }
                }
                .navigationBarTitle("Favorites", displayMode: .large)
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

