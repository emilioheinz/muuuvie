//
//  MoviesCategoriesListView.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 31/10/20.
//

import SwiftUI

struct MovieCategoryListView: View {
    @ObservedObject private var viewModel = MovieCategoryListViewModel()
    
    init() {
        self.configureNavigationBarAppearence()
    }
    
    var body: some View {
        
        NavigationView {
            ScrollView( showsIndicators: false) {
                VStack(spacing: 30) {
                    ForEach(viewModel.categories) { category in
                        MoviesCategoryView(category: category)
                    }
                }
                .padding(
                    EdgeInsets(
                        top: 30,
                        leading: 10,
                        bottom: 30,
                        trailing: 0
                    )
                )
                .navigationBarTitle("Movies", displayMode: .large)
            }
        }
        .accentColor(Color.black)
        .onAppear {
            viewModel.fetchMovieCategoryList()
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
