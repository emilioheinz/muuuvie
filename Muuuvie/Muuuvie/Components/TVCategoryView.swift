//
//  TVCategoryView.swift
//  Muuuvie
//
//  Created by Camille Grings on 07/11/20.
//

import SwiftUI

struct TVCategoryView: View {
    let category: TVCategoryModel
    
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
                    ForEach(category.tvShows) { tvShow in
                        MuCardView(imagePath: tvShow.imagePath ?? "", title: tvShow.name)
                    }
                }
            }
        }
    }
}

struct TVCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        TVCategoryView(category: TVCategoryModel.mocked)
    }
}
