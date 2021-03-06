//
//  IconButtonView.swift
//  Muuuvie
//
//  Created by Camille Grings on 31/10/20.
//

import SwiftUI

struct IconButtonView: View {
    var theme: IconButtonThemeEnum
    var image: Image
    var label: String?
    var action: () -> Void

    var body: some View {
        VStack {
            Button(action: action) {
                image
                    .foregroundColor(theme.iconColor)
                    .font(.title)
            }.frame(width: 54, height: 54)
            .background(
                Circle()
                    .foregroundColor(theme.backgroundColor)
                    .shadow(color: .shadowGray, radius: 5))
            
            if let label = label {
                Text(label)
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
                    .padding(.top, 5.0)
            } else {
                EmptyView()
            }
        }
        
    }
}

struct IconButtonView_Previews: PreviewProvider {
    static var previews: some View {
        IconButtonView(theme:.primary, image: .favoriteIconFill, label: "222K") {
            print("pressed")
        }
    }
}
