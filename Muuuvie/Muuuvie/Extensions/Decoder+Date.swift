//
//  DateFormatter+Decoding.swift
//  Muuuvie
//
//  Created by Camille Grings on 02/11/20.
//

import UIKit

extension Decoder {
    
    func dateFormatterWithoutTime() throws -> Date {
        let container = try self.singleValueContainer()
        let dateString = try container.decode(String.self)
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        if let date = formatter.date(from: dateString) {
            return date
        }
        
        throw DecodingError.dataCorruptedError(in: container, debugDescription: "Cannot decode date string \(dateString)")
    }
}
