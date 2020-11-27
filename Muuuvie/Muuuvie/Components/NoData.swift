//
//  NoData.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 26/11/20.
//

import SwiftUI

struct NoData: View {
    var body: some View {
        VStack(alignment: .center) {
            Image.sadFace
                .resizable()
                .frame(width: 160, height: 160)
            Text("Opss, nothing to see here. Come back latter!")
                .font(.headline)
                .padding(.top, 5.0)
                .multilineTextAlignment(.center)
                .frame(width: 200)
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .center
        )
    }
}

struct NoData_Previews: PreviewProvider {
    static var previews: some View {
        NoData()
    }
}
