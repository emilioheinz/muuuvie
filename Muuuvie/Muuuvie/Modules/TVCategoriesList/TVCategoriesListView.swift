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
        ScrollView( showsIndicators: false) {
            VStack(spacing: 30) {
                ForEach(viewModel.categories) { category in
                    TVCategoryView(category: category)
                }
            }
        }.alert(isPresented: $viewModel.hasError) {
            Alert(title: Text(viewModel.message))
        }.overlay(FullScreenLoadingView(isLoading: $viewModel.isLoading))
    }
}

struct TVCategoriesListView_Previews: PreviewProvider {
    static var previews: some View {
        TVCategoriesListView()
    }
}
