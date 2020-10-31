//
//  MoviesCategoriesListView.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 31/10/20.
//

import SwiftUI

struct MoviesCategoriesListView: View {
    let categories: [MovieCategory]
    
    var body: some View {
        ScrollView( showsIndicators: false) {
            VStack(spacing: 30) {
                ForEach(categories) { category in
                    MoviesCategoryView(category: category)
                }
            }
        }
    }
}

struct MoviesCategoriesListView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesCategoriesListView(categories: [
                                    MovieCategory.mocked,
                                    MovieCategory.mocked,
                                    MovieCategory.mocked,
                                    MovieCategory.mocked
        ])
    }
}
