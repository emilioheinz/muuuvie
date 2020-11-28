//
//  MoviewReviewsView.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 07/11/20.
//

import SwiftUI

struct MovieReviewsView: View {
    @ObservedObject var viewModel = MovieReviewsViewModel()
    
    let movieId: Int
    
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack() {
            HStack {
                Spacer()
                Button(action: {
                    isPresented = false
                }){
                    Image.close
                        .foregroundColor(.black)
                        .padding(15)
                        .font(Font.title2)
                }
            }
            if let reviews = viewModel.reviews {
                if reviews.isEmpty {
                    Spacer()
                    NoData()
                } else {
                    List {
                        ForEach(reviews) { review in
                            ReviewListItemView(review: review)
                        }
                    }
                }
            } else {
                EmptyView()
            }
            
            Spacer()
        }
        .onAppear {
            viewModel.fetchArtist(movieId: movieId)
        }
        .alert(isPresented: $viewModel.hasError) {
            Alert(title: Text(viewModel.message))
        }
        .overlay(FullScreenLoadingView(isLoading: $viewModel.isLoading))
    }
}

struct MovieReviewsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieReviewsView(movieId: 550, isPresented: .constant(true))
    }
}
