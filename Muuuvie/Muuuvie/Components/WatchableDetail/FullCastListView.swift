//
//  FullCastListView.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 29/11/20.
//

import SwiftUI

struct FullCastListView: View {
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
                            ArtistCartView(artist: artist)
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

struct ArtistCartView: View {
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

struct FullCastListView_Previews: PreviewProvider {
    static var previews: some View {
        FullCastListView(artists: [])
    }
}
