//
//  WachatbleMainInfoView.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 29/11/20.
//

import SwiftUI

struct WatchableMainInfoView: View {
    let watchable: WatchableDetail
    
    var body: some View {
        VStack() {
            ZStack(alignment: .bottom) {
                ImageView(imageUrl: URL(string: Api.instance.imageUrl(from: watchable.imagePath ?? ""))!)
                    .frame(width: UIScreen.main.bounds.width, height: 425, alignment: .center)
                    .clipped()
                
                GradientOverImage()
                VStack(alignment: .leading, spacing: 5) {
                    Text(watchable.name)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                    Text("Status: \(watchable .status)" )
                        .font(.subheadline)
                        .fontWeight(.light)
                        .foregroundColor(Color.white)
                    RatingStarsView(voteAvarage: watchable.voteAvarage)
                    Text(watchable.overview)
                        .font(.title3)
                        .fontWeight(.regular)
                        .foregroundColor(Color.white)
                        .lineLimit(6)
                }
                .padding(20)
            }
        }
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

struct WatchableMainInfoView_Previews: PreviewProvider {
    static var previews: some View {
        WatchableMainInfoView(watchable: MovieDetailModel.mocked)
    }
}
