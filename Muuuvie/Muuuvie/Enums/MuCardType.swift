//
//  MuCardSize.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 31/10/20.
//

import SwiftUI

enum MuCardType {
    case large
    case small
    
    var width: CGFloat {
        switch self {
        case .large:
            return CGFloat(140)
        case .small:
            return CGFloat(70)
        }
    }
    
    var height: CGFloat {
        switch self {
        case .large:
            return CGFloat(210)
        case .small:
            return CGFloat(105)
        }
    }
    
    var font: Font {
        switch self {
        case .large:
            return .headline
        case .small:
            return .subheadline
        }
    }
    
    var fontWeight: Font.Weight {
        switch self {
        case .large:
            return .semibold
        case .small:
            return .regular
        }
    }
}
