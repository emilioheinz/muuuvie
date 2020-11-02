//
//  MovieDetailView.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 30/10/20.
//

import SwiftUI

struct MovieDetailView: View {
    let movieId: Int
    
    @ObservedObject var viewModel = MovieDetailViewModel()
    
    init(movieId: Int) {
        self.movieId = movieId
    }
    
    var body: some View {
        ScrollView {
            VStack() {
                ZStack(alignment: .bottom) {
                    ImageView(imageUrl: URL(string: Api.instance.imageUrl(from: viewModel.movie?.backdropImage ?? ""))!)
                        .frame(width: 0, height: 425, alignment: .center)
                    VStack(alignment: .leading) {
                        Text(viewModel.movie?.title ?? "")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                        Text("Status: \(viewModel.movie?.status ?? "")" )
                            .font(.subheadline)
                            .fontWeight(.light)
                            .foregroundColor(Color.white)
                        RatingStars(voteAvarage: viewModel.movie?.voteAvarage ?? 0.0)
                        Text(viewModel.movie?.overview ?? "")
                            .font(.title3)
                            .fontWeight(.regular)
                            .foregroundColor(Color.white)
                            .lineLimit(6)
                    }
                    .padding(30)
                }
                VStack(alignment: .leading) {
                    Text("Full Cast & Crew")
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .top) {
//                            ForEach(movie.movies) { actor in
//                                MuCardView(imagePath: movie.posterImagePath ?? "", title: movie.title)
//                            }
                        }
                    }
                }
            }
        }
        .onAppear {
            viewModel.fetchMovie(id: movieId)
        }
        .alert(isPresented: $viewModel.hasError) {
            Alert(title: Text(viewModel.message))
        }
        .overlay(FullScreenLoadingView(isLoading: $viewModel.isLoading))
        .navigationBarTitle("", displayMode: .inline)
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movieId: 550)
    }
}

struct RatingStars: View {
    let voteAvarage: Double
    
    var body: some View {
        HStack {
            Text("\(voteAvarage)").foregroundColor(.white)
        }
    }
}
