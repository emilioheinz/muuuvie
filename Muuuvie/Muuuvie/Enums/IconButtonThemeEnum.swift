//
//  IconButtonTheme.swift
//  Muuuvie
//
//  Created by Camille Grings on 31/10/20.
//

import SwiftUI

enum IconButtonThemeEnum {
    case primary
    case secondary
    
    var backgroundColor: Color {
        switch self {
        case .primary:
            return Color(.mainOrange)
        case .secondary:
            return Color(.white)
        }
    }
    
    var iconColor: Color {
        switch self {
        case .primary:
            return Color(.white)
        case .secondary:
            return Color(.iconGray)
        }
    }
}

