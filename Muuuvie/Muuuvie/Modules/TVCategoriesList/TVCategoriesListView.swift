//
//  TVCategoriesListView.swift
//  Muuuvie
//
//  Created by Camille Grings on 07/11/20.
//

import SwiftUI

struct TVCategoriesListView: View {
    @ObservedObject var viewModel = TVCategoriesListViewModel()
    
    init(){
        viewModel.fetchTVCategoriesList()
    }
    
    var body: some View {
        NavigationView {
            ScrollView( showsIndicators: false) {
                VStack(spacing: 30) {
                    ForEach(viewModel.categories) { category in
                        TVCategoryView(category: category)
                    }
                }
                .padding(EdgeInsets(top: 25, leading: 20, bottom: 0, trailing: 0))
                .navigationBarTitle("TV", displayMode: .large)
            }
        }
        .accentColor(Color.black)
        .onAppear {
            self.configureNavigationBarAppearence()
        }
        .alert(isPresented: $viewModel.hasError) {
            Alert(title: Text(viewModel.message))
        }
        .overlay(FullScreenLoadingView(isLoading: $viewModel.isLoading))
    }
}

struct TVCategoriesListView_Previews: PreviewProvider {
    static var previews: some View {
        TVCategoriesListView()
    }
}
