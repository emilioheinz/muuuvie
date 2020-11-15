//
//  Double+TwoDecimalPlacesFormater.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 03/11/20.
//

import Foundation

extension Double {
    var withOneDecimalPlaceString: String {
        String(format: "%.1f", self)
    }
    
    var intValue: Int {
        Int(self)
    }
}
