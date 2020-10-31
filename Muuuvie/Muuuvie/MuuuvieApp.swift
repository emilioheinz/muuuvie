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
            MuCard(
                imagePath: Movie.mocked.posterImagePath,
                title: Movie.mocked.title
            ).onTapGesture {
                print("I was pressed")
            }
            
            MuCard(
                imagePath: Movie.mocked.posterImagePath,
                title: Movie.mocked.title,
                cardType: .small
            ).onTapGesture {
                print("I was pressed 2")
            }
        }
    }
}
