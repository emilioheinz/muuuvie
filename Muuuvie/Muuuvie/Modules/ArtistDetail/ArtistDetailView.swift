//
//  ArtistDetailView.swift
//  Muuuvie
//
//  Created by Camille Grings on 31/10/20.
//

import SwiftUI
import FetchImage

struct ArtistDetailView: View {
    let artist: ArtistModel
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            ArtistImage(profileImagePath: artist.profileImagePath)

            ArtistInfo(name: artist.name, department: artist.knownForDepartment, birthday: artist.birthday)
        }
        .frame(width: .infinity, height: 400)
    }
}

struct ArtistDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistDetailView(artist: .mocked)
    }
}

struct ArtistInfo: View {
    let name: String
    let department: String
    let birthday: String?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(name)
                .font(.title)
                .padding(.bottom, 1)
            
            HStack {
                Text(department)
                    .font(.subheadline)

                
                if let birthday = birthday {
                    Text(" | ")
                        .font(.subheadline)
                    
                    Text(birthday)
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
