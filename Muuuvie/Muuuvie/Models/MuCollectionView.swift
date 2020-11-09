//
//  MuCollectionView.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 08/11/20.
//

import SwiftUI

struct MuCollectionView: View {
    let columns: Int = 2
    let data: Array<Any>
    let renderFunction: (_ index: Int) -> Any
    
    var body: some View {
        VStack {
//            ForEach(0..<data.count / columns) { row in
//                HStack {
//                    ForEach(0..<columns) { column in
//                        let index = row + column + ( row * (columns - 1))
//                        
//                        return  renderFunction(index)
//                    }
//                }
//            }
        }
    }
}

struct MuCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        MuCollectionView(data: [1, 2, 3, 4, 5, 6, 7, 8, 9]) { index in
            print(index)
        }
    }
}
