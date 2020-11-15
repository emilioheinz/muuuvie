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
    }
    
    var body: some Scene {
        WindowGroup {
            TabView {
                MovieCategoryListView()
                    .tabItem {
                        Image.houseFill
                        Text("MOVIES")
                    }
                TVCategoriesListView()
                    .tabItem {
                        Image.tvFill
                        Text("TV")
                    }
            }
            .accentColor(.mainOrange)
        }
    }
}
