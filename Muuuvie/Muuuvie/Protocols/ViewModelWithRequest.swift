//
//  ViewModelWithRequest.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 30/10/20.
//

import Foundation

protocol ViewModelWithRequest {
    var isLoading: Bool { get }
    var hasError: Bool { get }
    var message: String { get }
}
