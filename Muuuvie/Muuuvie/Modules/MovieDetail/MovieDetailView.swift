//
//  MovieDetailView.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 30/10/20.
//

import SwiftUI

struct MovieDetailView: View {
    @ObservedObject var viewModel = MovieDetailViewModel()
    @State private var artistDetailPresented: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello, World!")
                Button(action: {artistDetailPresented = true}){
                    Text("Open artist detail")
                }.sheet(isPresented: $artistDetailPresented) {
                    ArtistDetailView(id: 287)
                }
                
                    
            }
            
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
