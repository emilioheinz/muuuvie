//
//  Webview.swift
//  Muuuvie
//
//  Created by Lucas Eduardo Backes on 06/12/20.
//
import Foundation
import SwiftUI
import WebKit

struct WebViewModel: UIViewRepresentable {
    var url: String

    func makeUIView(context: Context) -> WKWebView {
        guard let url = URL(string: self.url) else {
            return WKWebView()
        }

        let request = URLRequest(url: url)
        let wkWebview =  WKWebView()
        wkWebview.load(request)
        return wkWebview
    }

    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebViewModel>) {
    }
}
