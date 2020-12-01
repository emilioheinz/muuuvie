//
//  RatingStars.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 29/11/20.
//

import SwiftUI

struct RatingStarsView: View {
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

struct RatingStarsView_Previews: PreviewProvider {
    static var previews: some View {
        RatingStarsView(voteAvarage: 9)
    }
}
