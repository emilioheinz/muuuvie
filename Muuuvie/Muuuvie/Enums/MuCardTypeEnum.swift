//
//  MuCardSize.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 31/10/20.
//

import SwiftUI

enum MuCardTypeEnum {
    case large
    case small
    case screenBased(factor: Float)
    
    var width: CGFloat {
        switch self {
        case .large:
            return CGFloat(140)
        case .small:
            return CGFloat(80)
        case .screenBased(let factor):
            return CGFloat(UIScreen.main.bounds.width / CGFloat(factor))
        }
    }
    
    var height: CGFloat {
        switch self {
        case .large, .screenBased:
            return CGFloat(210)
        case .small:
            return CGFloat(105)
        }
    }
    
    var font: Font {
        switch self {
        case .large, .screenBased:
            return .headline
        case .small:
            return .subheadline
        }
    }
    
    var fontWeight: Font.Weight {
        switch self {
        case .large, .screenBased:
            return .semibold
        case .small:
            return .regular
        }
    }
}
