//
//  MoviesCategoriesListView.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 31/10/20.
//

import SwiftUI

struct MoviesCategoriesListView: View {
    var body: some View {
        MuCard(
            imagePath: Movie.mocked.posterImagePath,
            title: Movie.mocked.title,
            cardType: .large
        )
    }
}

struct MoviesCategoriesListView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesCategoriesListView()
    }
}
