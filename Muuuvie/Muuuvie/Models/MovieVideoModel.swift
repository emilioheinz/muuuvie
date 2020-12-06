//
//  MovieVideo.swift
//  Muuuvie
//
//  Created by Lucas Eduardo Backes on 08/11/20.
//

import Foundation

struct VideosReturnModel: Decodable {
    let videos: [MovieVideoModel]
    
    enum CodingKeys: String, CodingKey {
        case videos = "results"
    }
}

struct MovieVideoModel: Decodable {
    let site: String?
    let key: String?
    
    func getVideoURL() -> URL {
        let videoURL = "https://www.youtube.com/watch?v=\(self.key ?? "")"

        return URL(string: videoURL)!
    }
}
