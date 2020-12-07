//
//  VideoButtonView.swift
//  Muuuvie
//
//  Created by Lucas Eduardo Backes on 06/12/20.
//

import SwiftUI

struct VideoButtonView: View {
    @State private var shouldShowYoutube: Bool = false
    let movieVideos: [MovieVideoModel]
    var videoURL: String?

    init(movieVideos: [MovieVideoModel]) {
        self.movieVideos = movieVideos
        self.videoURL = getYoutubeVideo()
    }

    func openVideoWebView() -> Void {
        if videoURL != nil {
            shouldShowYoutube = true
        }
    }

    func getYoutubeVideo() -> String? {
        let videoIndex = movieVideos.firstIndex() { movieVideo in
            movieVideo.site == "YouTube"
        }

        if let index = videoIndex {
            return movieVideos[index].getVideoURL()
        }

        return nil
    }

    var body: some View {
        if self.videoURL != nil {
            IconButtonView(theme: .primary, image: .playIcon, action: openVideoWebView)
                .sheet(isPresented: $shouldShowYoutube) {
                    WebView(url: self.videoURL ?? "", isPresented: $shouldShowYoutube)
                }
        }
    }
}

struct VideoButtonView_Previews: PreviewProvider {
    static var previews: some View {
        VideoButtonView(movieVideos: [MovieVideoModel(site: "YouTube", key: "aqz-KE-bpKQ")])
    }
}
