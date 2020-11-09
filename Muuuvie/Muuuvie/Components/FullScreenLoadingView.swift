//
//  FullScreenLoadingView.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 31/10/20.
//

import SwiftUI

struct FullScreenLoadingView: View {
    @Binding var isLoading: Bool
    
    var body: some View {
        if isLoading {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: Color.white))
                .scaleEffect(1.5)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .background(Color.loaderBackground)
                .edgesIgnoringSafeArea(.all)
        } else {
            EmptyView()
        }
    }
}

struct FullScreenLoadingView_Previews: PreviewProvider {
    static var previews: some View {
        FullScreenLoadingView(isLoading: .constant(true))
    }
}
