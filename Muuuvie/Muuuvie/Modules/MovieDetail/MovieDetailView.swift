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
        self.configureNavigationBarAppearence()
    }
    
    var body: some View {
        ScrollView {
            if let movie = viewModel.movie {
                VStack() {
                    ZStack(alignment: .bottom) {
                        ImageView(imageUrl: URL(string: Api.instance.imageUrl(from: viewModel.movie?.backdropImage ?? ""))!)
                            .frame(width: UIScreen.main.bounds.width, height: 425, alignment: .center)
                            .clipped()
                        
                        GradientOverImage()
                        
                        MovieInfo(movie: movie, videos: viewModel.videos ?? [])
                    }
                    
                    if let artists = viewModel.artists {
                        FullCastList(artists: artists)
                    }
                    
                    Spacer().frame(height: 20)
                    BottomActionButtons()
                    Spacer().frame(height: 35)
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
        }
        .alert(isPresented: $viewModel.hasError) {
            Alert(title: Text(viewModel.message))
        }
        .overlay(FullScreenLoadingView(isLoading: $viewModel.isLoading))
        .navigationBarTitle("", displayMode: .inline)
        .background(Color.appBrackground)
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

struct VideoButton: View {
    let movieVideos: [MovieVideoModel]
    var videoURL: URL?
    
    init(movieVideos: [MovieVideoModel]) {
        self.movieVideos = movieVideos
        self.videoURL = getYoutubeVideo()
    }
    
    func openVideoWebView() -> Void {
        print(getYoutubeVideo() ?? "não foi dessa vez")
    }
    
    func getYoutubeVideo() -> URL? {
        let videoIndex = movieVideos.firstIndex() { movieVideo in
            movieVideo.site == "YouTube"
        }
        
        if let index = videoIndex {
            return movieVideos[index].getVideoURL()
        }
        
        return nil
    }
        
    var body: some View {
        IconButtonView(theme: .primary, image: .playIcon, action: openVideoWebView)
    }
}

struct MovieInfo: View {
    let movie: MovieDetailModel
    let videos: [MovieVideoModel]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(movie.title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
            HStack {
                VStack(alignment: .leading) {
                    Text("Status: \(movie.status)" )
                        .font(.subheadline)
                        .fontWeight(.light)
                        .foregroundColor(Color.white)
                    RatingStars(voteAvarage: movie.voteAvarage)
                }
                VideoButton(movieVideos: videos)
            }
            Text(movie.overview)
                .font(.title3)
                .fontWeight(.regular)
                .foregroundColor(Color.white)
                .lineLimit(6)
        }
        .padding(20)
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

struct ArtistCart: View {
    let artist: ArtistModel
    
    @State private var artistDetailPresented: Bool = false
    
    var body: some View {
        MuCardView(
            imagePath: artist.imagePath ?? "",
            title: artist.name,
            cardType: .small
        ).onTapGesture(count: 1) {
            artistDetailPresented = true
        }.sheet(isPresented: $artistDetailPresented) {
            ArtistDetailView(id: artist.id, isPresented: $artistDetailPresented)
        }
    }
}

struct FullCastList: View {
    let artists: [ArtistModel]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Full Cast & Crew")
                .font(.title2)
                .bold()
                .foregroundColor(.grayText)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top) {
                    ForEach(artists) { artist in
                        if artist.imagePath != nil {
                            ArtistCart(artist: artist)
                        } else {
                            EmptyView()
                        }
                    }
                }
            }
        }
        .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 0))
    }
}

struct BottomActionButtons: View {
    var body: some View {
        HStack() {
            IconButtonView(theme: .primary, image: .like) {}
                .frame(maxWidth: .infinity)
            IconButtonView(theme: .secondary, image: .favoriteIcon) {}
                .frame(maxWidth: .infinity)
            IconButtonView(theme: .secondary, image: .reviews) {}
                .frame(maxWidth: .infinity)
        }
    }
}
