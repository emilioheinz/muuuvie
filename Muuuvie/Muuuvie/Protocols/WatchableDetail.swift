//
//  WatchableDetail.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 29/11/20.
//

import Foundation

protocol WatchableDetail: Favoritable {
    var id: Int {get}
    var name: String {get}
    var imagePath: String? {get}
    var overview: String {get}
    var status: String {get}
    var voteAvarage: Double {get}
}
