//
//  ActionButtons.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 29/11/20.
//

import SwiftUI

struct ActionButtonsView: View {
    
    @State private var areReviewsPresented: Bool = false
    
    let watchableId: Int
    let isFavorited: Bool
    let onFavoritePress: () -> Void
    
    var body: some View {
        HStack() {
            IconButtonView(theme: .secondary, image: .like) {}
                .frame(maxWidth: .infinity)
            
            IconButtonView(theme: isFavorited ? .primary : .secondary, image: .favoriteIcon) {
                onFavoritePress()
            }
            .frame(maxWidth: .infinity)
            
            IconButtonView(theme: .secondary, image: .reviews) {
                areReviewsPresented = true
            }
            .frame(maxWidth: .infinity)
            .sheet(isPresented: $areReviewsPresented) {
                MovieReviewsView(movieId: watchableId, isPresented: $areReviewsPresented)
            }
        }
    }
}

struct ActionButtons_Previews: PreviewProvider {
    static var previews: some View {
        ActionButtonsView(watchableId: 1232, isFavorited: true) {
            print("Preview")
        }
    }
}
