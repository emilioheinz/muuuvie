//
//  Date+Formatter.swift
//  Muuuvie
//
//  Created by Camille Grings on 31/10/20.
//

import Foundation

extension Date {
    
    var formatted: String {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        formatter.setLocalizedDateFormatFromTemplate("MMMM dd, yyyy")
        
        return formatter.string(from: self)
    }
    
}
