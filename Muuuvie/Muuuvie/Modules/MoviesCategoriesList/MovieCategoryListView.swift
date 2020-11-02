//
//  MoviesCategoriesListView.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 31/10/20.
//

import SwiftUI

struct MovieCategoryListView: View {
    @ObservedObject private var viewModel = MovieCategoryListViewModel()
    @State private var isMovieDetailPresented: Bool = false
    @State private var tappedMovieId: Int?
    
    var body: some View {
        NavigationView {
            ScrollView( showsIndicators: false) {
                VStack(spacing: 30) {
                    ForEach(viewModel.categories) { category in
                        MoviesCategoryView(category: category) { id in
                            tappedMovieId = id
                            isMovieDetailPresented = true
                        }
                    }
                }
            }
            .onAppear {
                viewModel.fetchMovieCategoryList()
            }
            .alert(isPresented: $viewModel.hasError) {
                Alert(title: Text(viewModel.message))
            }
            .overlay(FullScreenLoadingView(isLoading: $viewModel.isLoading))
            .fullScreenCover(isPresented: $isMovieDetailPresented) {
                MovieDetailView(movieId: $tappedMovieId, isPresented: $isMovieDetailPresented)
            }
            .navigationBarTitle("Movies", displayMode: .large)
        }
        .accentColor(.black)
        .background(Color.white)
    }
}

struct MoviesCategoriesListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieCategoryListView()
    }
}
