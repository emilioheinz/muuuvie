//
//  View+UINavigationBarAppearence.swift
//  Muuuvie
//
//  Created by Emilio Heinzmann on 02/11/20.
//

import SwiftUI

extension View {
    func configureNavigationBarAppearence(isTranslucent: Bool = false) {
//        UINavigationBar.appearance().largeTitleTextAttributes = [
//            .foregroundColor: UIColor.black
//        ]
//        UINavigationBar.appearance().titleTextAttributes = [
//            .foregroundColor: UIColor.black
//        ]
        UINavigationBar.appearance().backgroundColor = .clear
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage =  UIImage()
        UINavigationBar.appearance().isTranslucent = true
    }
}
