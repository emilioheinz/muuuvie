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
    
    var artist: ArtistModel! { viewModel.artist! }
    
    init(id: Int, isPresented: Binding<Bool>) {
        viewModel = ArtistDetailViewModel(id: id)
        self._isPresented = isPresented
    }
    
    func closeButtonAction() {
        isPresented = false
    }
    
    func favoriteButtonAction() {
        // TODO: add favoriteButtonAction
    }
    
    var body: some View {
        NavigationView {
            Group {
                if viewModel.artist != nil {
                    ArtistDetailBodyView(artist: artist, closeButtonAction: closeButtonAction, favoriteButtonAction: favoriteButtonAction)
                } else {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .mainOrange))
                }
            }
            .navigationBarHidden(true)
            .onAppear {
                viewModel.fetchArtist()
            }
        }
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
            IconButtonView(theme: .secondary, image: .favoriteIcon, action: action)
            
        }
        .foregroundColor(.white)
        .padding(18)
    }
}

struct ArtistImage: View {
    @ObservedObject var image: FetchImage
    
    init(profileImagePath: String) {
        self.image = FetchImage(url: URL(string: Api.instance.imageUrl(from: profileImagePath))!)
    }
    
    var body: some View {
        Group {
            image
                .view?
                .resizable()
                .scaledToFill()
                .frame(width: .infinity, height: 400)
                .clipped()
            
            Rectangle()
                .foregroundColor(.clear)
                .background(LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .top, endPoint: .bottom))
        }
    }
}

struct SummaryHeader: View {
    var body: some View {
        Group {
            Text("Summary")
                .padding(6)
                .padding(.leading, 18)
            
            Rectangle()
                .frame(width: .infinity, height: 5)
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
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .padding(15)
                    .font(Font.title2)
            }
            
        }
    }
}

struct ArtistDetailBodyView: View {
    var artist: ArtistModel
    var closeButtonAction: () -> Void
    var favoriteButtonAction: () -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .leading) {
                ArtistImage(profileImagePath: artist.profileImagePath)
                
                VStack(alignment: .leading) {
                    CloseViewButton(action: closeButtonAction)
                    Spacer()

                    ArtistInfo(name: artist.name, department: artist.knownForDepartment, birthday: artist.birthday, action: favoriteButtonAction)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            }
            .frame(width: .infinity, height: 400)
            
            SummaryHeader()
            
            Text(artist.biography)
                .font(.body)
                .foregroundColor(.grayText)
                .padding(20)
        }
    }
}
