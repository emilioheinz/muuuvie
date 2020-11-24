//
//  Review.swift
//  Muuuvie
//
//  Created by Lucas Eduardo Backes on 31/10/20.
//
import Foundation

struct MovieReviewsApiReturnModel: Decodable {
    let reviews: [MovieReviewModel]
    
    enum CodingKeys: String, CodingKey {
        case reviews = "results"
    }
}

struct MovieReviewModel: Decodable, Identifiable {
    let id: String
    let author: String
    let content: String
    
    func getAvatar() -> String {
        let randomNumber: Int = Int.random(in: 1...100)
        
        return "https://robohash.org/\(randomNumber).png"
    }
    
    static var mocked: MovieReviewModel {
        MovieReviewModel(id: "identificador", author: "Sarah Green", content: "The French Revolution constituted for the conscience of the dominant aristocratic class a fall from innocence, and upturning of the natural chain of events that resounded all over Europe The French Revolution constituted for the conscience of the dominant aristocratic class a fall from innocence, and upturning of the natural chain of events that resounded all over Europe")
    }
}
