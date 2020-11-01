//
//  MuCard.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 31/10/20.
//

import SwiftUI
import FetchImage

struct MuCardView: View {
    let title: String
    let cardType: MuCardTypeEnum
    @ObservedObject var image: FetchImage
    
    init(imagePath: String, title: String, cardType: MuCardTypeEnum = .large) {
        self.title = title
        self.cardType = cardType
        self.image = FetchImage(url: URL(string: Api.instance.imageUrl(from: imagePath))!)
    }
    
    var body: some View {
        VStack {
            image
                .view?
                .resizable()
                .frame(width: cardType.width, height: cardType.height)
                .cornerRadius(10)
                .shadow(radius: 4)
            Text(title)
                .fontWeight(cardType.fontWeight)
                .font(cardType.font)
                .frame(width: cardType.width)
                .lineLimit(2)
        }.padding(10)
    }
}

struct MuCardView_Previews: PreviewProvider {
    static var previews: some View {
        MuCardView(
            imagePath: MovieModel.mocked.posterImagePath,
            title: MovieModel.mocked.title
        )
    }
}
