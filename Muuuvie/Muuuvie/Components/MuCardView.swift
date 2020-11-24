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
    let imageUrl: URL
    
    init(imagePath: String, title: String, cardType: MuCardTypeEnum = .large) {
        self.title = title
        self.cardType = cardType
        self.imageUrl = URL(string: Api.instance.imageUrl(from: imagePath))!
    }
    
    var body: some View {
        VStack {
            ImageView(imageUrl: imageUrl)
                .frame(width: cardType.width, height: cardType.height)
                .cornerRadius(10)
                .shadow(radius: 4)
            Text(title)
                .fontWeight(cardType.fontWeight)
                .font(cardType.font)
                .frame(width: cardType.width)
                .lineLimit(2)
                .foregroundColor(Color.black)
        }.padding(5)
    }
}

struct MuCardView_Previews: PreviewProvider {
    static var previews: some View {
        MuCardView(
            imagePath: MovieModel.mocked.imagePath ?? "",
            title: MovieModel.mocked.name
        )
    }
}
