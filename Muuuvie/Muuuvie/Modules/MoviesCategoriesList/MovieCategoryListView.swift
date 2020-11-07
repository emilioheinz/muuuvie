//
//  MoviesCategoriesListView.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 31/10/20.
//

import SwiftUI

struct MovieCategoryListView: View {
    @ObservedObject var viewModel = MovieCategoryListViewModel()
    
    var body: some View {
        ScrollView( showsIndicators: false) {
            VStack(spacing: 30) {
                ForEach(viewModel.categories) { category in
                    MoviesCategoryView(category: category)
                }
            }
        }.onAppear {
            viewModel.fetchMovieCategoryList()
        }.alert(isPresented: $viewModel.hasError) {
            Alert(title: Text(viewModel.message))
        }.overlay(FullScreenLoadingView(isLoading: $viewModel.isLoading))
    }
}

struct MoviesCategoriesListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieCategoryListView()
    }
}
