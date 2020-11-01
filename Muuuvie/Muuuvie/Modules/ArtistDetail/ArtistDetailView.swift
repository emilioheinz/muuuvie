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
    
    var artist: ArtistModel! { viewModel.artist! }
    
    init(id: Int) {
        viewModel = ArtistDetailViewModel(id: id)
    }
    
    var body: some View {
        NavigationView {
            Group {
                if viewModel.artist != nil {
                    ArtistDetailBodyView(artist: artist)
                } else {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .mainOrange))
                }
            }
            .navigationBarTitle("")
            .navigationBarItems(trailing: Button(action: {
                print("vai fechar")
            }, label: {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
            }))
            .onAppear {
                viewModel.fetchArtist()
            }
        }
    }
}

struct ArtistDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let view = ArtistDetailView(id: 287)
        view.viewModel.artist = .mocked
        return view
    }
}

struct ArtistInfo: View {
    let name: String
    let department: String
    let birthday: Date?
    
    var body: some View {
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
        }.foregroundColor(.white)
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

struct ArtistDetailBodyView: View {
    var artist: ArtistModel
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .bottomLeading) {
                ArtistImage(profileImagePath: artist.profileImagePath)

                ArtistInfo(name: artist.name, department: artist.knownForDepartment, birthday: artist.birthday)
            }
            .frame(width: .infinity, height: 400)
            
            SummaryHeader()
            
            Text(artist.biography)
                .font(.body)
                .foregroundColor(.grayText)
                .padding(25)
        }
    }
}
