//
//  MovieDetailView.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 30/10/20.
//

import SwiftUI

struct MovieDetailView: View {
    @Binding var movieId: Int?
    @Binding var isPresented: Bool
    
    @ObservedObject var viewModel = MovieDetailViewModel()
    
    var body: some View {
        NavigationView {
            if let movieId = movieId {
                Text("\(movieId)")
                    .onAppear {
                        viewModel.fetchMovie(id: movieId)
                    }
            }
            
            Text("Filme não encontrado")
        }.alert(isPresented: $viewModel.hasError) {
            Alert(title: Text(viewModel.message))
        }.overlay(FullScreenLoadingView(isLoading: $viewModel.isLoading))
        
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movieId: .constant(550), isPresented: .constant(true))
    }
}
