//
//  FavoritesListView.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 08/11/20.
//

import SwiftUI

struct FavoritesListView: View {
    private var twoColumnGrid = [GridItem(.flexible(), alignment: .top), GridItem(.flexible(), alignment: .top)]
    
    @ObservedObject var viewModel = FavoritesListViewModel(favoritesInstance: Favorites.instance)
    
    var body: some View {
        NavigationView {
            VStack {
                FilterButtons(
                    selectedFilter: $viewModel.selectedFilter,
                    changeSelectedFilter: { newFilter in
                        viewModel.changeSelectedFilter(newFilter: newFilter)
                    }
                )
                ScrollView {
                    Spacer().frame(height: 30)
                    if viewModel.selectedFilter == .movie {
                        if viewModel.favoritedMovies.count == 0 {
                            NoData()
                        } else {
                            LazyVGrid(columns: twoColumnGrid) {
                                ForEach(viewModel.favoritedMovies, id: \.self) { movie in
                                    NavigationLink(destination: MovieDetailView(movieId: movie.id).onDisappear { viewModel.getFavorittedItems()
                                    }) {
                                        MuCardView(imagePath: movie.imagePath ?? "", title: movie.name)
                                    }
                                }
                            }
                        }
                    } else if viewModel.selectedFilter == .artist {
                        if viewModel.favoritedArtists.count == 0 {
                            NoData()
                        } else {
                            LazyVGrid(columns: twoColumnGrid) {
                                ForEach(viewModel.favoritedArtists, id: \.self) { artist in
                                    ArtistCard(viewModel: viewModel, artist: artist)
                                }
                            }
                        }
                    } else if viewModel.selectedFilter == .tvShow {
                        if viewModel.favoritedTVShows.count == 0 {
                            NoData()
                        } else {
                            LazyVGrid(columns: twoColumnGrid) {
                                ForEach(viewModel.favoritedTVShows, id: \.self) { tvShow in
                                    NavigationLink(destination: TVShowDetailView(tvShowId: tvShow.id).onDisappear { viewModel.getFavorittedItems()
                                    }) {
                                        MuCardView(imagePath: tvShow.imagePath ?? "", title: tvShow.name)
                                    }
                                }
                            }
                        }
                    }
                    Spacer().frame(height: 30)
                }
                .navigationBarTitle("Favorites", displayMode: .large)
            }
        }.onAppear {
            self.configureNavigationBarAppearence()
            viewModel.getFavorittedItems()
        }.accentColor(.black)
    }
}

struct FavoritesListView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesListView()
    }
}


struct FilterButtons: View {
    @Binding var selectedFilter: FavoritableTypeEnum
    let changeSelectedFilter: (_ newFilter: FavoritableTypeEnum) -> Void
    
    var body: some View {
        HStack(alignment: .bottom) {
            Spacer().frame(width: 25)
            ForEach(FavoritableTypeEnum.allCases, id: \.self) { currentCase in
                FilterButton(
                    changeSelectedFilter: changeSelectedFilter,
                    selectedFilter: $selectedFilter,
                    type: currentCase
                )
            }
            Spacer().frame(width: 25)
        }.frame(height: 50)
    }
}

struct FilterButton: View {
    let changeSelectedFilter: (_ newFilter: FavoritableTypeEnum) -> Void
    @Binding var selectedFilter: FavoritableTypeEnum
    let type: FavoritableTypeEnum
    
    var body: some View {
        Button(action: {
            changeSelectedFilter(type)
        }) {
            VStack {
                Text(type.userFriendlyLabel)
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 4)
                    .foregroundColor(selectedFilter == type ? .mainOrange : .clear)
            }
        }.accentColor(.black)
    }
}

struct ArtistCard: View {
    let viewModel: FavoritesListViewModel
    let artist: Favoritable
    
    @State var isPresentingArtistDetails = false
    
    var body: some View {
        MuCardView(imagePath: artist.imagePath ?? "", title: artist.name)
            .onTapGesture(count: 1, perform: {
                isPresentingArtistDetails = true
            })
            .sheet(isPresented: $isPresentingArtistDetails, content: {
                ArtistDetailView(id: artist.id, isPresented: $isPresentingArtistDetails)
                    .onDisappear {
                        viewModel.getFavorittedItems()
                    }
            })
    }
}
