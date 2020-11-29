//
//  TVShowDetail.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 29/11/20.
//

import SwiftUI

struct TVShowDetailView: View {
    let tvShowId: Int
    
    @ObservedObject var viewModel = TVShowDetailViewModel()
    
    init(tvShowId: Int) {
        self.tvShowId = tvShowId
        self.configureNavigationBarAppearence()
    }
    
    var body: some View {
        ScrollView {
            if let show = viewModel.show {
                WatchableMainInfoView(watchable: show)
                
                if let artists = viewModel.artists {
                    FullCastListView(artists: artists)
                }
//
                Spacer().frame(height: 20)
                ActionButtonsView(watchableId: show.id, isFavorited: viewModel.isFavorited) {
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
            viewModel.fetchMovie(id: tvShowId)
        }
        .alert(isPresented: $viewModel.hasError) {
            Alert(title: Text(viewModel.message))
        }
        .overlay(FullScreenLoadingView(isLoading: $viewModel.isLoading))
        .navigationBarTitle("", displayMode: .inline)
        .background(Color.appBrackground)
    }
}

struct TVShowDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TVShowDetailView(tvShowId: 182)
    }
}
