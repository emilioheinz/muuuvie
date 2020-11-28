//
//  Watchable.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 26/11/20.
//

import Foundation

protocol Watchable: Encodable {
    var id: Int {get}
    var name: String {get}
    var imagePath: String? {get}
}
