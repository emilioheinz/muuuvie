//
//  ImageView.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 31/10/20.
//

import SwiftUI
import FetchImage

public struct ImageView: View {
    @ObservedObject var image: FetchImage
    
    init(imageUrl: URL) {
        self.image = FetchImage(url: imageUrl)
    }

    public var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.imageGrayBackground)
            image.view?
                .resizable()
                .aspectRatio(contentMode: .fill)
        }
        .animation(.default)
        .onAppear {
            image.priority = .normal
            image.fetch()
        }
        .onDisappear {
            image.priority = .low
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        let url = URL(string: "https://cloud.githubusercontent.com/assets/1567433/9781817/ecb16e82-57a0-11e5-9b43-6b4f52659997.jpg")!
        return ImageView(imageUrl: url)
            .frame(width: 80, height: 80)
            .clipped()
    }
}
