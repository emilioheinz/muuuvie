//
//  ReviewListItemView.swift
//  Muuuvie
//
//  Created by Lucas Eduardo Backes on 31/10/20.
//
import SwiftUI
import FetchImage

struct ReviewListItemView: View {
    @ObservedObject var image: FetchImage

    let review: ReviewModel
    
    init(review: ReviewModel) {
        self.review = review
        self.image = FetchImage(url: URL(string: review.getAvatar())!)
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            image
                .view?
                .resizable()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
                .padding(.top, 10)
            VStack(alignment: .leading, spacing: 10) {
                Text(review.author)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.grayText)
                Text(review.review)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(5)
            }
        }
        .padding(.horizontal, 20)
        .padding(.top, 15)
        .padding(.bottom, 15)
    }
}

struct ReviewListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewListItemView(review: .mocked)
            .previewLayout(.fixed(width: 375, height: 165))
    }
}
