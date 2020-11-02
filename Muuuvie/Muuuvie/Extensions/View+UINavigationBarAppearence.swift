//
//  View+UINavigationBarAppearence.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 02/11/20.
//

import SwiftUI

extension View {
    func configureNavigationBarAppearence() {
        let appearence = UINavigationBarAppearance()
        
        appearence.largeTitleTextAttributes = [
            .foregroundColor: UIColor.black
        ]
        appearence.titleTextAttributes = [
            .foregroundColor: UIColor.black
        ]
        appearence.backgroundColor = UIColor.white
        
        UINavigationBar.appearance().standardAppearance = appearence
        UINavigationBar.appearance().compactAppearance = appearence
    }
}
