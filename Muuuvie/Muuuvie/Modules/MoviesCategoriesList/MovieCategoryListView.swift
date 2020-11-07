//
//  MoviesCategoriesListView.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 31/10/20.
//

import SwiftUI

struct MovieCategoryListView: View {
    @ObservedObject private var viewModel = MovieCategoryListViewModel()
    
    var body: some View {
        
        NavigationView {
            ScrollView( showsIndicators: false) {
                VStack(spacing: 30) {
                    ForEach(viewModel.categories) { category in
                        MoviesCategoryView(category: category)
                    }
                }
                .padding(EdgeInsets(top: 25, leading: 20, bottom: 0, trailing: 0))
                .navigationBarTitle("Movies", displayMode: .large)
            }
        }
        .accentColor(Color.black)
        .onAppear {
            viewModel.fetchMovieCategoryList()
            self.configureNavigationBarAppearence()
        }
        .alert(isPresented: $viewModel.hasError) {
            Alert(title: Text(viewModel.message))
        }
        .overlay(FullScreenLoadingView(isLoading: $viewModel.isLoading))
    }
}

struct MoviesCategoriesListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieCategoryListView()
    }
}
