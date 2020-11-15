//
//  Review.swift
//  Muuuvie
//
//  Created by Lucas Eduardo Backes on 31/10/20.
//
import Foundation

struct ReviewModel: Decodable {
    let author: String
    let review: String
    
    func getAvatar() -> String {
        let randomNumber: Int = Int.random(in: 1...100)
        
        return "https://robohash.org/\(randomNumber).png"
    }
    
    static var mocked: ReviewModel {
        ReviewModel(author: "Sarah Green", review: "The French Revolution constituted for the conscience of the dominant aristocratic class a fall from innocence, and upturning of the natural chain of events that resounded all over Europe The French Revolution constituted for the conscience of the dominant aristocratic class a fall from innocence, and upturning of the natural chain of events that resounded all over Europe")
    }
}
