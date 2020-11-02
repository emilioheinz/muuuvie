//
//  MoviesCategory.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 31/10/20.
//

import SwiftUI

struct MoviesCategoryView: View {
    let category: MovieCategoryModel
    let onMovieTap: (_ id: Int) -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Spacer().frame(width: 10)
                Text(category.categoryType.title)
                    .font(.title3)
                    .foregroundColor(.grayText)
                    .fontWeight(.bold)
                Spacer()
                Text("See all")
                    .font(.body)
                    .foregroundColor(.grayText)
                    .fontWeight(.light)
                    .underline()
                Spacer().frame(width: 10)
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top) {
                    ForEach(category.movies) { movie in
                        MuCardView(imagePath: movie.posterImagePath ?? "", title: movie.title)
                            .onTapGesture {
                                onMovieTap(movie.id)
                            }
                    }
                }
            }
        }
    }
}

struct MoviesCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesCategoryView(category: MovieCategoryModel.mocked) { id in
            print(id)
        }
    }
}
