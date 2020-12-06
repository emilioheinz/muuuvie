//
//  WebView.swift
//  Muuuvie
//
//  Created by Lucas Eduardo Backes on 06/12/20.
//

import SwiftUI

struct WebView: View {
    @Binding var isPresented: Bool
    
    var url: String?
    
    init(url: String, isPresented: Binding<Bool>) {
        self.url = url
        self._isPresented = isPresented
    }
    
    var body: some View {
        HStack(alignment: .top) {
            WebViewModel(url: self.url ?? "")
        }
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        WebView(url: "https://www.google.com", isPresented: .constant(true))
    }
}
