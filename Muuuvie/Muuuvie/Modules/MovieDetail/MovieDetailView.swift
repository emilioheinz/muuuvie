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
            if let movie = viewModel.movie {
                VStack() {
                    ZStack(alignment: .bottom) {
                        ImageView(imageUrl: URL(string: Api.instance.imageUrl(from: viewModel.movie?.backdropImage ?? ""))!)
                            .frame(width: 0, height: 425, alignment: .center)
                        
                        GradientOverImage()
                        
                        MovieInfo(movie: movie)
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
            } else {
                if viewModel.isLoading {
                    EmptyView()
                } else {
                    Text("Nenhum filme encontrado!")
                }
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .onAppear {
            viewModel.fetchMovie(id: movieId)
            self.configureNavigationBarAppearence(isTranslucent: true)
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
        HStack() {
            Text("\(voteAvarage.withOneDecimalPlaceString)").foregroundColor(.favoriteYellow)
                .fontWeight(.bold)
                .font(.title2)
            
            ForEach(1...5, id: \.self) {
                let iconColor: Color = $0 <= voteAvarage.intValue / 2 ? .favoriteYellow : .gray
                
                Image.favoriteIconFill
                    .foregroundColor(iconColor)
            }
        }
    }
}

struct MovieInfo: View {
    let movie: MovieDetailModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(movie.title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
            Text("Status: \(movie.status)" )
                .font(.subheadline)
                .fontWeight(.light)
                .foregroundColor(Color.white)
            RatingStars(voteAvarage: movie.voteAvarage)
            Text(movie.overview)
                .font(.title3)
                .fontWeight(.regular)
                .foregroundColor(Color.white)
                .lineLimit(6)
        }
        .padding(30)
    }
}

struct GradientOverImage: View {
    var body: some View {
        Rectangle()
            .foregroundColor(.clear)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [.clear, .black]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
    }
}
