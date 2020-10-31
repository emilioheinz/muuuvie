//
//  MuuuvieApp.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 29/10/20.
//

import SwiftUI

@main
struct MuuuvieApp: App {
    var body: some Scene {
        WindowGroup {
            MoviesCategoriesListView(categories: [
                MovieCategory.mocked,
                MovieCategory.mocked,
                MovieCategory.mocked,
                MovieCategory.mocked
            ])
        }
    }
}
