//
//  MuuuvieApp.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 29/10/20.
//

import SwiftUI

@main
struct MuuuvieApp: App {
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
        UITabBar.appearance().isTranslucent = false
    }
    
    var body: some Scene {
        WindowGroup {
            TabView {
                MovieCategoryListView()
                    .tabItem {
                        Image.houseFill
                        Text("MOVIES")
                    }
                MovieDetailView()
                    .tabItem {
                        Image.playIconFill
                        Text("TV")
                    }
            }
            .accentColor(.mainOrange)
        }
    }
}
