//
//  ArtistDetailView.swift
//  Muuuvie
//
//  Created by Camille Grings on 31/10/20.
//

import SwiftUI
import FetchImage

struct ArtistDetailView: View {
    @ObservedObject var viewModel: ArtistDetailViewModel
    @Binding var isPresented: Bool
    
    var artist: ArtistDetailModel! { viewModel.artist! }
    
    init(id: Int, isPresented: Binding<Bool>) {
        viewModel = ArtistDetailViewModel(id: id)
        self._isPresented = isPresented
    }
    
    func closeButtonAction() {
        isPresented = false
    }
    
    func favoriteButtonAction() {
        viewModel.toggleFavorite()
    }
    
    var body: some View {
        NavigationView {
            Group {
                if let artist = viewModel.artist {
                    ArtistDetailBodyView(artist: artist, isFavorited: viewModel.isFavorited, closeButtonAction: closeButtonAction, favoriteButtonAction: favoriteButtonAction)
                }
            }
            .navigationBarHidden(true)
        }
        .onAppear {
            viewModel.fetchArtist()
        }
        .alert(isPresented: $viewModel.hasError) {
            Alert(title: Text(viewModel.message))
        }
        .overlay(FullScreenLoadingView(isLoading: $viewModel.isLoading))
    }
}

struct ArtistDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let view = ArtistDetailView(id: 287, isPresented: .constant(true))
        view.viewModel.artist = .mocked
        return view
    }
}

struct ArtistInfo: View {
    let name: String
    let department: String
    let birthday: Date?
    let isFavorited: Bool
    var action: () -> Void
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(name)
                    .font(.title)
                    .padding(.bottom, 1)
                
                HStack {
                    Text(department)
                        .font(.subheadline)

                    
                    if let birthday = birthday {
                        Text("|")
                            .font(.subheadline)
                        
                        Text(birthday.formatted)
                            .font(.subheadline)
                    } else {
                        EmptyView()
                    }

                }
            }
            Spacer()
            IconButtonView(theme: isFavorited ? .primary : .secondary, image: .favoriteIcon, action: action)
            
        }
        .foregroundColor(.white)
        .padding(18)
    }
}

struct SummaryHeader: View {
    var body: some View {
        Group {
            Text("Summary")
                .padding(6)
                .padding(.leading, 18)
            
            Rectangle()
                .frame(minWidth: 0, idealWidth: .infinity, maxWidth: .infinity, minHeight: 5, idealHeight: 5, maxHeight: 5, alignment: .center)
                .foregroundColor(.mainOrange)
        }
    }
}

struct CloseViewButton: View {
    var action: () -> Void
    
    var body: some View {
        HStack {
            Spacer()
            Button(action: action){
                Image.close
                    .foregroundColor(.white)
                    .padding(15)
                    .font(Font.title2)
            }
            
        }
    }
}

struct ArtistDetailBodyView: View {
    var artist: ArtistDetailModel
    var isFavorited: Bool
    var closeButtonAction: () -> Void
    var favoriteButtonAction: () -> Void
    
    var body: some View {
        VStack {
            ZStack(alignment: .top) {
                ImageView(imageUrl: URL(string: Api.instance.imageUrl(from: artist.imagePath ?? ""))!)
                    .frame(width: UIScreen.main.bounds.width, height: 425, alignment: .center)
                    .clipped()
                Rectangle()
                    .foregroundColor(.clear)
                    .background(LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .top, endPoint: .bottom))
                
                VStack(alignment: .leading) {
                    CloseViewButton(action: closeButtonAction)
                    Spacer()

                    ArtistInfo(name: artist.name, department: artist.knownForDepartment, birthday: artist.birthday, isFavorited: isFavorited, action: favoriteButtonAction)
                }
            }
            
            VStack(alignment: .leading) {
                SummaryHeader()
                
                Text(artist.biography)
                    .font(.body)
                    .foregroundColor(.grayText)
                    .padding(20)
                Spacer()
            }
        }
    }
}
