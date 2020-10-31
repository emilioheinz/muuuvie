//
//  MovieDetailView.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 30/10/20.
//

import SwiftUI

struct MovieDetailView: View {
    @ObservedObject var viewModel = MovieDetailViewModel()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onAppear {
                viewModel.fetchMovie(id: 550)
            }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView()
    }
}
