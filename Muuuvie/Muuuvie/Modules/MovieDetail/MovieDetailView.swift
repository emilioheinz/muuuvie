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
        NavigationView {
            Text("Hello, World!")
                
        }.onAppear {
            viewModel.fetchMovie(id: 550)
        }.alert(isPresented: $viewModel.hasError) {
            Alert(title: Text(viewModel.message))
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView()
    }
}
