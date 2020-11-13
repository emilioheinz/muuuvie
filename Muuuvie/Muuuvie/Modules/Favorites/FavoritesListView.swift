//
//  FavoritesListView.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 08/11/20.
//

import SwiftUI
import QGrid

struct FavoritesListView: View {
    private var twoColumnGrid = [GridItem(.flexible(), alignment: .top), GridItem(.flexible(), alignment: .top)]
    
    @ObservedObject var viewModel = FavoritesListViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                FilterButtons(viewModel: viewModel)
                ScrollView {
                    Spacer().frame(height: 30)
                    LazyVGrid(columns: twoColumnGrid) {
                        if viewModel.selectedFilter == .movie {
                            ForEach(viewModel.favoritedMovies, id: \.self) { movie in
                                NavigationLink(destination: MovieDetailView(movieId: movie.id)) {
                                    MuCardView(imagePath: movie.imagePath ?? "", title: movie.name)
                                }
                            }
                        } else if viewModel.selectedFilter == .artist {
                            ForEach(viewModel.favoritedArtists, id: \.self) { artist in
                                ArtistCard(artist: artist)
                            }
                        }
                    }
                    Spacer().frame(height: 30)
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


struct FilterButtons: View {
    @ObservedObject var viewModel: FavoritesListViewModel
    
    var body: some View {
        HStack(alignment: .bottom) {
            Spacer().frame(width: 25)
            FilterButton(viewModel: viewModel, type: .movie)
            Spacer().frame(width: 25)
            FilterButton(viewModel: viewModel, type: .artist)
            Spacer()
        }.frame(height: 50)
    }
}

struct FilterButton: View {
    @ObservedObject var viewModel: FavoritesListViewModel
    let type: FavoritableType
    
    var body: some View {
        Button(action: {
            viewModel.changeSelectedFilter(newFilter: type)
        }) {
            VStack {
                Text(type.userFriendlyLabel)
                Rectangle()
                    .frame(width: 65, height: 4)
                    .foregroundColor(viewModel.selectedFilter == type ? .mainOrange : .clear)
            }
        }.accentColor(.black)
    }
}

struct ArtistCard: View {
    let artist: Favoritable
    
    @State var isPresentingArtistDetails = false
    
    var body: some View {
        MuCardView(imagePath: artist.imagePath ?? "", title: artist.name)
            .onTapGesture(count: 1, perform: {
                isPresentingArtistDetails = true
            })
            .sheet(isPresented: $isPresentingArtistDetails, content: {
                ArtistDetailView(id: artist.id, isPresented: $isPresentingArtistDetails)
            })
    }
}
