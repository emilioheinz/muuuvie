//
//  MovieDetailView.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 30/10/20.
//

import SwiftUI

struct MovieDetailView: View {
    let movieId: Int
    
    @ObservedObject var viewModel = MovieDetailViewModel()
    
    init(movieId: Int) {
        self.movieId = movieId
        self.configureNavigationBarAppearence()
    }
    
    var body: some View {
        ScrollView {
            if let movie = viewModel.movie {
                WatchableMainInfoView(watchable: movie, movieVideos: viewModel.videos)
                
                if let artists = viewModel.artists {
                    FullCastListView(artists: artists)
                }
                
                Spacer().frame(height: 20)
                ActionButtonsView(watchableId: movie.id, isFavorited: viewModel.isFavorited, shouldShowCommentsButton: true) {
                    viewModel.toggleFavorite()
                }
                Spacer().frame(height: 35)
            } else {
                if viewModel.isLoading {
                    EmptyView()
                } else {
                    NoData()
                }
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .onAppear {
            viewModel.fetchMovie(id: movieId)
        }
        .alert(isPresented: $viewModel.hasError) {
            Alert(title: Text(viewModel.message))
        }
        .overlay(FullScreenLoadingView(isLoading: $viewModel.isLoading))
        .navigationBarTitle("", displayMode: .inline)
        .background(Color.appBrackground)
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movieId: 550)
    }
}
