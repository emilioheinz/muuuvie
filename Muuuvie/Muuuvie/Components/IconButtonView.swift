//
//  IconButtonView.swift
//  Muuuvie
//
//  Created by Camille Grings on 31/10/20.
//

import SwiftUI

struct IconButtonView: View {
    var image: String
    var label: String?
    var action: () -> Void

    var body: some View {
        VStack {
            Button(action: action) {
                Image(systemName: image)
                    .foregroundColor(.white)
            }.frame(width: 54, height: 54)
            .background(Circle()
                            .foregroundColor(.mainOrange)
                            .shadow(color: .shadowGray, radius: 2, x: 0, y: 5))
            
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
        IconButtonView(image: "star.fill") {
            print("Ola")
        }
    }
}
